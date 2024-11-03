using ShopManager.DAL_.Models;
using ShopManager.BLL.Services;
using System.Windows;
using ShopManager.ViewModels;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using System.IO;

namespace ShopManager.Views
{
	public partial class AddProductWindow : Window

	{

		private readonly ProductService _productService;
		private readonly CategoryViewModel _categoryViewModel;

		public AddProductWindow()

		{
			InitializeComponent();
			_categoryViewModel = new CategoryViewModel();
			LoadCategories();
			LoadSizes(); 
			SizeComboBox.SelectedIndex = 0;
			_productService = new ProductService();
		}
		private void LoadCategories()
		{
			var categories = _categoryViewModel.GetCategory();



			CategoryCombobox.ItemsSource = categories;
			CategoryCombobox.DisplayMemberPath = "CategoryName";
			CategoryCombobox.SelectedValuePath = "CategoryId";
			CategoryCombobox.SelectedIndex = 0;



		}
		private void LoadSizes()
		{
			var sizes = new List<string> { "S", "M", "L", "XL" };
			SizeComboBox.ItemsSource = sizes;
		}

		private void AddProductButton_Click(object sender, RoutedEventArgs e)
		{
			
			var productCode = ProductCodeTextBox.Text;
			var productName = ProductNameTextBox.Text;
			var productPriceText = ProductPriceTextBox.Text;
			var quantityText = QuantityTextBox.Text;
			var categoryId = (int)CategoryCombobox.SelectedValue;
			var size = SizeComboBox.SelectedItem?.ToString() ?? "S";
			var productInfo = ProductInfoTextBox.Text;

			if (string.IsNullOrWhiteSpace(productCode) || string.IsNullOrWhiteSpace(productName))
			{
				MessageBox.Show("Vui lòng điền mã và tên sản phẩm.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			if (!decimal.TryParse(productPriceText, out decimal productPrice))
			{
				MessageBox.Show("Giá sản phẩm không hợp lệ.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			if (!int.TryParse(quantityText, out int quantity))
			{
				MessageBox.Show("Số lượng không hợp lệ.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			
			var newProduct = new Product
			{
				ProductCode = productCode,
				ProductName = productName,
				Price = productPrice,
				Quantity = quantity,
				CategoryId = categoryId,
				Size = size,
				ProductInfo = productInfo
			};

			
			bool isAdded = _productService.AddProduct(newProduct);

			if (isAdded)
			{
				
				if (!string.IsNullOrEmpty(_selectedImagePath))
				{
					
					string imagePath = SaveImageToDatabase(_selectedImagePath, newProduct.ProductId);
					newProduct.ImagePath = imagePath;

					
					_productService.UpdateProduct(newProduct);
				}

				MessageBox.Show("Thêm sản phẩm thành công!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
				this.Close(); 
			}
			else
			{
				MessageBox.Show("Có lỗi xảy ra khi thêm sản phẩm.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}


		private string SaveImageToDatabase(string imagePath, int productId)
		{
		
			string directory = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Images", productId.ToString());

			if (!Directory.Exists(directory))
			{
				Directory.CreateDirectory(directory);
			}

			string fileName = Path.GetFileName(imagePath);
			string destinationPath = Path.Combine(directory, fileName);

		
			File.Copy(imagePath, destinationPath, true);
			return destinationPath; 
		}


		private string _selectedImagePath;

		private void OnImageSelect(object sender, MouseButtonEventArgs e)
		{
			var openFileDialog = new Microsoft.Win32.OpenFileDialog
			{
				Filter = "Image Files (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png"
			};

			if (openFileDialog.ShowDialog() == true)
			{
				_selectedImagePath = openFileDialog.FileName;
				ProductImage.Source = new BitmapImage(new Uri(_selectedImagePath));
			}
		}

	
	}
}


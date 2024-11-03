using ShopManager.BLL.Services;
using ShopManager.DAL_.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Imaging;

namespace ShopManager.ViewModels
{
	public class ProductViewModel : INotifyPropertyChanged
	{
		private readonly ProductService _productService;
		private ObservableCollection<Product> _products;
		private ObservableCollection<BitmapImage> _productImages;
		private Product _selectedProduct;

	
		

		public ProductViewModel()
		{
			_productService = new ProductService();
			_products = new ObservableCollection<Product>();
			_productImages = new ObservableCollection<BitmapImage>();
			LoadAllProducts();

		}
	

	
		public ObservableCollection<Product> Products
		{
			get => _products;
			set
			{
				if (_products != value)
				{
					_products = value;
					OnPropertyChanged();
				}
			}
		}

	
		public ObservableCollection<BitmapImage> ProductImages
		{
			get => _productImages;
			set
			{
				if (_productImages != value)
				{
					_productImages = value;
					OnPropertyChanged();
				}
			}
		}

	
		public void LoadAllProducts()
		{
			try
			{
				var productList = _productService.GetAllProducts() ?? new List<Product>();
				UpdateProducts(productList);
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Lỗi khi tải sản phẩm: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

	
		public void LoadProductsByCategory(int categoryId)
		{
			try
			{
				if (categoryId == 0)
				{
					LoadAllProducts();
					return;
				}

				var productList = _productService.GetProductsByCategory(categoryId) ?? new List<Product>();
				UpdateProducts(productList);
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Lỗi khi tải sản phẩm theo danh mục: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		
		private void UpdateProducts(List<Product> products)
		{
			Products.Clear();
			foreach (var product in products)
			{
				Products.Add(product);
			}
		}



		
		public List<Product> GetProductsByFilters(int categoryId, decimal? minPrice, decimal? maxPrice, string keyword)
		{
			var products = categoryId == 0
				? _productService.GetAllProducts()
				: _productService.GetProductsByCategory(categoryId);

			if (minPrice.HasValue)
				products = products.Where(p => p.Price >= minPrice.Value).ToList();

			if (maxPrice.HasValue)
				products = products.Where(p => p.Price <= maxPrice.Value).ToList();

			if (!string.IsNullOrEmpty(keyword))
			{
				products = products.Where(p => p.ProductName.Contains(keyword, StringComparison.OrdinalIgnoreCase)).ToList();
			}

			return products;
		}

	


		public event PropertyChangedEventHandler? PropertyChanged;

		protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

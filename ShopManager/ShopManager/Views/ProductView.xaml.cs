using ShopManager.DAL_.Models;
using ShopManager.ViewModels;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace ShopManager.Views
{
	public partial class ProductView : UserControl
	{
		private readonly CategoryViewModel _categoryViewModel;
		private readonly ProductViewModel _productViewModel;

		public ProductView()
		{
			InitializeComponent();

		
			_categoryViewModel = new CategoryViewModel();
			_productViewModel = new ProductViewModel();
			DataContext = _productViewModel;

			LoadCategories(); 
			InitializeFilters();
		}

		private void InitializeFilters()
		{
			
			CategoryCombobox.SelectedIndex = 0;
			PriceFilterComboBox.SelectedIndex = 0;

			
			ApplyFilters();
		}

		private void LoadCategories()
		{
			var categories = _categoryViewModel.GetCategory();

			if (categories != null && categories.Count > 0)
			{
				var allCategories = new List<dynamic>
				{
					new { CategoryId = 0, CategoryName = "Tất cả sản phẩm" }
				};
				allCategories.AddRange(categories);

				CategoryCombobox.ItemsSource = allCategories;
				CategoryCombobox.DisplayMemberPath = "CategoryName";
				CategoryCombobox.SelectedValuePath = "CategoryId";
				CategoryCombobox.SelectedIndex = 0; 
			}
		
		}

		private void SearchTextBox_KeyDown(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter) 
			{
				ApplyFilters(); 
			}
		}

		private void ApplyFilters()
		{
			
			int categoryId = (int)(CategoryCombobox.SelectedValue ?? 0);
			int priceOption = PriceFilterComboBox.SelectedIndex;

			decimal? minPrice = null;
			decimal? maxPrice = null;

			
			switch (priceOption)
			{
				case 1:
					maxPrice = 100000;
					break;
				case 2:
					minPrice = 100000;
					maxPrice = 500000;
					break;
				case 3:
					minPrice = 500000;
					maxPrice = 1000000; 
					break;
				case 4:
					minPrice = 1000000; 
					break;
			}

		
			string keyword = SearchTextBox.Text.Trim();

			
			LoadProductsByFilters(categoryId, minPrice, maxPrice, keyword);
		}

		private void LoadProductsByFilters(int categoryId, decimal? minPrice, decimal? maxPrice, string keyword)
		{
			var filteredProducts = _productViewModel.GetProductsByFilters(categoryId, minPrice, maxPrice, keyword);
			ProductItemsControl.ItemsSource = filteredProducts;

	
		}


		private void CategoryCombobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			ApplyFilters();
		}

		private void PriceFilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			ApplyFilters();
		}

		private void AddButton_Click(object sender, RoutedEventArgs e)
		{
			AddProductWindow addProductWindow = new AddProductWindow();
			addProductWindow.ShowDialog(); 
		}

		private void ProductImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			
			var image = sender as Image;
			var product = image?.DataContext as Product;

			if (product != null)
			{
				
				ProductDetail productDetailWindow = new ProductDetail(product);
				productDetailWindow.ShowDialog(); 
			}
		}



	}
}

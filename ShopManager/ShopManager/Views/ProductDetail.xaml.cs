using Microsoft.Win32;
using ShopManager.BLL.Services;
using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;
using System;
using System.Windows;
using System.Windows.Input;

namespace ShopManager.Views
{
	public partial class ProductDetail : Window
	{
		private Product _product; 
		private ProductService _productService;

		public ProductDetail(Product product)
		{
			InitializeComponent();
			_product = product; 
			DataContext = _product; 
			_productService = new ProductService(); 
		}

		
		private void Window_MouseDown(object sender, MouseButtonEventArgs e)
		{
			if (e.LeftButton == MouseButtonState.Pressed)
			{
				this.DragMove();
			}
		}
		private void Image_Click(object sender, MouseButtonEventArgs e)
		{
			OpenFileDialog openFileDialog = new OpenFileDialog();
			openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png)|*.jpg;*.jpeg;*.png";
			if (openFileDialog.ShowDialog() == true)
			{
				_product.ImagePath = openFileDialog.FileName; 
															  
			}
		}

		
		private void CloseWindow(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void MinimizeWindow(object sender, RoutedEventArgs e)
		{
			this.WindowState = WindowState.Minimized;
		}

		
		private void UpdateProduct_Click(object sender, RoutedEventArgs e)
		{
			
			try
			{
				
				if (_product != null)
				{
					_productService.UpdateProduct(_product);
					MessageBox.Show($"Sản phẩm '{_product.ProductName}' đã được cập nhật!", "Cập nhật thành công", MessageBoxButton.OK, MessageBoxImage.Information);
				}
				else
				{
					MessageBox.Show("Không thể cập nhật vì không có thông tin sản phẩm.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Lỗi khi cập nhật sản phẩm: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}


		private void DeleteProduct_Click(object sender, RoutedEventArgs e)
		{
			var result = MessageBox.Show("Bạn có chắc muốn xóa sản phẩm này?", "Xác nhận", MessageBoxButton.YesNo, MessageBoxImage.Warning);
			if (result == MessageBoxResult.Yes)
			{
				try
				{
				
					if (_product != null)
					{
						_productService.DeleteProduct(_product.ProductId);
						MessageBox.Show("Sản phẩm đã được xóa thành công!", "Xóa thành công", MessageBoxButton.OK, MessageBoxImage.Information);
						this.Close();
					}
					else
					{
						MessageBox.Show("Không thể xóa vì không có thông tin sản phẩm.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
					}
				}
				catch (Exception ex)
				{
					MessageBox.Show($"Lỗi khi xóa sản phẩm: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}

	}
}

using ShopManager.BLL_.Services;
using ShopManager.DAL_.Models;
using ShopManager.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace ShopManager.Views
{
	/// <summary>
	/// Interaction logic for OrderListUserControl.xaml
	/// </summary>
	public partial class OrderListUserControl : UserControl
	{
		private OrderViewModel _orderViewModel;

		public OrderListUserControl()
		{
			InitializeComponent();
			_orderViewModel = new OrderViewModel();  
			DataContext = _orderViewModel; 

			LoadOrders();  
		}

		
		private void AddOrder_click(object sender, RoutedEventArgs e)
		{
			InvoiceWindow invoiceWindow = new InvoiceWindow(); 
			invoiceWindow.ShowDialog();  

			LoadOrders();  
		}

	
		private void LoadOrders()
		{
			_orderViewModel.LoadAllOrder(); 
		}
		private void DeleteOrderButton_Click(object sender, RoutedEventArgs e)
		{
			
			var button = sender as Button;
			var order = button?.DataContext as Order;

			if (order != null)
			{
				var result = MessageBox.Show($"Bạn có chắc muốn xóa đơn hàng có ID {order.OrderId}?",
											 "Xác nhận xóa", MessageBoxButton.YesNo, MessageBoxImage.Warning);

				if (result == MessageBoxResult.Yes)
				{
					try
					{
						var orderService = new OrderService();
						bool isDeleted = orderService.DeleteOrder(order.OrderId);

						if (isDeleted)
						{
							MessageBox.Show("Đơn hàng đã được xóa thành công.", "Thành công", MessageBoxButton.OK, MessageBoxImage.Information);

							
							_orderViewModel.Orders.Remove(order);
						}
						else
						{
							MessageBox.Show("Không tìm thấy đơn hàng để xóa.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
						}
					}
					catch (Exception ex)
					{
						MessageBox.Show("Có lỗi xảy ra khi xóa đơn hàng: " + ex.Message, "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
					}
				}
			}
			else
			{
				MessageBox.Show("Vui lòng chọn một đơn hàng để xóa.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
			}
		}


	}
}

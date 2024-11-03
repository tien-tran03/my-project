using ShopManager.BLL_.Services;
using ShopManager.DAL_.Models;
using ShopManager;
using System.Collections.ObjectModel;

public class OrderViewModel
{
	private readonly OrderService _orderService;

	public ObservableCollection<Order> Orders { get; set; } = new ObservableCollection<Order>();

	public OrderViewModel()
	{
		_orderService = new OrderService();
		LoadAllOrder();  
	}

	public void LoadAllOrder()
	{
		try
		{
			var orders = _orderService.GetAllOrderByUserId(App.CurrentUserId);

			
			Orders.Clear();

			foreach (var order in orders)
			{
				Orders.Add(order);  
			}

			if (Orders.Count == 0)
			{
				System.Windows.MessageBox.Show("Không có đơn hàng nào!");
			}
		}
		catch (Exception ex)
		{
			System.Windows.MessageBox.Show("Lỗi khi tải đơn hàng: " + ex.Message);
		}
	}
}

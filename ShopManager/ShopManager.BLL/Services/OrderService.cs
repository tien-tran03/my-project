using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using static ShopManager.DAL_.Repositories.OrdersRepository;

namespace ShopManager.BLL_.Services
{
	public class OrderService
	{
		private readonly OrdersRepository _ordersRepository;

		// Constructor mặc định, khởi tạo OrdersRepository
		public OrderService()
		{
			_ordersRepository = new OrdersRepository();
		}

		// Constructor cho dependency injection (DI)
		public OrderService(OrdersRepository ordersRepository)
		{
			_ordersRepository = ordersRepository;
		}

		// Hàm lấy tất cả đơn hàng theo UserId
		public List<Order> GetAllOrderByUserId(int userId)
		{
			try
			{
				var allOrders = _ordersRepository.GetAllOrder();
				var userOrders = allOrders.Where(x => x.UserId == userId).ToList();
				return userOrders;
			}
			catch (Exception ex)
			{
				throw new Exception("Lỗi khi lấy đơn hàng theo UserId: " + ex.Message);
			}
		}

	
		public bool AddOrderWithDetails(Order order, List<OrderDetail> orderDetails)
		{
			try
			{
				return _ordersRepository.AddOrderWithDetails(order, orderDetails);
			}
			catch (Exception ex)
			{
				throw new Exception("Lỗi khi thêm đơn hàng và chi tiết đơn hàng: " + ex.Message);
			}
		}

		

		public bool DeleteOrder(int orderId)
		{
			try
			{
				return _ordersRepository.DeleteOrder(orderId);
			}
			catch (Exception ex)
			{
				throw new Exception("Lỗi khi xóa đơn hàng: " + ex.Message);
			}
		}

		public List<MonthlyRevenue> GetMonthlyRevenue()
		{
			return _ordersRepository.GetMonthlyRevenue();  
		}
		public int GetDailyOrderCount(DateTime date)
		{
			return _ordersRepository.GetDailyOrderCount(date);
		}

	
		public decimal GetDailyRevenue(DateTime date)
		{
			return _ordersRepository.GetDailyRevenue(date);
		}

	
		public int GetDailyProductCount(DateTime date)
		{
			return _ordersRepository.GetDailyProductCount(date);
		}
		public int GetDailyOrderCount(DateTime date, int userId)
		{
			return _ordersRepository.GetDailyOrderCount(date, userId);
		}

		public decimal GetDailyRevenue(DateTime date, int userId)
		{
			return _ordersRepository.GetDailyRevenue(date, userId);
		}

		public int GetDailyProductCount(DateTime date, int userId)
		{
			return _ordersRepository.GetDailyProductCount(date, userId);
		}
		public List<YearlyRevenue> GetYearRevenue()
		{
			return _ordersRepository.GetYearlyRevenue();
		}

	}
}

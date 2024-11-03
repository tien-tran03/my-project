using ShopManager.DAL_.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ShopManager.DAL_.Repositories
{
	public class OrdersRepository
	{
		private readonly ProjectPrnContext _context;

		public OrdersRepository()
		{
			_context = new ProjectPrnContext();
		}

	
		public List<Order> GetAllOrder()
		{
			try
			{
				return _context.Orders.ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Lỗi khi lấy danh sách đơn hàng: " + ex.Message);
			}
		}

		
		public bool SaveChanges()
		{
			return _context.SaveChanges() > 0;
		}

		
		public bool AddOrderWithDetails(Order order, List<OrderDetail> orderDetails)
		{
			using (var transaction = _context.Database.BeginTransaction())
			{
				try
				{
					_context.Orders.Add(order);
					_context.SaveChanges();

					
					foreach (var detail in orderDetails)
					{
						detail.OrderId = order.OrderId;
						_context.OrderDetails.Add(detail);
					}

					_context.SaveChanges();
					transaction.Commit();
					return true;
				}
				catch (Exception ex)
				{
					transaction.Rollback();
					Console.WriteLine("Lỗi: " + ex.Message);
					return false;
				}
			}
		}

		
		public bool DeleteOrder(int orderId)
		{
			using (var transaction = _context.Database.BeginTransaction())
			{
				try
				{
					var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);

					if (order != null)
					{
						
						_context.OrderDetails.RemoveRange(
							_context.OrderDetails.Where(od => od.OrderId == orderId)
						);

						
						_context.Orders.Remove(order);
						_context.SaveChanges();

						transaction.Commit();
						return true;
					}
					return false;
				}
				catch (Exception ex)
				{
					transaction.Rollback();
					throw new Exception("Lỗi khi xóa đơn hàng: " + ex.Message);
				}
			}
		}

		public int GetDailyOrderCount(DateTime date)
		{
			return _context.Orders.Count(o => o.OrderDate.Date == date.Date);
		}

		
		public decimal GetDailyRevenue(DateTime date)
		{
			return _context.Orders
						   .Where(o => o.OrderDate.Date == date.Date)
						   .Sum(o => o.FinalAmount);
		}

		
		public int GetDailyProductCount(DateTime date)
		{
			return (from o in _context.Orders
					join od in _context.OrderDetails on o.OrderId equals od.OrderId
					where o.OrderDate.Date == date.Date
					select od.Quantity).Sum();
		}
		public int GetDailyOrderCount(DateTime date, int userId)
		{
			return _context.Orders
						   .Count(o => o.OrderDate.Date == date.Date && o.UserId == userId);
		}
		public decimal GetDailyRevenue(DateTime date, int userId)
		{
			return _context.Orders
						   .Where(o => o.OrderDate.Date == date.Date && o.UserId == userId)
						   .Sum(o => o.FinalAmount);
		}
		public int GetDailyProductCount(DateTime date, int userId)
		{
			return (from o in _context.Orders
					join od in _context.OrderDetails on o.OrderId equals od.OrderId
					where o.OrderDate.Date == date.Date && o.UserId == userId
					select od.Quantity).Sum();
		}



		public class DailyRevenue
		{
			public DateTime OrderDate { get; set; }
			public decimal TotalRevenue { get; set; }
			public int TotalProductsSold { get; set; }
		}
		public List<MonthlyRevenue> GetMonthlyRevenue()
		{
			return (from o in _context.Orders
					group o by new { o.OrderDate.Year, o.OrderDate.Month } into g
					select new MonthlyRevenue
					{
						Year = g.Key.Year,
						Month = g.Key.Month,
						TotalRevenue = g.Sum(x => x.FinalAmount)
					}).ToList();
		}

		
		public class MonthlyRevenue
		{
			public int Year { get; set; }
			public int Month { get; set; }
			public decimal TotalRevenue { get; set; }
		}
		public class YearlyRevenue
		{
			public int Year { get; set; }
			public decimal TotalRevenue { get; set; }
		}
		public List<YearlyRevenue> GetYearlyRevenue()
		{
			
				var yearlyRevenue = _context.Orders
					.GroupBy(order => order.OrderDate.Year)
					.Select(group => new YearlyRevenue
					{
						Year = group.Key,
						TotalRevenue = group.Sum(order => order.FinalAmount)
					})
					.OrderBy(revenue => revenue.Year)
					.ToList();

				return yearlyRevenue;
			}
		}

	}


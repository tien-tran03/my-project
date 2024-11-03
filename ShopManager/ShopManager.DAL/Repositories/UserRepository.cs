using ShopManager.DAL_.Models;
using System.Linq;
using System.Windows;

namespace ShopManager.DAL_.Repositories
{
	public class UserRepository
	{
		private readonly ProjectPrnContext _context;

		public UserRepository()
		{
			_context = new ProjectPrnContext();
		}

		
		public User? GetUser(string username, string password)
		{
			return _context.Users
				.FirstOrDefault(u => u.Username == username && u.PasswordHash == password);
		}




		public User GetUserById(int userId)
		{
			return _context.Users.FirstOrDefault(u => u.UserId == userId);
		}

		public bool ValidateOldPassword(int userId, string oldPasswordHash)
		{
			return _context.Users.Any(u => u.UserId == userId && u.PasswordHash == oldPasswordHash);
		}

		public void UpdateUserPassword(int userId, string newPasswordHash)
		{
			var user = _context.Users.FirstOrDefault(u => u.UserId == userId);
			if (user != null)
			{
				user.PasswordHash = newPasswordHash;
				_context.SaveChanges();
			}
		}
		public List<User> GetEmployees()
		{
			return _context.Users.Where(u => u.Role == UserRoles.Employee).ToList();
		}
		public void AddEmployee(User employee)
		{
			employee.Role = UserRoles.Employee;
			_context.Users.Add(employee);
			_context.SaveChanges();
		}
		public void DeleteEmployee(int employeeId)
		{
			using (var transaction = _context.Database.BeginTransaction())
			{
				try
				{
				
					var employee = _context.Users.FirstOrDefault(e => e.UserId == employeeId);
					if (employee != null)
					{
						
						var relatedOrders = _context.Orders.Where(o => o.UserId == employeeId).ToList();
						if (relatedOrders.Any())
						{
							_context.Orders.RemoveRange(relatedOrders);
						}

						
						_context.Users.Remove(employee);

						
						_context.SaveChanges();

						
						transaction.Commit();
					
					}
					
				}
				catch (Exception ex)
				{
					
					transaction.Rollback();
					
				}
			}
		}

		public static class UserRoles
		{
			public const string Admin = "1";
			public const string Employee = "2";
		}

	}
}

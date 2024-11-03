
using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;
using static ShopManager.DAL_.Repositories.UserRepository;

namespace ShopManager.BLL_.Services
{
	public class UserService
	{
		private readonly UserRepository _userRepository;

		public UserService()
		{
			_userRepository = new UserRepository();
		}

	
		public User? GetUserByUsernameAndPassword(string username, string password)
		{
			return _userRepository.GetUser(username, password);
		}



		public bool ChangePassword(int userId, string oldPassword, string newPassword)
		{
			
			if (!_userRepository.ValidateOldPassword(userId, oldPassword))
			{
				return false; 
			}

			_userRepository.UpdateUserPassword(userId, newPassword);

			return true;
		}
		public List<User> GetEmployees()
		{
			return _userRepository.GetEmployees();
		}

		public void AddEmployee(string username, string password)
		{
			var newEmployee = new User
			{
				Username = username,
				PasswordHash = password,
				Role = UserRoles.Employee 
			};
			_userRepository.AddEmployee(newEmployee);
		}


		public void DeleteEmployee(int employeeId)
		{
			_userRepository.DeleteEmployee(employeeId);
		}

	}
}

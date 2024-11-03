using ShopManager.DAL_.Models;
using ShopManager.BLL_.Services;
using ShopManager.BLL.Services;

namespace ShopManager.ViewModels
{
	public class LoginViewModel
	{
		private readonly UserService _userService;

		public LoginViewModel()
		{
			_userService = new UserService();
		}

	
		public User? Login(string username, string password)
		{
			return _userService.GetUserByUsernameAndPassword(username, password);
		}
	}
}

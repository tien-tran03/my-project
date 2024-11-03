using ShopManager.DAL_.Models;
using ShopManager.ViewModels;
using System.Windows;
using System.Windows.Input;

namespace ShopManager.Views
{
	public partial class LoginWindow : Window
	{
		private LoginViewModel _viewModel;

		public LoginWindow()
		{
			InitializeComponent();
			_viewModel = new LoginViewModel();
		}

		private void btnLogin_Click(object sender, RoutedEventArgs e)
		{
			string username = txtUsername.Text;
			string password = txtPassword.Password;

			
			User? user = _viewModel.Login(username, password);

			if (user != null) 
			{
				
				App.CurrentUserId = user.UserId;
				App.CurrentUsername = user.Username;

				
				if (int.TryParse(user.Role, out int role))
				{
					App.CurrentUserRole = role;

					
					switch (role)
					{
						case 1: 
							var staffWindow1	 = new AdminWindow();
							staffWindow1.Show();
							break;

						case 2: 
							var staffWindow = new StaffWindow();
							staffWindow.Show();
							break;

						default:
							MessageBox.Show("Vai trò không hợp lệ!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
							break;
					}
				}
				else
				{
					MessageBox.Show("Lỗi chuyển đổi vai trò!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				}

				this.Close(); 
			}
			else
			{
				MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}


		private void btnMinimize_Click(object sender, RoutedEventArgs e)
		{
			this.WindowState = WindowState.Minimized;
		}

		private void btnClose_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void Window_MouseDown(object sender, MouseButtonEventArgs e)
		{
			if (e.ChangedButton == MouseButton.Left)
			{
				this.DragMove(); 
			}
		}
	}
}

using ShopManager.BLL_.Services;
using System.Windows;
using System.Windows.Input;

namespace ShopManager.Views
{
	public partial class ChangePass : Window
	{
		private UserService _userService;

		public ChangePass()
		{
			InitializeComponent();
			_userService = new UserService(); 
		}

		
		private void ChangePassword_Click(object sender, RoutedEventArgs e)
		{
			
			string oldPassword = OldPasswordBox.Password;
			string newPassword = NewPasswordBox.Password;
			string confirmPassword = ConfirmPasswordBox.Password;

			
			if (newPassword != confirmPassword)
			{
				MessageBox.Show("Mật khẩu mới và xác nhận mật khẩu không khớp.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

		
			if (string.IsNullOrEmpty(oldPassword))
			{
				MessageBox.Show("Vui lòng nhập mật khẩu cũ.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			
			int userId = App.CurrentUserId;  // Đảm bảo CurrentUserId đã được khởi tạo khi đăng nhập

			
			bool isPasswordChanged = _userService.ChangePassword(userId, oldPassword, newPassword);

			if (isPasswordChanged)
			{
				MessageBox.Show("Mật khẩu đã được thay đổi thành công.", "Thành công", MessageBoxButton.OK, MessageBoxImage.Information);
				this.Close();  // Đóng cửa sổ sau khi thành công
			}
			else
			{
				MessageBox.Show("Mật khẩu cũ không đúng hoặc không thể thay đổi mật khẩu.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

	
		private void CloseWindow_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void Window_MouseDown(object sender, MouseButtonEventArgs e)
		{
			if (e.LeftButton == MouseButtonState.Pressed)
			{
				this.DragMove(); 
			}
		}
	}
}

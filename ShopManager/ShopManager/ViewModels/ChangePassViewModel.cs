using ShopManager.BLL_.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace ShopManager.ViewModels
{
	public class ChangePasswordViewModel : INotifyPropertyChanged
	{
		private readonly UserService _userService;
		private string _oldPassword;
		private string _newPassword;
		private string _confirmPassword;

		public ChangePasswordViewModel(UserService userService)
		{
			_userService = userService;
		
		}

		public string OldPassword
		{
			get => _oldPassword;
			set
			{
				_oldPassword = value;
				OnPropertyChanged(nameof(OldPassword));
			}
		}

		public string NewPassword
		{
			get => _newPassword;
			set
			{
				_newPassword = value;
				OnPropertyChanged(nameof(NewPassword));
			}
		}

		public string ConfirmPassword
		{
			get => _confirmPassword;
			set
			{
				_confirmPassword = value;
				OnPropertyChanged(nameof(ConfirmPassword));
			}
		}

		public ICommand ChangePasswordCommand { get; }

		private void ChangePassword()
		{
			
			if (NewPassword != ConfirmPassword)
			{
				
				MessageBox.Show("Mật khẩu mới và xác nhận mật khẩu không khớp.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			
			int userId = App.CurrentUserId;

			
			bool isPasswordChanged = _userService.ChangePassword(userId, OldPassword, NewPassword);

			if (isPasswordChanged)
			{
				MessageBox.Show("Mật khẩu đã được thay đổi thành công.", "Thành công", MessageBoxButton.OK, MessageBoxImage.Information);
			}
			else
			{
				MessageBox.Show("Mật khẩu cũ không đúng.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		public event PropertyChangedEventHandler PropertyChanged;

		protected void OnPropertyChanged(string propertyName)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

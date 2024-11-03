using ShopManager.BLL_.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ShopManager.Views
{
    /// <summary>
    /// Interaction logic for AddEmployeeWindow.xaml
    /// </summary>
    public partial class AddEmployeeWindow : Window
    {
		private readonly UserService _userService;

		public AddEmployeeWindow()
		{
			InitializeComponent();
			_userService = new UserService();
			LoadEmployees(); 
			
		}

		// Tải danh sách nhân viên từ cơ sở dữ liệu
		private void LoadEmployees()
		{
			EmployeeListView.ItemsSource = _userService.GetEmployees();
		}

		// Xử lý sự kiện thêm nhân viên
		private void AddEmployee_Click(object sender, RoutedEventArgs e)
		{
			var username = txtUsername.Text.Trim();
			var password = "123";

			if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
			{
				MessageBox.Show("Vui lòng nhập tên tài khoản và mật khẩu.");
				return;
			}

			_userService.AddEmployee(username, password); 
			LoadEmployees(); 
			txtUsername.Clear();
			
			MessageBox.Show("Nhân viên mới đã được thêm.");
		}

	
		private void DeleteEmployee_Click(object sender, RoutedEventArgs e)
		{
			if (sender is Button button && int.TryParse(button.Tag.ToString(), out int employeeId))
			{
				_userService.DeleteEmployee(employeeId); 
				LoadEmployees();
				MessageBox.Show("Nhân viên đã được xóa.");
			}
		}
	}
}


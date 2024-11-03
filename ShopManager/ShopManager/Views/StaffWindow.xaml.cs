using System.Windows;
using ShopManager.Views; 

namespace ShopManager.Views
{
	public partial class StaffWindow : Window
	{
		public StaffWindow()
		{
			InitializeComponent();
			
			ContentArea.Content = new HomeView();
			txtUsername.Text = App.CurrentUsername;

			
			if (App.CurrentUserRole == 1)
			{
				txtRole.Text = "Người Quản Lý";
			}
			else if (App.CurrentUserRole == 2)
			{
				txtRole.Text = "Nhân Viên";
			}
		}

		private void Home_Click(object sender, RoutedEventArgs e)
		{
			
			ContentArea.Content = new HomeView();
		}

		private void Product_Click(object sender, RoutedEventArgs e)
		{
			
			ContentArea.Content = new ProductView();
		}

		private void Order_Click(object sender, RoutedEventArgs e)
		{
			ContentArea.Content = new OrderListUserControl();
		}

		private void OpenPasswordChangeWindow_Click(object sender, RoutedEventArgs e)
		{
			ChangePass changepass = new ChangePass();
			changepass.ShowDialog();
		}

		private void Logout_click(object sender, RoutedEventArgs e)
		{
			
			App.CurrentUserId = 0; 

			
			LoginWindow loginWindow = new LoginWindow();
			loginWindow.Show();

			
			this.Close();
		}

	}
}

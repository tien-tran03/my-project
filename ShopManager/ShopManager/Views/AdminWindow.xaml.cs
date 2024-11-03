using ShopManager.ViewModels;
using System.Windows;

namespace ShopManager.Views
{
	public partial class AdminWindow : Window
	{
		private readonly HomeViewModel _homeViewModel;

		public AdminWindow()
		{
			InitializeComponent();
			_homeViewModel = new HomeViewModel();
			DataContext = _homeViewModel; 
		}

		private void ExportToExcel_Click(object sender, RoutedEventArgs e)
		{
			_homeViewModel.ExportToExcel(); 
		}


		private void ManageButton_Click(object sender, RoutedEventArgs e)
		{
			AddEmployeeWindow addEmployeeWindow = new AddEmployeeWindow();
			addEmployeeWindow.ShowDialog(); 
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

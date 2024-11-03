using System.Windows.Controls;
using ShopManager.ViewModels;

namespace ShopManager.Views
{
	public partial class HomeView : UserControl
	{
		public HomeView()
		{
			InitializeComponent();
			DataContext = new HomeViewModel(); 
		}
	}
}

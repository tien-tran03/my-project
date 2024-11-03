using System.Configuration;
using System.Data;
using System.Windows;

namespace ShopManager
{
	/// <summary>
	/// Interaction logic for App.xaml
	/// </summary>
	public partial class App : Application
	{
		public static string CurrentUsername { get; set; } = string.Empty;
		public static int CurrentUserRole { get; set; } = -1;
		public static int CurrentUserId { get; set; } = -1;  
	}

}

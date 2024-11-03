using ShopManager.DAL_.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace ShopManager.ViewModels
{
	public class InvoiceViewModel : INotifyPropertyChanged
	{
		private ObservableCollection<InvoiceProduct> _invoiceProducts;

		public InvoiceViewModel()
		{
			_invoiceProducts = new ObservableCollection<InvoiceProduct>();
		}

		public ObservableCollection<InvoiceProduct> InvoiceProducts
		{
			get => _invoiceProducts;
			set
			{
				_invoiceProducts = value;
				OnPropertyChanged();
			}
		}

		public void AddProduct(InvoiceProduct product)
		{
			InvoiceProducts.Add(product);  
		}

		public event PropertyChangedEventHandler? PropertyChanged;

		protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
	}

	public class InvoiceProduct
	{
		public string MaSP { get; set; }
		public string TenSP { get; set; }
		public string Size { get; set; }
		public int SoLuong { get; set; }
		public decimal ThanhTien { get; set; }
	}
}

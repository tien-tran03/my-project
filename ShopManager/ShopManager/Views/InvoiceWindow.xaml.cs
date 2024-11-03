using ShopManager.BLL.Services;
using ShopManager.BLL_.Services;
using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;
using ShopManager.ViewModels;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
	/// Interaction logic for InvoiceWindow.xaml
	/// </summary>
	public partial class InvoiceWindow : Window
	{
		private ProductViewModel _productViewModel;
		private ProductService _productservice;
		private ObservableCollection<Product> _invoiceItems;
		private string temporaryOrderId;

		public InvoiceWindow()
		{
			InitializeComponent();
			_productViewModel = new ProductViewModel();
			_productservice = new ProductService();	
			DataContext = _productViewModel;
			textUsername.Text = App.CurrentUsername;
			UpdateDateTime();
			GenerateTemporaryOrderId();
		}

		private void ProductComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (ProductComboBox.SelectedItem is Product selectedProduct)
			{
				ProductPriceTextBox.Text = selectedProduct.Price.ToString("N0");
			}
		}

		private void QuantityTextBox_TextChanged(object sender, TextChangedEventArgs e)
		{
		
		}

		private void DiscountTextBox_TextChanged(object sender, TextChangedEventArgs e)
		{
			
		}

		private void AddProductButton_Click(object sender, RoutedEventArgs e)
		{
			if (ProductComboBox.SelectedItem is Product selectedProduct)
			{
				int quantity = int.TryParse(QuantityTextBox.Text, out var qty) ? qty : 0;
				decimal discountRate = decimal.TryParse(DiscountTextBox.Text.TrimEnd('%'), out var discount) ? discount / 100 : 0;

				decimal originalTotal = selectedProduct.Price * quantity;
				decimal discountAmount = originalTotal * discountRate;
				decimal finalTotal = originalTotal - discountAmount;

				var productDetail = new
				{
					MaSP = selectedProduct.ProductId,
					TenSP = selectedProduct.ProductName,
					Size = selectedProduct.Size,
					SoLuong = quantity,
					ThanhTienGoc = originalTotal,
					GiamGia = discountAmount,
					ThanhTien = finalTotal.ToString("N0") + " VND"
				};

				ProductDataGrid.Items.Add(productDetail);
				UpdateTotalAmount();
			}
		}

		private void UpdateTotalAmount()
		{
			decimal totalOriginalAmount = 0;
			decimal totalDiscountAmount = 0;
			decimal totalAmount = 0;

			foreach (dynamic item in ProductDataGrid.Items)
			{
				totalAmount += decimal.Parse(item.ThanhTien.Replace(" VND", "").Replace(",", ""));
				totalOriginalAmount += item.ThanhTienGoc;
				totalDiscountAmount += item.GiamGia;
			}

			OriginalTotalTextBlock.Text = $"{totalOriginalAmount:N0} VND";
			DiscountAmout.Text = $"{totalDiscountAmount:N0} VND";
			FinalTotalTextBlock.Text = $"{totalAmount:N0} VND";
		}



		private void PrintInvoice()
		{
			PrintDialog printDialog = new PrintDialog();

			if (printDialog.ShowDialog() == true)
			{
				FlowDocument invoiceDocument = CreateInvoiceDocument();
				IDocumentPaginatorSource documentPaginator = invoiceDocument;
				printDialog.PrintDocument(documentPaginator.DocumentPaginator, "Hóa Đơn");
			}
		}

		private void PrintFlowDocument(FlowDocument document)
		{
			PrintDialog printDialog = new PrintDialog();

			if (printDialog.ShowDialog() == true)
			{
				document.PageWidth = printDialog.PrintableAreaWidth;
				document.PageHeight = printDialog.PrintableAreaHeight;
				document.PagePadding = new Thickness(50);

				IDocumentPaginatorSource paginator = document as IDocumentPaginatorSource;
				printDialog.PrintDocument(paginator.DocumentPaginator, "In hóa đơn");
			}
		}

		private void ShowPreview(FlowDocument document)
{
    Window previewWindow = new Window
    {
        Title = "Xem trước hóa đơn",
        Width = 800,
        Height = 600,
        Content = new FlowDocumentScrollViewer
        {
            Document = document,
            VerticalScrollBarVisibility = ScrollBarVisibility.Auto
        }
    };

    previewWindow.ShowDialog();
}


		private FlowDocument CreateInvoiceDocument()
		{
			FlowDocument document = new FlowDocument();

			Paragraph header = new Paragraph(new Run("HÓA ĐƠN MUA HÀNG"))
			{
				FontSize = 22,
				FontWeight = FontWeights.Bold,
				TextAlignment = TextAlignment.Center
			};
			document.Blocks.Add(header);
		
			Paragraph orderIdParagraph = new Paragraph();
			orderIdParagraph.Inlines.Add(new Run($"Số Hóa Đơn: {temporaryOrderId}"));
			orderIdParagraph.Margin = new Thickness(0, 5, 0, 5);
			document.Blocks.Add(orderIdParagraph);
			Paragraph customerInfo = new Paragraph();
			customerInfo.Inlines.Add(new Run("Địa chỉ: FPT Uni"));
			
			customerInfo.Inlines.Add(new LineBreak());
			customerInfo.Inlines.Add(new Run("SĐT: 03947384739"));
			customerInfo.Inlines.Add(new LineBreak());
			customerInfo.Inlines.Add(new Run("Ngày: " + System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss")));
			customerInfo.Margin = new Thickness(0, 10, 0, 10);
			document.Blocks.Add(customerInfo);

			document.Blocks.Add(new BlockUIContainer(new System.Windows.Shapes.Line
			{
				X1 = 0,
				X2 = 500,
				StrokeThickness = 1,
				Stroke = Brushes.Black,
				Margin = new Thickness(0, 0, 0, 10)
			}));

			Paragraph productDetails = new Paragraph { FontSize = 14, FontWeight = FontWeights.Bold };
			productDetails.Inlines.Add(new Run("Tên sản phẩm".PadRight(30) + "Giá"));
			productDetails.Inlines.Add(new LineBreak());
			productDetails.Inlines.Add(new Run("------------------------------------"));
			productDetails.Inlines.Add(new LineBreak());

			foreach (dynamic item in ProductDataGrid.Items)
			{
				productDetails.Inlines.Add(new Run($"{item.TenSP} x {item.SoLuong}".PadRight(30) + $"{item.ThanhTien:N0} VND"));
				productDetails.Inlines.Add(new LineBreak());
			}

			document.Blocks.Add(productDetails);

			Paragraph totalAmount = new Paragraph
			{
				FontSize = 14,
				FontWeight = FontWeights.Bold,
				TextAlignment = TextAlignment.Right,
				Margin = new Thickness(0, 10, 0, 10)
			};
			totalAmount.Inlines.Add(new Run($"Tổng cộng: {FinalTotalTextBlock.Text} VND"));
			totalAmount.Inlines.Add(new LineBreak());
			totalAmount.Inlines.Add(new Run($"Số tiền phải trả: {FinalTotalTextBlock.Text} VND"));
			document.Blocks.Add(totalAmount);

			Paragraph footer = new Paragraph { FontSize = 12, TextAlignment = TextAlignment.Center };
			footer.Inlines.Add(new Run("Địa chỉ: Hòa lạc"));
			footer.Inlines.Add(new LineBreak());
			footer.Inlines.Add(new Run("Liên hệ: 0321-0454041 OR 0321-6228321"));
			document.Blocks.Add(footer);

			Paragraph thanks = new Paragraph(new Run("Cảm ơn quý khách đã mua hàng!"))
			{
				FontSize = 16,
				FontWeight = FontWeights.Bold,
				TextAlignment = TextAlignment.Center,
				Margin = new Thickness(0, 10, 0, 10)
			};
			document.Blocks.Add(thanks);

			document.Blocks.Add(new BlockUIContainer(new System.Windows.Shapes.Line
			{
				X1 = 0,
				X2 = 500,
				StrokeThickness = 1,
				Stroke = Brushes.Black,
				Margin = new Thickness(0, 10, 0, 0)
			}));

			document.PagePadding = new Thickness(20);
			document.PageWidth = 500;
			document.PageHeight = 600;
			document.FontFamily = new FontFamily("Courier New");

			return document;
		}

	
		private void UpdateDateTime()
		{
			DateTimeTextBox.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm tt");
		}

		private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
		{

		}

		private void OrderIdTextBox_TextChanged(object sender, TextChangedEventArgs e)
		{
		
		}
		private void GenerateTemporaryOrderId()
		{
			Random random = new Random();
			temporaryOrderId = random.Next(100000, 999999).ToString();  

			
			OrderIdTextBox.Text = temporaryOrderId;
		}
		private void InvoiceWindow_Closed(object sender, EventArgs e)
		{
		
			temporaryOrderId = string.Empty;
			OrderIdTextBox.Text = string.Empty;
		}

		private void PayButton_Click(object sender, RoutedEventArgs e)
		{
			if (ProductDataGrid.Items.Count == 0)
			{
				MessageBox.Show("Không thể thanh toán! Vui lòng thêm sản phẩm vào hóa đơn.",
								"Lỗi", MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			var order = new Order
			{
				UserId = App.CurrentUserId,
				OrderDate = DateTime.Now,
				TotalAmount = Convert.ToDecimal(OriginalTotalTextBlock.Text.Replace(" VND", "").Replace(",", "")),
				DiscountAmount = Convert.ToDecimal(DiscountAmout.Text.Replace(" VND", "").Replace(",", "")),
				FinalAmount = Convert.ToDecimal(FinalTotalTextBlock.Text.Replace(" VND", "").Replace(",", ""))
			};

			var orderDetails = new List<OrderDetail>();
			

			foreach (dynamic item in ProductDataGrid.Items)
			{
				int productId = item.MaSP;
				int requestedQuantity = item.SoLuong;

				
				var product = _productservice.GetProductById(productId);
				if (product == null)
				{
					MessageBox.Show($"Sản phẩm với mã {productId} không tồn tại.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
					return;
				}

				if (requestedQuantity > product.Quantity)
				{
					MessageBox.Show($"Số lượng yêu cầu cho sản phẩm '{product.ProductName}' vượt quá số lượng hiện có ({product.Quantity}).",
									"Lỗi", MessageBoxButton.OK, MessageBoxImage.Warning);
					return;
				}

				orderDetails.Add(new OrderDetail
				{
					ProductId = productId,
					Quantity = requestedQuantity,
					UnitPrice = decimal.Parse(item.ThanhTien.Replace(" VND", "").Replace(",", ""))
				});
			}

			var orderService = new OrderService();
			bool success = orderService.AddOrderWithDetails(order, orderDetails);

			if (success)
			{
				
				foreach (var detail in orderDetails)
				{
					_productservice.ReduceProductQuantity(detail.ProductId, detail.Quantity);
				}

				MessageBox.Show("Tạo hóa đơn thành công!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
				PrintInvoice();
			}
			else
			{
				MessageBox.Show("Có lỗi xảy ra khi lưu hóa đơn.", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}


		private void DeleteSelectedButton_Click(object sender, RoutedEventArgs e)
		{
			
			var selectedItem = ProductDataGrid.SelectedItem;

			if (selectedItem != null)
			{
				
				ProductDataGrid.Items.Remove(selectedItem);

				
				UpdateTotalAmount();
			}
			else
			{
				
				MessageBox.Show("Vui lòng chọn sản phẩm để xóa!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
			}
		}

	}
}

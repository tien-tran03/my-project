using OxyPlot;
using OxyPlot.Series;
using OxyPlot.Axes;
using System.Collections.Generic;
using System.ComponentModel;
using ShopManager.BLL_.Services;
using static ShopManager.DAL_.Repositories.OrdersRepository;
using ClosedXML.Excel;
using Microsoft.Win32;
using ClosedXML.Excel;
namespace ShopManager.ViewModels
{
	public class HomeViewModel : INotifyPropertyChanged
	{
		private readonly OrderService _orderService;
		public PlotModel? PlotModel { get; set; }  // Nullable PlotModel

		private int _dailyOrderCount;
		public int DailyOrderCount
		{
			get => _dailyOrderCount;
			set
			{
				_dailyOrderCount = value;
				OnPropertyChanged(nameof(DailyOrderCount));
			}
		}

		private decimal _dailyRevenue;
		public decimal DailyRevenue
		{
			get => _dailyRevenue;
			set
			{
				_dailyRevenue = value;
				OnPropertyChanged(nameof(DailyRevenue));
			}
		}

		private int _dailyProductCount;
		public int DailyProductCount
		{
			get => _dailyProductCount;
			set
			{
				_dailyProductCount = value;
				OnPropertyChanged(nameof(DailyProductCount));
			}
		}

		public HomeViewModel()
		{
			_orderService = new OrderService();
			LoadDataFromDatabase();
			CreatePlot();
		}

		private void LoadDataFromDatabase()
		{
			var today = DateTime.Today;
			int userId = App.CurrentUserId;

			DailyOrderCount = _orderService.GetDailyOrderCount(today, userId);
			DailyRevenue = _orderService.GetDailyRevenue(today, userId);
			DailyProductCount = _orderService.GetDailyProductCount(today, userId);
		}



		private void CreatePlot()
		{
			PlotModel = new PlotModel { Title = "Doanh thu theo tháng" };

			var columnSeries = new ColumnSeries
			{
				Title = "Doanh thu",
				FillColor = OxyColors.Pink,
				LabelPlacement = LabelPlacement.Outside,
				LabelFormatString = "{0:N0} VND",
				ColumnWidth = 0.5
			};

			var monthlyRevenues = _orderService.GetMonthlyRevenue();

			foreach (var revenue in monthlyRevenues)
			{
				columnSeries.Items.Add(new ColumnItem((double)revenue.TotalRevenue));
			}

			PlotModel.Series.Add(columnSeries);

			var categoryAxis = new CategoryAxis
			{
				Position = AxisPosition.Bottom,
				Title = "Tháng",
				Angle = 45,
				GapWidth = 1.5,
			};

			foreach (var label in GetMonthLabels(monthlyRevenues))
			{
				categoryAxis.Labels.Add(label);
			}

			var linearAxis = new LinearAxis
			{
				Position = AxisPosition.Left,
				Title = "Doanh thu (VND)",
				Minimum = 0,
				Maximum = 9000000,
				LabelFormatter = value => $"{value:N0} VND"
			};

			PlotModel.Axes.Add(categoryAxis);
			PlotModel.Axes.Add(linearAxis);

			OnPropertyChanged(nameof(PlotModel));
		}

		private List<string> GetMonthLabels(List<MonthlyRevenue> revenues)
		{
			var labels = new List<string>();
			foreach (var revenue in revenues)
			{
				labels.Add($"{revenue.Month}/{revenue.Year}");
			}
			return labels;
		}

		public event PropertyChangedEventHandler? PropertyChanged; 
		protected void OnPropertyChanged(string propertyName)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
		public void ExportToExcel()
		{
			var yearlyRevenues = _orderService.GetYearRevenue();

		
			using (var workbook = new XLWorkbook())
			{
				var worksheet = workbook.Worksheets.Add("Doanh thu theo năm");

				
				worksheet.Cell(1, 1).Value = "Năm";
				worksheet.Cell(1, 2).Value = "Doanh thu (VND)";

				
				var headerRange = worksheet.Range("A1:B1");
				headerRange.Style.Font.Bold = true;
				headerRange.Style.Fill.BackgroundColor = XLColor.LightGray;
				headerRange.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

				
				int row = 2;
				foreach (var revenue in yearlyRevenues)
				{
					worksheet.Cell(row, 1).Value = revenue.Year;
					worksheet.Cell(row, 2).Value = revenue.TotalRevenue;
					row++;
				}

				
				worksheet.Columns().AdjustToContents();

				// Lưu file Excel
				SaveFileDialog saveFileDialog = new SaveFileDialog
				{
					Filter = "Excel Workbook|*.xlsx",
					Title = "Lưu file báo cáo doanh thu",
					FileName = "DoanhThuTheoNam.xlsx"
				};

				if (saveFileDialog.ShowDialog() == true)
				{
					string filePath = saveFileDialog.FileName;
					workbook.SaveAs(filePath);
					System.Windows.MessageBox.Show("Xuất báo cáo thành công!", "Thông báo", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Information);
				}
			}
		}
	}
}

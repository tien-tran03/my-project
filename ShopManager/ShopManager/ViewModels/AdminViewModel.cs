using OxyPlot.Axes;
using OxyPlot.Series;
using OxyPlot;
using ShopManager.BLL_.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static ShopManager.DAL_.Repositories.OrdersRepository;

namespace ShopManager.ViewModels
{
	public class AdminViewModel : INotifyPropertyChanged
	{
		private readonly OrderService _orderService;
		public PlotModel PlotModel { get; set; }  

		public AdminViewModel()
		{
			_orderService = new OrderService();
			CreateAnnualRevenuePlot();
		}

		private void CreateAnnualRevenuePlot()
		{
			PlotModel = new PlotModel { Title = "Doanh thu theo năm" };

			var columnSeries = new ColumnSeries
			{
				Title = "Doanh thu",
				FillColor = OxyColors.LightBlue,
				LabelPlacement = LabelPlacement.Outside,
				LabelFormatString = "{0:N0} VND",
				ColumnWidth = -0.1
			};

			var yearlyRevenues = _orderService.GetYearRevenue();

			foreach (var revenue in yearlyRevenues)
			{
				columnSeries.Items.Add(new ColumnItem((double)revenue.TotalRevenue));
			}

			PlotModel.Series.Add(columnSeries);

			var categoryAxis = new CategoryAxis
			{
				Position = AxisPosition.Bottom,
				Title = "Năm",
				Angle = 45,
				GapWidth = 3,
			};

			foreach (var label in GetYearLabels(yearlyRevenues))
			{
				categoryAxis.Labels.Add(label);
			}

			var linearAxis = new LinearAxis
			{
				Position = AxisPosition.Left,
				Title = "Doanh thu (VND)",
				Minimum = 0,
				Maximum = 9000000, // Đặt giới hạn tối đa cho chiều cao
				LabelFormatter = value => $"{value:N0} VND"
			};

			PlotModel.Axes.Add(categoryAxis);
			PlotModel.Axes.Add(linearAxis);

			OnPropertyChanged(nameof(PlotModel));
		}

		private List<string> GetYearLabels(List<YearlyRevenue> revenues)
		{
			var labels = new List<string>();
			foreach (var revenue in revenues)
			{
				labels.Add(revenue.Year.ToString());
			}
			return labels;
		}

		public event PropertyChangedEventHandler PropertyChanged;
		protected void OnPropertyChanged(string propertyName)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
	}

}

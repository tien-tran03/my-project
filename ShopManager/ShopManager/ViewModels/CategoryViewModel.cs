using ShopManager.BLL.Services;
using ShopManager.DAL_.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManager.ViewModels
{
	public class CategoryViewModel
	{
		private readonly CategoryService _categoryService;
		public CategoryViewModel()
		{
			_categoryService = new CategoryService();
		}
		public List<Category> GetCategory()
		{
			return _categoryService.GetAllCategories();
		}
		public Category getName(int categoryId)
		{
			
			return _categoryService.GetNameCategory(categoryId);
		}
	}
}

using System.Collections.Generic;
using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;

namespace ShopManager.BLL.Services
{
	public class CategoryService
	{
		private readonly CategoryDAL _categoryDAL;

		public CategoryService()
		{
			_categoryDAL = new CategoryDAL();
		}

		public List<Category> GetAllCategories()
		{
			return _categoryDAL.GetAllCategories();
		}
		public Category GetNameCategory(int categoryId)
		{
			return _categoryDAL.getCategorybyProductId(categoryId);
		}

	}
}

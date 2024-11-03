using System.Collections.Generic;
using System.Linq;
using ShopManager.DAL_.Models;

namespace ShopManager.DAL_.Repositories
{
	public class CategoryDAL
	{
		private readonly ProjectPrnContext _context;

		public CategoryDAL()
		{
			_context = new ProjectPrnContext();
		}





		public List<Category> GetAllCategories()
		{
			return _context.Categories.ToList();
		}





		public Category getCategorybyProductId(int categoryId)
		{
			return _context.Categories.FirstOrDefault(c => c.CategoryId == categoryId);
		}






		public Category GetCategoryById(int categoryId)
		{
			return _context.Categories.FirstOrDefault(c => c.CategoryId == categoryId);
		}





	

	}
}

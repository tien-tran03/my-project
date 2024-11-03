using ShopManager.DAL_.Models;
using Microsoft.EntityFrameworkCore;

namespace ShopManager.DAL_.Repositories
{
	public class ProductRepository
	{
		private readonly ProjectPrnContext _context;

		public ProductRepository()
		{
			_context = new ProjectPrnContext();
		}

		public bool Add(Product product)
		{
			_context.Products.Add(product);
			return SaveChanges();
		}

	
		public void Update(Product product)
		{
			_context.Products.Update(product);
		}

		
		public bool SaveChanges()
		{
			return _context.SaveChanges() > 0; 
		}

		
		public List<Product> GetAllProducts()
		{
			return _context.Products.ToList();
		}

		
		public List<Product> GetProductsByCategoryId(int categoryId)
		{
			return _context.Products.Where(p => p.CategoryId == categoryId).ToList();
		}

	
		public List<Product> GetProductsByPriceRange(decimal? minPrice, decimal? maxPrice)
		{
			return _context.Products
				.Where(p => (!minPrice.HasValue || p.Price >= minPrice.Value) &&
							(!maxPrice.HasValue || p.Price <= maxPrice.Value))
				.ToList();
		}
		public Product GetProductByProductId(int productId)
		{
			return _context.Products.FirstOrDefault(c => c.ProductId == productId);
		}
		public void DeleteProduct(int productId)
		{
			var product = _context.Products.FirstOrDefault(p => p.ProductId == productId);
			if (product != null)
			{
				_context.Products.Remove(product);
				_context.SaveChanges();
			}
		}
		public void UpdateProduct(Product product)
		{
			var existingProduct = _context.Products.FirstOrDefault(p => p.ProductId == product.ProductId);
			if (existingProduct != null)
			{
				existingProduct.ProductName = product.ProductName;
				existingProduct.Price = product.Price;
				existingProduct.Quantity = product.Quantity;
				existingProduct.Category = product.Category;
				existingProduct.ProductInfo= product.ProductInfo;
				_context.SaveChanges();
			}
		}
		public void UpdateProductQuantity(int productId, int quantityToReduce)
		{
			
				
				var product = _context.Products.FirstOrDefault(p => p.ProductId == productId);

				if (product != null)
				{
					
					product.Quantity -= quantityToReduce;

					
					_context.SaveChanges();

					Console.WriteLine($"Cập nhật số lượng cho sản phẩm {productId} thành công.");
				}
				else
				{
					Console.WriteLine($"Không tìm thấy sản phẩm với mã {productId}.");
				}
			
		}


	}
}

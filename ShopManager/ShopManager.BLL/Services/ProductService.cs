using Microsoft.EntityFrameworkCore;
using ShopManager.DAL_.Models;
using ShopManager.DAL_.Repositories;
using System.Collections.Generic;
using static ShopManager.DAL_.Repositories.ProductRepository;

namespace ShopManager.BLL.Services
{
	public class ProductService
	{
		private readonly ProductRepository _productRepository;

		public ProductService()
		{
			_productRepository = new ProductRepository(); 
		}

		public ProductService(ProductRepository productRepository)
		{
			_productRepository = productRepository;
		}

		public List<Product> GetAllProducts()
		{
			return _productRepository.GetAllProducts();
		}

	
		public List<Product> GetProductsByCategory(int categoryId)
		{
			return _productRepository.GetProductsByCategoryId(categoryId);
		}

		
		public List<Product> GetProductsByPriceRange(decimal? minPrice, decimal? maxPrice)
		{
			return _productRepository.GetProductsByPriceRange(minPrice, maxPrice);
		}

	
		public bool AddProduct(Product product)
		{
			return _productRepository.Add(product); 
		}

		
		
		public Product GetProductById(int productId)
		{
			
			return _productRepository.GetProductByProductId(productId);
		}
	
		public void DeleteProduct(int productId)
		{
			_productRepository.DeleteProduct(productId);
		}
		public bool UpdateProduct(Product product)
		{
			_productRepository.Update(product);
			return _productRepository.SaveChanges();
		}
		public void ReduceProductQuantity(int productId, int quantity)
		{
			_productRepository.UpdateProductQuantity(productId, quantity);
		}

	}
}

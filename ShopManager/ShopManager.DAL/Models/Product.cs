using System;
using System.Collections.Generic;

namespace ShopManager.DAL_.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string ProductName { get; set; } = null!;

    public decimal Price { get; set; }

    public int Quantity { get; set; }

    public int? SupplierId { get; set; }
	public string ProductDisplay => $"{ProductName} || {Size} || {Quantity}";
	public int? CategoryId { get; set; }
	public string FormattedPrice => $"{Price:N0} VND";
	public string ProductCode { get; set; } = null!;

    public string? ProductInfo { get; set; }

    public string? Size { get; set; }

    public string? ImagePath { get; set; }

    public virtual Category? Category { get; set; }

    public virtual Supplier? Supplier { get; set; }
}

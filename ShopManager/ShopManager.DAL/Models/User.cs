using System;
using System.Collections.Generic;

namespace ShopManager.DAL_.Models;

public partial class User
{
    public int UserId { get; set; }

    public string? Username { get; set; }

    public string PasswordHash { get; set; } = null!;

    public string Role { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}

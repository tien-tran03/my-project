package Models;

public class Products {

    private int ProductID;
    private String ProductName;
    private String Category;
    private float Price;
    private int StockQuantity;
    private int CategoryID;
    
    private String image_url;
    private int Quantity;
    private float Sellprice;

    public Products() {
    }

    public Products(int ProductID, String ProductName, String Category, float Price, int StockQuantity, int CategoryID,String image_url, int Quantity, float Sellprice) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Category = Category;
        this.Price = Price;
        this.StockQuantity = StockQuantity;
        this.CategoryID = CategoryID;
        
        this.image_url = image_url;
        this.Quantity = Quantity;
        this.Sellprice = Sellprice;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public int getStockQuantity() {
        return StockQuantity;
    }

    public void setStockQuantity(int StockQuantity) {
        this.StockQuantity = StockQuantity;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

   

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public float getSellprice() {
        return Sellprice;
    }

    public void setSellprice(float Sellprice) {
        this.Sellprice = Sellprice;
    }

    @Override
    public String toString() {
        return "Products{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", Category=" + Category + ", Price=" + Price + ", StockQuantity=" + StockQuantity + ", CategoryID=" + CategoryID  + ", image_url=" + image_url + ", Quantity=" + Quantity + ", Sellprice=" + Sellprice + '}';
    }

}

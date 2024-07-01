
package Models;

public class Categories {
    private int CategoryID;
    private String CategoryName;
    private String img_url;

    public Categories() {
    }

    public Categories(int CategoryID, String CategoryName, String img_url) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.img_url = img_url;
    }

    public Categories(int CategoryID, String CategoryName) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    
    

    @Override
    public String toString() {
        return "Categories{" + "CategoryID=" + CategoryID + ", CategoryName=" + CategoryName + ", img_url=" + img_url + '}';
    }
}

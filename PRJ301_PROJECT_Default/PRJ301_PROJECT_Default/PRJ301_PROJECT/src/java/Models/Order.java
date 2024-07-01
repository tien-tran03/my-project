package Models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Thành Vinh
 */
public class Order {

    private int orderID;
    private String orderDate;
    private Accounts userID;
    private float totalAmount;
    private String address;
    private List<Items> items;

    public Order() {
        items = new ArrayList<>();
    }

    public Order(int orderID, String orderDate, Accounts userID, float totalAmount, String address, List<Items> items) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.userID = userID;
        this.totalAmount = totalAmount;
        this.address = address;
        this.items = items;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Accounts getUserID() {
        return userID;
    }

    public void setUserID(Accounts userID) {
        this.userID = userID;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<Items> getItems() {
        return items;
    }

    public void addItem(Items item) {
        items.add(item);
    }

    public void setItems(List<Items> items) {
        this.items = items;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", orderDate=" + orderDate + ", userID=" + userID + ", totalAmount=" + totalAmount + ", items=" + items + '}';
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Thành Vinh
 */
public class Items {

    private Order order;
    private Products product;
    private int productQuantity;
    private float price;

    public Items() {
    }

    public Items(Products product, int productQuantity) {
        this.product = product;
        this.productQuantity = productQuantity;
    }

    public Items(Products product, int productQuantity, float price) {
        this.product = product;
        this.productQuantity = productQuantity;
        this.price = price;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "Items{" + "order=" + order + ", product=" + product + ", productQuantity=" + productQuantity + ", price=" + price + '}';
    }

}

package com.weiqun.shopping.bean;

public class CartItem {
    private Product product;
    private int count;
    private double unitPrice;
    private double totlePrice;
    public CartItem() {
    }

    public CartItem(Product product, int count) {
        this.product = product;
        this.count = count;
    }

    public double getTotalPrice(boolean isLogin) {
        totlePrice = count*(isLogin?product.getMemberprice():product.getNormalprice());
        return totlePrice;
    }


    public double getUnitPrice(boolean isLogin) {
        unitPrice = isLogin?product.getMemberprice():product.getNormalprice();
        return unitPrice;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public double getTotlePrice() {
        return totlePrice;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

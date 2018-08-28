package com.weiqun.shopping.bean;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private int id;
    private List<CartItem> cartItems = new ArrayList<>();
    private int userId;

    public double getTotalPrice(boolean isLogin) {
        double result = 0.0;
        for (int i = 0; i < cartItems.size(); i++) {
            result += cartItems.get(i).getTotalPrice(isLogin);
        }
        return result;
    }

    public void add(CartItem item) {
        boolean found = false;
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getProduct().getId() == item.getProduct().getId()) {
                found = true;
                cartItems.get(i).setCount(
                        cartItems.get(i).getCount() + item.getCount()
                );
            }
        }
        if (!found) {
            cartItems.add(item);
        }
    }

    public void remove(CartItem item) {
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getProduct().getId() == item.getProduct().getId()) {
                cartItems.remove(cartItems.get(i));
                break;
            }
        }
    }

    public void reduce(CartItem item) {
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getProduct().getId() == item.getProduct().getId()) {
                int result = cartItems.get(i).getCount() - 1;
                if (result <= 0) {
                    result = 0;
                }
                cartItems.get(i).setCount(result);
                break;
            }
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

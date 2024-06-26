package com.asm.service;

import com.asm.entity.CartItem;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {

    private List<CartItem> cart = new ArrayList<>();

    public void addToCart(CartItem cartItem) {
        for (CartItem item : cart) {
            if (item.getProduct().getProductId().equals(cartItem.getProduct().getProductId())) {
                item.setQuantity(item.getQuantity() + cartItem.getQuantity());
                return;
            }
        }
        cart.add(cartItem);
    }

    public List<CartItem> getCartItems() {
        return cart;
    }

    public void updateCartItem(Integer productId, int quantity) {
        for (CartItem item : cart) {
            if (item.getProduct().getProductId().equals(productId)) {
                item.setQuantity(quantity);
                return;
            }
        }
    }

    public void removeFromCart(Integer productId) {
        cart.removeIf(item -> item.getProduct().getProductId().equals(productId));
    }

    public void clearCart() {
        cart.clear();
    }

    public double getTotalPrice() {
        return cart.stream().mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity()).sum();
    }
}

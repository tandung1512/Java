package com.asm.entity;

import lombok.Data;

@Data
public class CartItem {
    private Product product;
    private int quantity;
}

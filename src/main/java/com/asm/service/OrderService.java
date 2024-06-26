package com.asm.service;

import com.asm.entity.Order;
import com.asm.entity.OrderItem;
import java.util.List;

public interface OrderService {
    Order createOrder(Order order, List<OrderItem> orderItems);
    List<Order> getOrdersByUsername(String username);
    Order getOrderById(Long orderId);
    void deleteOrderById(Long orderId);
}

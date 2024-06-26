package com.asm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.OrderDAO;
import com.asm.dao.OrderItemDAO;
import com.asm.entity.Order;
import com.asm.entity.OrderItem;
 
import com.asm.service.OrderService;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDAO orderRepository;

    @Autowired
    private OrderItemDAO orderItemRepository;

    @Override
    public Order createOrder(Order order, List<OrderItem> orderItems) {
//    	 order.setId(null);
        Order savedOrder = orderRepository.save(order);
        for (OrderItem item : orderItems) {
//        	item.setId(null);
            item.setOrder(savedOrder);
            orderItemRepository.save(item);
        }
        return savedOrder;
    }

    @Override
    public List<Order> getOrdersByUsername(String username) {
        return orderRepository.findByAccountUsername(username);
    }

    @Override
    public Order getOrderById(Long orderId) {
        return orderRepository.findById(orderId).orElse(null);
    }

    @Override
    public void deleteOrderById(Long orderId) {
        orderRepository.deleteById(orderId);
    }
}

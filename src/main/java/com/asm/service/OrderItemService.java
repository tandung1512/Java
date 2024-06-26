package com.asm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.OrderItemDAO;
import com.asm.entity.OrderItem;

import java.util.List;

@Service
public class OrderItemService {

    @Autowired
    private OrderItemDAO orderItemRepository;

    public List<OrderItem> getAllOrderItems() {
        return orderItemRepository.findAll();
    }
 
}

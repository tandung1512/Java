package com.asm.dao;
 
import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.OrderItem;

public interface OrderItemDAO extends JpaRepository<OrderItem, Long>{
	
}
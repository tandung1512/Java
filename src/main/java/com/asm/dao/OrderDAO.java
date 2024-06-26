package com.asm.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{
	 List<Order> findByAccountUsername(String username);
}

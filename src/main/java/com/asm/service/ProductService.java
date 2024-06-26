package com.asm.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.asm.dao.ProductDAO;
import com.asm.entity.Product;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productRepository;

    public Product getProductById(Integer productId) {
        Optional<Product> productOptional = productRepository.findById(productId);
        return productOptional.orElse(null);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
 
    
}

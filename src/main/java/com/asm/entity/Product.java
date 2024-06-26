package com.asm.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Product_Id;

    private String name;
    private String image1; 
    private String image2;
    private String image3;
    private String image4;
    private String color;
    private double price;
    Date createDate = new Date();
    @Temporal(TemporalType.DATE)
    private int quantity;
    private String manufactor;
    private String description;
    private int discount;
    
   
   

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
      
    @JsonIgnore
    @OneToMany(mappedBy = "product")
    private List<OrderItem> ordersDetails;
    
    public Integer getProductId() {
        return Product_Id;
    }

    public void setProductId(Integer productId) {
        this.Product_Id = productId;
    }
}
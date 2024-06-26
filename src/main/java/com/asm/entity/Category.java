package com.asm.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Categories")
public class Category implements Serializable {
    @Id
    String category_id;
    String name;
    Date createDate = new Date();
    @Temporal(TemporalType.DATE)
    
    @JsonIgnore
    @OneToMany(mappedBy = "category")
    private List<Product> products;

}

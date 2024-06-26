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
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date createDate;
    private String address;
    private String phonenumber;
    private String orderNote;
    private Integer orderStatus;
    private Double price;

    @ManyToOne
    @JoinColumn(name = "username")
    private Account account;

    @JsonIgnore
    @OneToMany(mappedBy = "order")
    private List<OrderItem> orderItems;
}

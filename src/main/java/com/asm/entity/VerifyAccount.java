package com.asm.entity;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Verify_Accounts")
public class VerifyAccount implements Serializable {
    @Id
    String username;
    String verifyCode;
    
    @OneToOne
    @JoinColumn(name = "username")
    Account account;
}

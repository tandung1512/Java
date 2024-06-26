	package com.asm.entity;
	
	import java.io.Serializable;
	import java.util.List;
	import jakarta.persistence.Entity;
	import jakarta.persistence.Id;
	import jakarta.persistence.OneToMany;
	import jakarta.persistence.Table;
	import com.fasterxml.jackson.annotation.JsonIgnore;
	import lombok.Data;
	@Entity 
	@SuppressWarnings("serial")
	@Data

	@Table(name = "Accounts")
	public class Account implements Serializable {
	    @Id
	    String username;
	    String password;
	    String fullname;
	    String phonenumber;
	    String email;
	    String photo;
	    boolean admin;
	    boolean activated;
	    
	    @JsonIgnore
	    @OneToMany(mappedBy = "account")
	    List<Order> orders;
	}

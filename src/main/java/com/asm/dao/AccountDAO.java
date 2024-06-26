package com.asm.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asm.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	 @Query("SELECT a.email FROM Account a WHERE a.username = :username")
	    String findEmailByUsername(@Param("username") String username);
	  @Query("SELECT a FROM Account a WHERE a.username = ?1")
	    Account findByUsername(String username);
	    @Query("SELECT o FROM Account o WHERE o.fullname LIKE ?1") 
	    Page<Account> findByKeywords(String keywords, Pageable pageable); 
}

package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.VerifyAccount;

public interface VerifyAccountDAO extends JpaRepository<VerifyAccount, String> {
    // Các phương thức tùy chỉnh nếu cần
}


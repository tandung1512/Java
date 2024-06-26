package com.asm.service;

import com.asm.entity.Account;
import java.util.Optional;

public interface AccountService {
    Optional<Account> findByUsername(String username);
    Account save(Account account);
    void deleteByUsername(String username);
}

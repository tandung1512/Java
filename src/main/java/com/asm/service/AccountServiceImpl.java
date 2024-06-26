package com.asm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.AccountDAO;
import com.asm.entity.Account;

import com.asm.service.AccountService;

import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDAO accountRepository;

    @Override
    public Optional<Account> findByUsername(String username) {
        return accountRepository.findById(username);
    }

    @Override
    public Account save(Account account) {
        return accountRepository.save(account);
    }

    @Override
    public void deleteByUsername(String username) {
        accountRepository.deleteById(username);
    }
}

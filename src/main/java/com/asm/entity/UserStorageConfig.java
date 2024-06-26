package com.asm.entity;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class UserStorageConfig {

    @Bean(name = "inMemoryUserStorage")
    public Map<String, String> inMemoryUserStorage() {
        return new HashMap<>();
    }
}

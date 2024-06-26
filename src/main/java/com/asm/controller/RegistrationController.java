package com.asm.controller;

import com.asm.entity.Account;
import com.asm.dao.AccountDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistrationController {

    @Autowired
    private AccountDAO accountDAO;



 

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    @PostMapping("/login/signup")
    public String register(@RequestParam("gmail") String email,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("confirmPassword") String confirmPassword,
                           Model model) {
        if (!password.equals(confirmPassword)) {
            model.addAttribute("message", "Mật khẩu và xác nhận mật khẩu không khớp.");
            return "signup";
        }

        if (accountDAO.existsById(username)) {
            model.addAttribute("message", "Tài khoản đã tồn tại.");
            return "signup";
        }

        Account account = new Account();
        account.setEmail(email);
        account.setUsername(username);
        account.setPassword(password);
        account.setActivated(true);
        account.setAdmin(false);

        accountDAO.save(account);
        model.addAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "login";
    }
}

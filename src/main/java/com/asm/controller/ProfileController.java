package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.asm.dao.AccountDAO;
import com.asm.entity.Account;
import com.asm.service.XCookie;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @Autowired
    private AccountDAO accountDAO;

    @GetMapping("/profile")
    public String showProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String loggedInUsername = (String) session.getAttribute("Username");
        
        if (loggedInUsername == null) {
            loggedInUsername = XCookie.get("rememberedUsername", request);
        }
        
        if (loggedInUsername != null) {
            Account account = accountDAO.findById(loggedInUsername).orElse(null);
            if (account != null) {
                model.addAttribute("account", account);
                return "profile";
            }
        }
        
        return "redirect:/login";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute("account") Account updatedAccount) {
        Account existingAccount = accountDAO.findById(updatedAccount.getUsername()).orElse(null);
        if (existingAccount != null) {
        	 existingAccount.setUsername(updatedAccount.getUsername());
            existingAccount.setPassword(updatedAccount.getPassword());
            existingAccount.setFullname(updatedAccount.getFullname());
            existingAccount.setPhonenumber(updatedAccount.getPhonenumber());
            existingAccount.setEmail(updatedAccount.getEmail());
         
            accountDAO.save(existingAccount);
        }
        return "redirect:/profile";
    }
}


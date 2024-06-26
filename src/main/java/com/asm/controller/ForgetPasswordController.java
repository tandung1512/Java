package com.asm.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.AccountDAO;
import com.asm.entity.Account;
import com.asm.model.MailInfo;
import com.asm.service.MailerService;

@Controller
@RequestMapping("/forgetpassword")
public class ForgetPasswordController {

    @Autowired
    private AccountDAO accountService;

    @Autowired
    private MailerService mailerService;

    @GetMapping("")
    public String forgetPasswordPage() {
        return "ForgetPassword";
    }

    @PostMapping("/find-email")
    public String findEmail(@RequestParam("username") String username, Model model) {
    	model.addAttribute("usernamefgpw",username);
        String email = accountService.findEmailByUsername(username);
        if (email != null) {
            model.addAttribute("foundEmail", email);
        } else {
            model.addAttribute("errorMessage", "Tên tài khoản không đúng.");
        }
        return "ForgetPassword";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam("username_reset") String username, Model model) {
        String email = accountService.findEmailByUsername(username);
        if (email != null) {
            // Generate a new random password
            String newPassword = generateRandomPassword();
            // Update the new password in the database
            Account account = accountService.findByUsername(username);
            if (account != null) {
                account.setPassword(newPassword);
                accountService.save(account);
                String message = "<html><head><style>"
                        + "body { font-family: Arial, sans-serif; background-color: #f8f9fa; color: #333; }"
                        + ".container { max-width: 600px; margin: 0 auto; padding: 20px; }"
                        + "h1 { color: #000080; }"
                        + "p { font-size: 16px; }"
                        + "</style></head><body>"
                        + "<div class='container'>"
                        + "<h1><img src='https://inkythuatso.com/uploads/thumbnails/800/2021/11/logo-pnj-vector-inkythuatso-2-01-17-14-52-42.jpg' style='width: 20%' alt='Logo'> Trang Sức Thời Thượng</h1>"
                        + "<p>Mật khẩu mới của bạn là: <strong>" + newPassword + "</strong></p>"
                        + "<p>Trân trọng,<br/>Đội ngũ PNJ-Trang Sức Thời Thượng</p>"
                        + "</div></body></html>";

                // Send the new password to the email
                MailInfo mail = new MailInfo(email, "Mật khẩu khôi phục mới", message);
                try {
                    mailerService.send(mail);
                    model.addAttribute("successMessage", "Mật khẩu mới đã được gửi về email của bạn.");
                } catch (Exception e) {
                    model.addAttribute("errorMessage", "Đã xảy ra lỗi khi gửi mật khẩu mới.");
                }
            } else {
                model.addAttribute("errorMessage", "Tài khoản không tồn tại.");
            }
        } else {
            model.addAttribute("errorMessage", "Tên tài khoản không đúng.");
        }
        return "ForgetPassword";
    }


    private String generateRandomPassword() {
        Random random = new Random();
        int newPassword = random.nextInt(999) + 1; // Random number from 1 to 999
        return String.format("%06d", newPassword); // Format to ensure 6 digits
    }
}

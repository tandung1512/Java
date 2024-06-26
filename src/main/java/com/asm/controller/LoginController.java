package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.AccountDAO;
import com.asm.entity.Account;
import com.asm.service.XCookie;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    AccountDAO accountDAO;

    @Autowired
    HttpServletResponse resp;

    @Autowired
    HttpServletRequest req;

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext context;

    @GetMapping("/login")
    public String login(@CookieValue(value = "rememberedUsername", defaultValue = "") String rememberedUsername,
                        @CookieValue(value = "rememberedPassword", defaultValue = "") String rememberedPassword,
                        @RequestParam(required = false) String redirectUrl, // Thêm tham số mới
                        Model model) {
        model.addAttribute("username", rememberedUsername);
        model.addAttribute("password", rememberedPassword);
        // Truyền redirectUrl vào model để sử dụng trong form đăng nhập
        model.addAttribute("redirectUrl", redirectUrl);
        return "login";
    }


    @PostMapping("/login/signin")
    public String login(@RequestParam String username, @RequestParam String password,
                        @RequestParam(required = false) boolean rememberMe, HttpSession session,
                        Model model, HttpServletResponse response, HttpServletRequest request,
                        @RequestParam(required = false) String redirectUrl) { // Thêm tham số mới
        Account account = accountDAO.findById(username).orElse(null);
        if (account != null && account.getPassword().equals(password)) {
            // Đăng nhập thành công
            session.setAttribute("loggedIn", true);
            session.setAttribute("Username", username);

            if (rememberMe) {
                // Lưu thông tin đăng nhập vào cookie
                XCookie.add("rememberedUsername", username, 7 * 24, response);
                XCookie.add("rememberedPassword", password, 7 * 24, response);
            } else {
                // Xóa thông tin đăng nhập khỏi cookie nếu không nhớ tài khoản
                XCookie.remove("rememberedUsername", request, response);
                XCookie.remove("rememberedPassword", request, response);

            }
            if (account.isAdmin()) {
                // Nếu đăng nhập bằng tài khoản admin, chuyển hướng đến trang admin
                return "admin/admin"; // Chuyển hướng đến trang admin thay vì trang index
            } else {
                // Kiểm tra xem có redirectUrl không
            	return "redirect:/index";
            }
        } else {
            model.addAttribute("error", "Tài khoản hoặc mật khẩu không đúng.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loggedIn");
        return "redirect:/index";
    }
}

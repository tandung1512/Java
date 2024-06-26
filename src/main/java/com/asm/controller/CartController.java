package com.asm.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.entity.CartItem;
import com.asm.entity.Product;
import com.asm.service.CartService;
import com.asm.service.ProductService;
import com.asm.service.XCookie;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    @Autowired
    HttpServletResponse resp;

   @Autowired
    HttpServletRequest req;

   @Autowired
    HttpSession session;
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;
    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("productId") Integer productId, @RequestParam("quantity") int quantity, HttpSession session) {
        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
        
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập
        } else {
            // Nếu đã đăng nhập, thêm sản phẩm vào giỏ hàng như bình thường
            Product product = productService.getProductById(productId);
            if (product != null) {
                CartItem cartItem = new CartItem();
                cartItem.setProduct(product);
                cartItem.setQuantity(quantity);
                cartService.addToCart(cartItem);
            }
            
            return "redirect:/shop"; // Chuyển hướng đến trang shop
        }
    }
    
    
    
    
    @GetMapping("/cart")
    public String viewCart(Model model) {
        model.addAttribute("cart", cartService.getCartItems());
        model.addAttribute("totalPrice", cartService.getTotalPrice());
        return "cart";
    }
    
    @GetMapping("/cart/delete")
    public String deleteFromCart(@RequestParam Integer productId) {
        cartService.removeFromCart(productId);
        return "redirect:/cart";
    }
    @PostMapping("/cart/update")
    public String updateCart(@RequestParam("productId") Integer productId, @RequestParam("quantity") int quantity, HttpSession session) {
        cartService.updateCartItem(productId, quantity);
        session.setAttribute("cart", cartService.getCartItems());
        return "redirect:/cart";
    }
}

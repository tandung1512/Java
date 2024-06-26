package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.asm.entity.CartItem;
import com.asm.entity.Order;
import com.asm.entity.OrderItem;
import com.asm.service.AccountService;
import com.asm.service.CartService;
import com.asm.service.OrderService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CheckoutController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/checkout")
    public String checkoutForm(HttpSession session, Model model) {
        List<CartItem> cartItems = cartService.getCartItems();
        double totalPrice = cartItems.stream()
            .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
            .sum();
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        return "checkout";
    }

    @PostMapping("/checkout/process")
    public String processCheckout(
            @RequestParam("fullName") String fullName,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam("orderNote") String orderNote,
            HttpSession session, Model model) {

        String username = (String) session.getAttribute("Username");

        List<CartItem> cartItems = cartService.getCartItems();
        double totalPrice = cartItems.stream()
            .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
            .sum();
        System.out.println("Username: " + username);
        System.out.println("Total Price: " + totalPrice);

        
        Order order = new Order();
        accountService.findByUsername(username).ifPresent(order::setAccount);
        order.setCreateDate(new Date());
        order.setAddress(address);
        order.setPhonenumber(phone);
        order.setOrderNote(orderNote);
        order.setPrice(totalPrice);
        order.setOrderStatus(0);

        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem item : cartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(item.getProduct());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setOrder(order);
            orderItems.add(orderItem);
        }
        orderService.createOrder(order, orderItems);
        cartService.clearCart();
     
        return "redirect:/thankyou";
    }

    @GetMapping("/orders")
    public String userOrders(HttpSession session, Model model) {
        String username = (String) session.getAttribute("Username");
        List<Order> orders = orderService.getOrdersByUsername(username);
        model.addAttribute("orders", orders);
        return "ordersInfo";
    }

    @GetMapping("/order")
    public String getOrderById(@RequestParam("orderId") Long orderId, Model model) {
        Order order = orderService.getOrderById(orderId);
        if (order != null) {
            model.addAttribute("order", order);
            return "orderDetail";
        } else {
            model.addAttribute("error", "Order not found");
            return "error";
        }
    }

    @PostMapping("/admin/orders/delete")
    public String deleteOrder(@RequestParam("orderId") Long orderId) {
        orderService.deleteOrderById(orderId);
        return "redirect:/admin/orders";
    }
}

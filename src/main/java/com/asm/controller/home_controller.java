package com.asm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

 

import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class home_controller {
	@GetMapping("")
	public String index() {
		return "index";
	}

	@GetMapping("index")
	public String home() {
		return "index";
	}

//	@GetMapping("shop")
//	public String shop(Model model) {
//
//		return "shop";
//	}

	@GetMapping("about")
	public String about() {
		return "about";
	}

	@GetMapping("services")
	public String services() {
		return "services";
	}

	@GetMapping("blog")
	public String blog() {
		return "blog";
	}

	@GetMapping("contact")
	public String contact() {
		return "contact";
	}

//	@GetMapping("cart")
//	public String cart() {
//		return "cart";
//	}

//	@GetMapping("checkout")
//	public String checkout() {
//		return "checkout";
//	}

	@GetMapping("thankyou")
	public String thankyou() {
		return "thankyou";
	}
}

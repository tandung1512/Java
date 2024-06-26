package com.asm.controller;

import java.util.Arrays;
import java.util.Optional;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.ProductDAO;
import com.asm.entity.Product;
import com.asm.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
    @Autowired
    private ProductService productService;
    

    @RequestMapping("/shop")
    public String searchAndPage(Model model, 
                                @RequestParam("keywords") Optional<String> kw,
                                @RequestParam("category") Optional<String> category,
                                @RequestParam("minPrice") Optional<Double> minPrice,
                                @RequestParam("maxPrice") Optional<Double> maxPrice,
                                @RequestParam("color") Optional<String[]> colors,
                                @RequestParam("sortOrder") Optional<String> sortOrder,
                                @RequestParam("page") Optional<Integer> page, 
                                HttpSession session) {

        String kwords = kw.orElse((String) session.getAttribute("keywords"));
        String cat = category.filter(c -> !c.isEmpty()).orElse(null);
        Double minP = minPrice.orElse(null);
        Double maxP = maxPrice.orElse(null);
        List<String> col = colors.map(Arrays::asList).orElse(null);
        String sort = sortOrder.orElse("asc");

        if (kwords == null) {
            kwords = "";
        }
        session.setAttribute("keywords", kwords);

        Pageable pageable = PageRequest.of(page.orElse(0), 6, sort.equals("asc") ? Sort.by("price").ascending() : Sort.by("price").descending());
        Page<Product> pages = dao.findByFilter(kwords, cat, minP, maxP, col, pageable);

        model.addAttribute("page", pages);
        model.addAttribute("keywords", kwords);
        model.addAttribute("category", cat);
        model.addAttribute("minPrice", minP);
        model.addAttribute("maxPrice", maxP);
        model.addAttribute("colors", col);
        model.addAttribute("sortOrder", sort);
        
        return "shop";
    }
//    @RequestMapping("/shop/search-and-page")
//	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
//			@RequestParam("page") Optional<Integer> page, HttpSession session) {
//		String kwords = kw.orElse((String) session.getAttribute("keywords"));
//		if (kwords == null) {
//			kwords = "";
//		}
//		session.setAttribute("keywords", kwords);
//		Pageable pageable = PageRequest.of(page.orElse(0), 6);
//		Page<Product> pages = dao.findByKeywords("%" + kwords + "%", pageable);
//		model.addAttribute("page", pages);
//		model.addAttribute("keywords", kwords);
//		return "shop";
//	}
    @GetMapping("/product/{id}")
    public String productDetail(@PathVariable Integer id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "productDetail";
    }
}

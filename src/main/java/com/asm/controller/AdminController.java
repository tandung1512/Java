package com.asm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//import com.asm.FileUploadUtill;
import com.asm.dao.AccountDAO;
import com.asm.dao.CategoryDAO;
import com.asm.dao.ProductDAO;
import com.asm.entity.Account;
import com.asm.entity.Category;
import com.asm.entity.Product;
import com.asm.entity.Report;

@Controller
public class AdminController {
	@RequestMapping("admin")
	public String admin() {
		return "admin/admin";
	}
	////////// Quản Lý Trang Product ////////// Quản Lý Trang Product ////////// Quản Lý Trang Product 
	@Autowired
	ProductDAO dao; /// Làm việc với trang Product 
	
	
//	private static final String UPLOAD_DiR ="/path/to/your/upload/directory/";
//	
////@RequestMapping("/upload")	// Upload 
//	public String FildeUpload (@RequestParam("file") MultipartFile file) {
//	if (file.isEmpty()) {
//		return"Please select a file to upload";
//	}
//	
//	try {
//		// Tạo đường dẫn tới thư mục lưu trữ 
//		File directory = new File(UPLOAD_DiR);
//		if (!directory.exists()) {
//			directory.mkdirs();
//		}
//		
//		// lưu file vào thư mục lưu trữ 
//		File destFile = new File(directory.getAbsoluteFile() 
//				+ File.separator 
//				+ file.getOriginalFilename());
//		file.transferTo(destFile);
//		
//		return"File upload successfully!";
//	} catch (IOException e) {
//		e.printStackTrace();
//		return"Failed to upload file";
//	}
//}
//	
	
	@RequestMapping("/admin/ProductManagement")
	public String ProductManagament (Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = dao.findAll(); // lấy tất cả sản phẩm từ db thông qua findALL
		model.addAttribute("items",items);
		return "admin/ProductManagement";
	}
	
	@RequestMapping("/admin/ProductManagement/edit/{Product_Id}") // Edit Sản Phẩm
	public String edit(Model model, @PathVariable("Product_Id") Integer Product_Id) {
		Product item = dao.findById(Product_Id).get();
		model.addAttribute("item",item);
		List<Product> items = dao.findAll();
		model.addAttribute("items",items);
		return "admin/ProductManagement";
	}
	
	 @RequestMapping("admin/ProductManagement/create")	// Tạo Sản Phẩm
	public String create(Product item) {
			dao.save(item);
		return"redirect:/admin/ProductManagement";
	}
	
	@RequestMapping("admin/ProductManagement/update")	// Update Sản Phẩm
	public String update(Product item) {
		dao.save(item);
		return"redirect:/admin/ProductManagement/" + item.getProductId();
	}
	
	 @RequestMapping("admin/ProductManagement/delete/{Product_Id}") // Xóa Sản Phẩm
public String delete (@PathVariable("Product_Id") Integer Product_Id) {
		dao.deleteById(Product_Id);
		return "redirect:/admin/ProductManagement";
	}
	//////////Quản Lý Trang Product ////////// Quản Lý Trang Product ////////// Quản Lý Trang Product 
	
	////////// Quản Lý Trang Category ////////// Quản Lý Trang Category ////////// Quản Lý Trang Category
	
	@Autowired 
	CategoryDAO catedao;
	
	@GetMapping("/admin/CategoryManagement")
	public String CategoryManagement (Model model) {
		Category cateitem = new Category();
		model.addAttribute("cateitem",cateitem);
		List<Category> cateitems = catedao.findAll(); // lấy tất cả sản phẩm từ db 
		model.addAttribute("cateitems",cateitems);
		return "admin/CategoryManagement";
	}
	
	@RequestMapping("/admin/CategoryManagement/edit/{category_id}") // Chức Năng Edit
	public String edit(Model model, @PathVariable("category_id") String category_id) {
			Category cateitem = catedao.findById(category_id).get();
			model.addAttribute("cateitem", cateitem);
			List<Category> cateitems = catedao.findAll();
			model.addAttribute("cateitems",cateitems);
		return"admin/CategoryManagement";
	}
	
	@RequestMapping("admin/CategoryManagement/create") // Add Sản Phẩm
	public String create ( Category cateitem) {
		catedao.save(cateitem);
		return"redirect:/admin/CategoryManagement";
	}
	@RequestMapping("admin/CategoryManagement/update") // Update Sản Phẩm
	public String update (Category cateitem) {
		catedao.save(cateitem);
		return"redirect:/admin/CategoryManagement";
	}
	
	@RequestMapping("admin/CategoryManagement/delete/{category_id}") // Xóa Sản Phẩm
	public String delete (@PathVariable("category_id") String category_id) {
		catedao.deleteById(category_id);
		return "redirect:/admin/CategoryManagement";
	}
	//////////Quản Lý Trang Category ////////// Quản Lý Trang Category ////////// Quản Lý Trang Category 	
	
	////////// Trang Báo Cáo ////////// Trang Báo Cáo ////////// Trang Báo Cáo ////////// Trang Báo Cáo
	// Report Controller
			@RequestMapping("/admin/Report")
			public String Report (Model model) {
				List<com.asm.entity.Report> rpitems = dao.getInventoryByCategory();
				model.addAttribute("rpitems",rpitems);
				return"admin/Report";
			}
	////////// Trang Báo Cáo ////////// Trang Báo Cáo ////////// Trang Báo Cáo ////////// Trang Báo Cáo			
	
	///////// Quản Lí Người Dùng ///////// Quản Lí Người Dùng ///////// Quản Lí Người Dùng	
			@Autowired
			AccountDAO accdao;
			
			@RequestMapping("/admin/UserManagement")
			public String UserManagement(Model model) {
				Account accitem = new Account();
				model.addAttribute("accitem",accitem);	
				List<Account> accitems = accdao.findAll(); // Lấy tất cả từ db của account
				model.addAttribute("accitems",accitems);
				return"admin/UserManagement";
			}
			
			@RequestMapping("/admin/UserManagement/edit/{username}")
			public String editAcc(Model model, @PathVariable("username") String username) {
				Account accitem = accdao.findById(username).get();
				model.addAttribute("accitem",accitem);
				List<Account> accitems = accdao.findAll();
				model.addAttribute("accitems",accitems);
				return"admin/UserManagement";
			}
			
			 @RequestMapping("/admin/UserManagement/create")
			public String create(Account accitem) {
				accdao.save(accitem);
				return"redirect:/admin/UserManagement";
			}
			
			@RequestMapping("/admin/UserManagement/update")
			public String update(Account accitem) {
				accdao.save(accitem);
				return"redirect:/admin/UserManagement";
			}
			
			@RequestMapping("/admin/UserManagement/delete/{username}")
			public String deleteAcc (@PathVariable("username") String username) {
				accdao.deleteById(username);
				return"redirect:/admin/UserManagement";
			}
			

			@RequestMapping("/admin/SearchUserManagement")
			public String searchUser(Model model,
			                            @RequestParam("keywords") Optional<String> kw,
			                            @RequestParam("p") Optional<Integer> p) {
			    String keywords = kw.orElse("");
			    Pageable pageable = PageRequest.of(p.orElse(0), 5); 
			    Page<Account> page = accdao.findByKeywords("%" + keywords + "%", pageable);

			    Account accitem = new Account(); // Tạo một đối tượng accitem cho from search
			    model.addAttribute("accitem", accitem); 
			    
			    model.addAttribute("page", page);
			    model.addAttribute("kw", keywords);
			    return "admin/SearchUserManagement";
			}
			
	///////// Quản Lí Người Dùng ///////// Quản Lí Người Dùng ///////// Quản Lí Người Dùng		
}

package com.asm.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asm.entity.Product;
import com.asm.entity.Report;


public interface ProductDAO extends JpaRepository<Product, Integer>{

//	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
//	List<Product> findByPrice(double minPrice, double maxPrice);
//	
//	
//	List<Product> findByPriceBetween(double minPrice, double maxPrice); // DSL

@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
Page<Product> findByKeywords(String keywords, Pageable pageable);

Page<Product> findAllByNameLike(String keywords, Pageable pageable);// DSL
//
//	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
//			+ " FROM Product o "
//			+ " GROUP BY o.category"
//			+ " ORDER BY sum(o.price) DESC")
//	List<Report> getInventoryByCategory();
	
	
	
	
//	
//	 @Query("SELECT o FROM Product o WHERE o.category.name LIKE %?1% AND o.price BETWEEN ?2 AND ?3")
//	    List<Product> findByNameAndPrice(String name, double minPrice, double maxPrice);
//	 
	 // tim kiem loc
@Query("SELECT o FROM Product o WHERE "
        + "(:keywords IS NULL OR o.name LIKE %:keywords%) AND "
        + "(coalesce(:category, '') = '' OR o.category.name = :category) AND "
        + "(:minPrice IS NULL OR o.price >= :minPrice) AND "
        + "(:maxPrice IS NULL OR o.price <= :maxPrice) AND "
        + "(:colors IS NULL OR o.color IN :colors)")
   Page<Product> findByFilter(
       @Param("keywords") String keywords,
       @Param("category") String category,
       @Param("minPrice") Double minPrice,
       @Param("maxPrice") Double maxPrice,
       @Param("colors") List<String> colors,
       Pageable pageable);

@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
List<Product> findByPrice(double minPrice, double maxPrice);


List<Product> findByPriceBetween(double minPrice, double maxPrice); // DSL


@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
		+ " FROM Product o "
		+ " GROUP BY o.category"
		+ " ORDER BY sum(o.price) DESC")
List<Report> getInventoryByCategory();





 @Query("SELECT o FROM Product o WHERE o.category.name LIKE %?1% AND o.price BETWEEN ?2 AND ?3")
    List<Product> findByNameAndPrice(String name, double minPrice, double maxPrice);

// @Query("select new Report(o.category.name, sum(o.price), count(o)) from Product o group by o.category.name order by sum(o.price) desc")
//List<Report> getInventoryByCategory();
}


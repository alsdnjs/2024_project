package com.ict.products.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.products.service.ProductsService;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;

@Controller
public class ProductsController {
	
	@Autowired
	private ProductsService productsService;
	
	@GetMapping("/products")
	public ModelAndView productsList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("products/product_list");
		String category = request.getParameter("category");
		
		
		try {
			//카테고리 리스트 불러오기
			List<CategoryVO> categoryList = productsService.getCategoryList();
			mv.addObject("categoryList", categoryList);
			
			if(category == null) {
				// 모든 상품 리스트 불러오기
				List<ProductsVO> allProductList = productsService.getAllProductList();
				
				mv.addObject("ProductList", allProductList);
				return mv;
			} else {
				// 카테고리에 맞는 상품 리스트 불러오기
				List<ProductsVO> categoryProductList = productsService.getProductList(category);
				
				mv.addObject("ProductList", categoryProductList);
				return mv;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
}

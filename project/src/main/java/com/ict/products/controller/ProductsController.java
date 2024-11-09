package com.ict.products.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.product.controller.ManagerProductController;
import com.ict.manager.product.service.ProductService;
import com.ict.manager.product.vo.ManagerProductVO;
import com.ict.products.service.ProductsService;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.MembersVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

@Controller
public class ProductsController {
	
	@Autowired
	private ProductsService productsService;
	@Autowired
	private Paging paging;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/products")
	public ModelAndView productsList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("products/products_list");
		
		//페이지 다시 불러올 때 받을 값들
		String category_idx = request.getParameter("category_idx");
		String orderBy = request.getParameter("orderBy");

		System.out.println("category_idx: " + category_idx);
		System.out.println("orderBy: " + orderBy);
		
		try {
			//카테고리 리스트 불러오기
			List<CategoryVO> categoryList = productsService.getCategoryList();
			mv.addObject("categoryList", categoryList);

			System.out.println(categoryList);
			
			if(category_idx == null || category_idx.trim().isEmpty()) {
				// category_idx = "defaultCategory"; // 기본 카테고리 값 설정
				// 모든 상품 리스트 불러오기	
				// orderBy 값이 없는 처음에는
				if(orderBy == null || orderBy.trim().isEmpty() || orderBy.equals("desc")) {
					List<ProductsVO> allProductList = productsService.getAllProductListDesc();					
					mv.addObject("ProductList", allProductList);
				} else {
					List<ProductsVO> allProductList = productsService.getAllProductListAsc();					
					mv.addObject("ProductList", allProductList);
				}
				
				return mv;
			} else {
				// orderBy 값이 없는 처음에는
				if(orderBy == null || orderBy.trim().isEmpty() || orderBy.equals("desc")) {
					// 카테고리에 맞는 상품 리스트 불러오기
					List<ProductsVO> categoryProductList = productsService.getProductListDesc(category_idx);					
					mv.addObject("ProductList", categoryProductList);
				} else {
					List<ProductsVO> categoryProductList = productsService.getProductListAsc(category_idx);
					mv.addObject("ProductList", categoryProductList);
				}
				
				System.out.println(categoryList);
				
				return mv;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@GetMapping("/products_detail")
	public ModelAndView productDetail(@RequestParam("product_idx") String product_idx) {
			System.out.println("ho"+product_idx);
		try {
			
			ModelAndView mv = new ModelAndView("products/products_detail");
			
			ProductsVO pvo = productsService.getProductDetail(product_idx);
			System.out.println(pvo.getProduct_idx());
			mv.addObject("pvo", pvo);
			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("delete_review")
	public ModelAndView deleteReview(@RequestParam("review_idx") String review_idx, 
			@ModelAttribute("product_idx") String product_idx) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/products_detail");
			
			int result = productsService.getReviewDelete(review_idx);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	@GetMapping("insert_review")
	public ModelAndView insertReview(ReviewVO rvo,
			@ModelAttribute("product_idx") String product_idx) {
		try {
			
			System.out.println(rvo.getUser_idx());
			int result = productsService.getReviewInsert(rvo);
			if(result > 0) {
				
			}
			return new ModelAndView("redirect:/products_detail");
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	@GetMapping("/product_search_main")
	public ModelAndView productsSearchList(
	        HttpServletRequest request,
	        @RequestParam(value = "keyword", required = false) String keyword) {
	    ModelAndView mv = new ModelAndView("products/products_list_search");
	    String orderBy = request.getParameter("orderBy");

	    try {
	        List<ProductsVO> productList;

	        if (keyword != null && !keyword.trim().isEmpty()) {
	            // 검색어가 있을 때 정렬에 따라 결과 제공
	            if (orderBy == null || orderBy.trim().isEmpty() || orderBy.equals("desc")) {
	                productList = productsService.getProductListSearchDesc(keyword);
	            } else {
	                productList = productsService.getProductListSearchAsc(keyword);
	            }
	        } else {
	            // 검색어가 없을 때 전체 상품 리스트 불러오기
	            if (orderBy == null || orderBy.trim().isEmpty() || orderBy.equals("desc")) {
	                productList = productsService.getAllProductListDesc();
	            } else {
	                productList = productsService.getAllProductListAsc();
	            }
	        }

	        mv.addObject("ProductList", productList);
	        mv.addObject("keyword", keyword);
	        return mv;

	    } catch (Exception e) {
	        System.out.println(e);
	        return null;
	    }
	}

	
}

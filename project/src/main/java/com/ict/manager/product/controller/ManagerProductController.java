package com.ict.manager.product.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.product.service.ProductService;
import com.ict.manager.product.vo.ManagerProductVO;

@Controller
public class ManagerProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/product_list")
	public ModelAndView ProductList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page - 1) * size;

		ModelAndView mv = new ModelAndView("manager/product/product_list");
		List<ManagerProductVO> product_list = productService.getProductList(page, size);

		int totalProducts = productService.getProductCount();
		int totalPages = (int) Math.ceil((double) totalProducts / size);

		mv.addObject("product_list", product_list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}
	
	@PostMapping("/check_product_idx")
	@ResponseBody
	public Map<String, Object> checkProductId(@RequestParam("product_idx") String product_idx) {
	    Map<String, Object> response = new HashMap<>();
	    int count = productService.getProductIdCheck(product_idx); // 제품 ID 체크 서비스 호출
	    boolean exists = (count > 0); // 존재 여부 판단
	    response.put("exists", exists);
	    return response;
	}

	@GetMapping("/product_write")
	public ModelAndView ProductWrite() {
		return new ModelAndView("manager/product/product_write");
	}

	@GetMapping("/product_detail")
	public ModelAndView ProductDetail(@RequestParam("product_idx") String product_idx) {
		ModelAndView mv = new ModelAndView("manager/product/product_onelist");
		ManagerProductVO mpvo = productService.getProductDetail(product_idx);

		if (mpvo != null) {
			mv.addObject("mpvo", mpvo);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}

	@PostMapping("/product_write_ok")
	public ModelAndView ProductWriteOk(ManagerProductVO mpvo,
			HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/product_list");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = mpvo.getFile_name();
			if (file.isEmpty()) {
				mpvo.setThumbnail_url("");
			} else {
				UUID uuid = UUID.randomUUID();
				String thumbnail_url = uuid.toString() + "_" + file.getOriginalFilename();
				mpvo.setThumbnail_url(thumbnail_url);
				
				file.transferTo(new File(path, thumbnail_url));
			}
			
			int result = productService.getProductInsert(mpvo);
			if (result > 0) {
				return mv;
			}

			return new ModelAndView("manager/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

	@PostMapping("/product_delete_ok")
	public ModelAndView ProductDeleteOK(ManagerProductVO mpvo) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mpvo.getProduct_idx());
		// 사용자를 삭제합니다
		int result = productService.getProductDelete(mpvo.getProduct_idx());
		if (result > 0) {
			mv.setViewName("redirect:/product_list");
			return mv;
		}

		return new ModelAndView("manager/error");
	}

	@GetMapping("/product_search")
	public ModelAndView SearchProducts(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(defaultValue = "1") int page) {
		// System.out.println(keyword); 얘는 잘 넘어옴..
		int size = 10; // 페이지당 항목 수
		int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋

		List<ManagerProductVO> productList;
		int totalproducts;

		if (keyword != null && !keyword.isEmpty()) {
			productList = productService.getSearchProduct(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
			System.out.println(productList);
			totalproducts = productService.getSearchProductCount(keyword); // 검색어에 따른 총 사용자 수
		} else {
			productList = productService.getProductList(page, size); // 전체 사용자 목록
			totalproducts = productService.getProductCount();
		}

		int totalPages = (int) Math.ceil((double) totalproducts / size);

		ModelAndView mv = new ModelAndView("manager/product/product_list");
		mv.addObject("product_list", productList);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}

}

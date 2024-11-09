package com.ict.products.service;

import java.util.List;

import com.ict.cart.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

public interface ProductsService {
	// 모든 상품 리스트 정렬
	public List<ProductsVO> getAllProductListAsc() throws Exception;
	public List<ProductsVO> getAllProductListDesc() throws Exception;
	
	// 카테고리에 맞는 상품 리스트 정렬
    public List<ProductsVO> getProductListAsc(String category_idx) throws Exception;
    public List<ProductsVO> getProductListDesc(String category_idx) throws Exception;
    
    // 검색어에 맞는 상품 리스트 정렬
    public List<ProductsVO> getProductListSearchAsc(String keyword) throws Exception;
    public List<ProductsVO> getProductListSearchDesc(String keyword) throws Exception;
    
    // 상품 상세 페이지
    public ProductsVO getProductDetail(String product_idx) throws Exception;
    
    // 상품 리뷰 리스트
    public List<ReviewVO> getReviewList(String product_idx, int limit, int offset) throws Exception;
    
    // 리뷰 전체 개수
    public int getReviewsCount(String product_idx) throws Exception;
    
    // 리뷰 삭제
    public int getReviewDelete(String review_idx) throws Exception;
    
    //리뷰 작성
    public int getReviewInsert(ReviewVO rvo) throws Exception;
    
    // 카테고리 리스트
    public List<CategoryVO> getCategoryList() throws Exception;
    
    // 상품 등록
    public int getProductInsert(ProductsVO svo) throws Exception;
}

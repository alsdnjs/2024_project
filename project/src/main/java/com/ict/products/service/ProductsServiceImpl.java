package com.ict.products.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.cart.vo.CartVO;
import com.ict.products.dao.ProductsDAO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

@Service
public class ProductsServiceImpl implements ProductsService{
	
	@Autowired
	private ProductsDAO productDAO;
	
	@Override
	public List<ProductsVO> getAllProductListAsc() throws Exception {
		return productDAO.getAllProductListAsc();
	}
	
	@Override
	public List<ProductsVO> getAllProductListDesc() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getAllProductListDesc();
	}

	@Override
	public List<ProductsVO> getProductListDesc(String category_idx) throws Exception {
		return productDAO.getProductListDesc(category_idx);
	}
	@Override
	public List<ProductsVO> getProductListAsc(String category_idx) throws Exception {
		return productDAO.getProductListAsc(category_idx);
	}
	
	@Override
    public List<CategoryVO> getCategoryList() throws Exception {
		return productDAO.getCategoryList();
	}
	
	@Override
	public ProductsVO getProductDetail(String product_idx) throws Exception {
		return productDAO.getProductDetail(product_idx);
	}
	
	
	//리뷰 리스트 불러오기
	@Override
	public List<ReviewVO> getReviewList(String product_idx, int limit, int offset) throws Exception {
		return productDAO.getReviewList(product_idx, limit, offset);
	}
	
	//리뷰 갯수 불러오기
	@Override
	public int getReviewsCount(String product_idx) throws Exception {
		return productDAO.getReviewsCount(product_idx);
	}
	
	// 리뷰 삭제
	@Override
	public int getReviewDelete(String review_idx) throws Exception {	
		return productDAO.getReviewDelete(review_idx);
	}
	
	//리뷰 작성
	@Override
	public int getReviewInsert(ReviewVO rvo) throws Exception {
		return productDAO.getReviewInsert(rvo);
	}

	@Override
	public int getProductInsert(ProductsVO svo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 검색
	@Override
	public List<ProductsVO> getProductListSearchAsc(String keyword) throws Exception {
		return productDAO.getProductSearchListAsc(keyword);
	}

	@Override
	public List<ProductsVO> getProductListSearchDesc(String keyword) throws Exception {
		return productDAO.getProductSearchListDesc(keyword);
	}


//11/10
	@Override
	public ProductsVO getProductById(int productIdx) throws Exception {
	    return productDAO.getProductById(productIdx);
	}


	
	


}

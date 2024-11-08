package com.ict.products.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.cart.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

@Repository
public class ProductsDAOImpl implements ProductsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ProductsVO> getAllProductListAsc() throws Exception {
		return sqlSessionTemplate.selectList("products.all_list_asc");
	}
	@Override
	public List<ProductsVO> getAllProductListDesc() throws Exception {
		return sqlSessionTemplate.selectList("products.all_list_desc");
	}
	

	@Override
	public List<ProductsVO> getProductListAsc(String category_idx) throws Exception {
		return sqlSessionTemplate.selectList("products.category_products_asc", category_idx);
	}
	@Override
	public List<ProductsVO> getProductListDesc(String category_idx) throws Exception {
		return sqlSessionTemplate.selectList("products.category_products_desc", category_idx);
	}
	
	
	@Override
    public List<CategoryVO> getCategoryList() throws Exception {
		return sqlSessionTemplate.selectList("products.category");
	}


	@Override
	public ProductsVO getProductDetail(String product_idx) throws Exception {
		return sqlSessionTemplate.selectOne("products.detail", product_idx);
	}
	
	//리뷰 리스트 불러오기
	@Override
	public List<ReviewVO> getReviewList(String product_idx ,int limit, int offset) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_idx", Integer.parseInt(product_idx));
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("products.reviews_paging", map);
	}
	
	//리뷰 갯수 불러오기
	@Override
	public int getReviewsCount(String product_idx) throws Exception {
		return sqlSessionTemplate.selectOne("products.reviews_count", product_idx);
	}
	
	//리뷰 삭제
	@Override
	public int getReviewDelete(String review_idx) throws Exception {
		return sqlSessionTemplate.delete("products.reviews_delete", review_idx);
	}
	
	//리뷰 작성
	@Override
	public int getReviewInsert(ReviewVO rvo) throws Exception {
		return sqlSessionTemplate.insert("products.review_insert", rvo);
	}


	@Override
	public int getProductInsert(ProductsVO svo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}





}

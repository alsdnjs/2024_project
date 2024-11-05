package com.ict.products.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.products.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;

@Repository
public class ProductsDAOImpl implements ProductsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ProductsVO> getAllProductList() throws Exception {
		return sqlSessionTemplate.selectList("products.all_list");
	}

	@Override
	public List<ProductsVO> getProductList(String category) throws Exception {
		return sqlSessionTemplate.selectList("products.category_products", category);
	}
	
	@Override
    public List<CategoryVO> getCategoryList() throws Exception {
		return sqlSessionTemplate.selectList("products.category");
	}


	@Override
	public ProductsVO getProductDetail(String shop_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartVO> getCartList(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartVO getCartCheck(String m_id, String p_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCartInsert(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartUpdate(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartEdit(CartVO cavo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartDelete(String cart_idx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getProductInsert(ProductsVO svo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}

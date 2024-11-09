package com.ict.cart.dao;

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
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CartVO> getCartList(String user_idx) throws Exception {
		return sqlSessionTemplate.selectList("cart.list", user_idx);
	}

	@Override
	public CartVO getCartCheck(String m_idx, String p_num) {
		return null;
	}

	@Override
	public String getCartInsert(CartVO cartVO) throws Exception {
		return null;
	}

	@Override
	public String getCartUpdate(CartVO cartVO) throws Exception {
		return null;
	}

	@Override
	public String getCartEdit(CartVO cavo) throws Exception {
		return null;
	}

	@Override
	public String getCartDelete(String cart_idx) throws Exception {
		return null;
	}

}

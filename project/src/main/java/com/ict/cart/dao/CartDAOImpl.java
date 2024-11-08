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
	public int getCartInsert(CartVO cartVO) throws Exception {
		return 0;
	}

	@Override
	public int getCartUpdate(CartVO cartVO) throws Exception {
		return 0;
	}

	@Override
	public int getCartEdit(CartVO cavo) throws Exception {
		return 0;
	}

	@Override
	public int getCartDelete(String cart_idx) throws Exception {
		return 0;
	}

}

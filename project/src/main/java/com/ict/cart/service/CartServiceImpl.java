package com.ict.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.cart.dao.CartDAO;
import com.ict.cart.vo.CartVO;
import com.ict.products.dao.ProductsDAO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartVO> getCartList(String user_idx) throws Exception {
		return cartDAO.getCartList(user_idx);
	}

	@Override
	public CartVO getCartCheck(String m_id, String p_num) {
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

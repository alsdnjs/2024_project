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

	@Override
	public CartVO getProductByIdx(String productIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteSelectedItems(List<Integer> product_ids, String user_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	

	@Override
	public int updateExistingQuantity(String cart_idx, int quantity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CartVO isProductInCart(String user_idx, String product_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addToCart(String user_idx, String product_idx, int quantity) {
		// TODO Auto-generated method stub
		return 0;
	}

}

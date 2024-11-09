package com.ict.cart.dao;

import java.util.List;

import com.ict.cart.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

public interface CartDAO {
    
    // 장바구니 관련
	
    // 장바구니 리스트 가져오기
    public List<CartVO> getCartList(String user_idx) throws Exception;
    
    public CartVO getCartCheck(String m_idx, String p_num);
    public String getCartInsert(CartVO cartVO) throws Exception; 
    public String getCartUpdate(CartVO cartVO) throws Exception; 
    public String getCartEdit(CartVO cavo)throws Exception;
    public String getCartDelete(String cart_idx) throws Exception; 

}

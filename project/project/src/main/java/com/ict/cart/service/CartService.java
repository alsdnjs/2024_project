package com.ict.cart.service;

import java.util.List;

import com.ict.cart.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

public interface CartService {

    // 장바구니 관련
    // 장바구니 리스트 가져오기
    public List<CartVO> getCartList(String user_idx) throws Exception;
    
    public CartVO getCartCheck(String m_id, String p_num);
    public int getCartInsert(CartVO cartVO) throws Exception; 
    public int getCartUpdate(CartVO cartVO) throws Exception; 
    public int getCartEdit(CartVO cavo)throws Exception;
    public int getCartDelete(String cart_idx) throws Exception; 
    
}

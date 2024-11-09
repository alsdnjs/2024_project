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
    public String getCartInsert(CartVO cartVO) throws Exception; 
    public String getCartUpdate(CartVO cartVO) throws Exception; 
    public String getCartEdit(CartVO cavo)throws Exception;
    public String getCartDelete(String cart_idx) throws Exception;

	public CartVO getProductByIdx(String productIdx);

	public int deleteSelectedItems(List<Integer> product_ids, String user_idx);

	public CartVO isProductInCart(String user_idx, String product_idx);

	public int addToCart(String user_idx, String product_idx, int quantity);

	public int updateExistingQuantity(String cart_idx, int quantity);

	
    
}

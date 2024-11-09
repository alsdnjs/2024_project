package com.ict.cart.service;

import java.util.List;

import com.ict.cart.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;
import com.ict.products.vo.ReviewVO;

public interface CartService {

    // 장바구니 리스트 가져오기
    public List<CartVO> getCartList(String user_idx) throws Exception;
    // 이미 장바구니에 있는 상품인지 확인
    public CartVO isProductInCart(String user_idx, int product_idx) throws Exception; 
    // 장바구니에 상품 등록
    public int addToCart(String user_idx, int product_idx, int quantity) throws Exception; 
    // 이미 있는 상품의 수량 추가
    public int updateExistingQuantity(int cart_idx, int quantity) throws Exception; 
    // 선택된 요소 장바구니에서 삭제
    public int deleteSelectedItems(List<Integer> product_ids, String user_idx) throws Exception;
    
    public CartVO getProductByIdx(int product_idx) throws Exception;
    
    public int getCartEdit(CartVO cavo) throws Exception;
    public int getCartDelete(String cart_idx) throws Exception; 
}

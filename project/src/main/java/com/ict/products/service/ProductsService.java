package com.ict.products.service;

import java.util.List;

import com.ict.products.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;

public interface ProductsService {
	public List<ProductsVO> getAllProductList() throws Exception;
    public List<ProductsVO> getProductList(String category) throws Exception;
    public List<CategoryVO> getCategoryList() throws Exception;
    public ProductsVO getProductDetail(String shop_idx) throws Exception;
    public List<CartVO> getCartList(String m_id) throws Exception;
    public CartVO getCartCheck(String m_id, String p_num);
    public int getCartInsert(CartVO cartVO) throws Exception; 
    public int getCartUpdate(CartVO cartVO) throws Exception; 
    public int getCartEdit(CartVO cavo)throws Exception;
    public int getCartDelete(String cart_idx) throws Exception; 
    public int getProductInsert(ProductsVO svo) throws Exception;
}

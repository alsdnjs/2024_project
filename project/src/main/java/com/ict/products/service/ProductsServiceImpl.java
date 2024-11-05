package com.ict.products.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.products.dao.ProductsDAO;
import com.ict.products.vo.CartVO;
import com.ict.products.vo.CategoryVO;
import com.ict.products.vo.ProductsVO;

@Service
public class ProductsServiceImpl implements ProductsService{
	
	@Autowired
	private ProductsDAO productDAO;
	
	@Override
	public List<ProductsVO> getAllProductList() throws Exception {
		return productDAO.getAllProductList();
	}

	@Override
	public List<ProductsVO> getProductList(String category) throws Exception {
		return productDAO.getProductList(category);
	}
	
	@Override
    public List<CategoryVO> getCategoryList() throws Exception {
		return productDAO.getCategoryList();
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

package com.ict.manager.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.product.dao.ProductDAO;
import com.ict.manager.product.vo.ManagerProductVO;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO ProductDAO;
	
	@Override
	public List<ManagerProductVO> getProductList(int page, int size) {
		return ProductDAO.getProductList(page, size);
	}

	@Override
	public int getProductInsert(ManagerProductVO mpvo) {
		return ProductDAO.getProductInsert(mpvo);
	}

	@Override
	public ManagerProductVO getProductDetail(String product_idx) {
		return ProductDAO.getProductDetail(product_idx);
	}

	@Override
	public int getProductUpdate(ManagerProductVO mpvo) {
		return ProductDAO.getProductUpdate(mpvo);
	}

	@Override
	public int getProductDelete(String product_idx) {
		return ProductDAO.getProductDelete(product_idx);
	}


	@Override
	public int getProductCount() {
		return ProductDAO.getProductCount();
	}

	@Override
	public List<ManagerProductVO> getSearchProduct(String keyword, int page, int size) {
		return ProductDAO.searchProduct(keyword, page, size);
	}

	@Override
	public int getSearchProductCount(String keyword) {
		return ProductDAO.getSearchProductCount(keyword);
	}

	@Override
	public int getProductIdCheck(String product_idx) {
		
		return ProductDAO.countByProductId(product_idx);
	}

}

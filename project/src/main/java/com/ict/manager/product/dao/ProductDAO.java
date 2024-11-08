package com.ict.manager.product.dao;

import java.util.List;

import com.ict.manager.product.vo.ManagerProductVO;


public interface ProductDAO {
		// 리스트
		public List<ManagerProductVO> getProductList (int page, int size);
		
		// 삽입
		public int getProductInsert(ManagerProductVO mpvo);
		
		// 상세보기
		public ManagerProductVO getProductDetail(String product_idx);
		
		// 수정하기
		public int getProductUpdate(ManagerProductVO mpvo);
		
		// 삭제하기
		public int getProductDelete(String product_idx);
		
		// 페이지
		public int getProductCount();
		
		// 검색
		public List<ManagerProductVO> searchProduct(String keyword, int page, int size);
		
		// 검색 페이지
		public int getSearchProductCount(String keyword);
		
		// 제품번호 중복체크
		public int countByProductId(String product_idx);
}

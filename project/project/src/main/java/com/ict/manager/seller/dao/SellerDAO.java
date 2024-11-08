package com.ict.manager.seller.dao;

import java.util.List;

import com.ict.manager.seller.vo.ManagerSellerVO;


public interface SellerDAO {
		// 리스트
		public List<ManagerSellerVO> getSellerList (int page, int size);
		
		// 상세보기
		public ManagerSellerVO getSellerDetail(String seller_idx);
		
		// 상세보기
		public ManagerSellerVO getSellerDetail2(String user_id);
		
		// 수정하기
		public int getSellerUpdate(ManagerSellerVO msvo);
		
		// 삭제하기
		public int getSellerDelete(String seller_idx);
		
		// 페이지
		public int getSellerCount();
		
		// 검색
		public List<ManagerSellerVO> searchSeller(String keyword, int page, int size);
		
		// 검색 페이지
		public int getSearchSellerCount(String keyword);
}

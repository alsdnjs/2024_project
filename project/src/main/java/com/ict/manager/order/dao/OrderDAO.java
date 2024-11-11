package com.ict.manager.order.dao;

import java.util.List;

import com.ict.manager.order.vo.ManagerOrderVO;

public interface OrderDAO {
		// 리스트
		public List<ManagerOrderVO> getOrderList (int page, int size);
		
		// 상세보기
		public ManagerOrderVO getOrderDetail(String orders_idx);
		
		// 삭제하기
		public int getOrderDelete(String orders_idx);
		
		// 페이지
		public int getOrderCount();
			
		// 검색
		public List<ManagerOrderVO> searchOrder(String keyword, int page, int size);
		
		// 검색 페이지
		public int getSearchOrderCount(String keyword);
		
		
		
		
		
		
		
		// 결제 완료 후 주문을 저장하기 위한 메서드 1111
	    int insertOrder(ManagerOrderVO order);
}

package com.ict.manager.order.service;

import java.util.List;

import com.ict.manager.order.vo.ManagerOrderVO;


public interface OrderService {
	// 리스트
	public List<ManagerOrderVO> getOrderList(int page, int size);
	
	// 상세보기
	public ManagerOrderVO getOrderDetail(String orders_idx);
	
	// 삭제하기
	public int getOrderDelete(String orders_idx);
	
	
	// 페이지
	public int getOrderCount();
		
	// 검색
	public List<ManagerOrderVO> getSearchOrder(String keyword, int page, int size);
	
	// 검색 페이지..
	public int getSearchOrderCount(String keyword);
	
	
	
	
	
	
	
    // 결제 완료 후 주문 저장 메서드 추가  1111
    int saveOrder(ManagerOrderVO order);

}

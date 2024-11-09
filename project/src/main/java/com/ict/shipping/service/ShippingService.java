package com.ict.shipping.service;

import java.util.List;

import com.ict.shipping.vo.ShippingVO;

public interface ShippingService {
	
	// 페이징 처리 - 전체 배송내역 수
	public int getTotalCount(String user_id);
			
	// 페이징 처리를 위한 리스트
	public List<ShippingVO> getShippingList(String user_id, int offset, int limit);
	
	// 주문내역 건수(진행중 주문)
	public List<ShippingVO> getOrderCount(String user_id);
}

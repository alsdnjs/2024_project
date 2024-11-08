package com.ict.shipping.dao;

import java.util.List;

import com.ict.shipping.vo.ShippingVO;

public interface ShippingDAO {
	
	// 주문내역 리스트(주문 ID로 조회)
	// public List<ShippingVO> getShippingList(int orders_idx);
	
	// 페이징 처리 - 전체 배송내역 수
	public int getTotalCount(int orders_idx);
			
	// 페이징 처리를 위한 리스트
	public List<ShippingVO> getShippingList(int orders_idx, int offset, int limit);
}

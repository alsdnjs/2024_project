package com.ict.shipping.dao;

import java.util.List;

import com.ict.shipping.vo.ShippingVO;

public interface ShippingDAO {
	
	// 페이징 처리 - 전체 배송내역 수
	public int getTotalCount(int user_idx);
			
	// 페이징 처리를 위한 리스트
	public List<ShippingVO> getShippingList(int user_idx, int offset, int limit);

	// 주문내역 건수(진행중 주문)
	public List<ShippingVO> getOrderCount(int user_idx);
	
}

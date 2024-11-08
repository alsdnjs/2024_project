package com.ict.shipping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shipping.dao.ShippingDAO;
import com.ict.shipping.vo.ShippingVO;

@Service
public class ShippingServiceImpl implements ShippingService{
	
	@Autowired
	private ShippingDAO shippingDAO;
	
	/*
	  @Override public List<ShippingVO> getShippingList(int orders_idx) { return
	  shippingDAO.getShippingList(orders_idx); }
	 */

	@Override
	public int getTotalCount(int orders_idx) {
		return shippingDAO.getTotalCount(orders_idx);
	}

	@Override
	public List<ShippingVO> getShippingList(int orders_idx, int offset, int limit) {
		return shippingDAO.getShippingList(orders_idx, offset, limit);
	}
	
}

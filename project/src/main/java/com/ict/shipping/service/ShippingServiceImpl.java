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
	
	@Override
	public int getTotalCount(int user_idx) {
		return shippingDAO.getTotalCount(user_idx);
	}

	@Override
	public List<ShippingVO> getShippingList(int user_idx, int offset, int limit) {
		return shippingDAO.getShippingList(user_idx, offset, limit);
	}

	@Override
	public List<ShippingVO> getOrderCount(int user_idx) {
		return shippingDAO.getOrderCount(user_idx);
	}

	
}

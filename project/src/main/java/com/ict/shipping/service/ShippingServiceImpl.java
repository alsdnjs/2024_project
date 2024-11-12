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
	public int getTotalCount(String user_id) {
		return shippingDAO.getTotalCount(user_id);
	}

	@Override
	public List<ShippingVO> getShippingList(String user_id, int offset, int limit) {
		return shippingDAO.getShippingList(user_id, offset, limit);
	}

	@Override
	public List<ShippingVO> getOrderCount(String user_id) {
		 System.out.println("여기는ser"+ user_id);
		return shippingDAO.getOrderCount(user_id);
	}

	@Override
	public void insertShipping(ShippingVO shipping) {
		shippingDAO.insertShipping(shipping);
		
	}


}

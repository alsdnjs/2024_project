package com.ict.manager.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.order.dao.OrderDAO;
import com.ict.manager.order.vo.ManagerOrderVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<ManagerOrderVO> getOrderList(int page, int size) {
		return orderDAO.getOrderList(page, size);
	}

	@Override
	public ManagerOrderVO getOrderDetail(String orders_idx) {
		return orderDAO.getOrderDetail(orders_idx);
	}

	@Override
	public int getOrderDelete(String orders_idx) {
		return orderDAO.getOrderDelete(orders_idx);
	}


	@Override
	public int getOrderCount() {
		return orderDAO.getOrderCount();
	}


	@Override
	public List<ManagerOrderVO> getSearchOrder(String keyword, int page, int size) {
		return orderDAO.searchOrder(keyword, page, size);
	}

	@Override
	public int getSearchOrderCount(String keyword) {
		return orderDAO.getSearchOrderCount(keyword);
	}
	
	
	//1111
	  @Override
	    public int saveOrder(ManagerOrderVO order) {
	        return orderDAO.insertOrder(order);
	    }
	

}

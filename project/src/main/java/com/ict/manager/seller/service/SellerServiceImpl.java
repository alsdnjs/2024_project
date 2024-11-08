package com.ict.manager.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.seller.vo.ManagerSellerVO;
import com.ict.manager.user.vo.ManagerUserVO;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	private com.ict.manager.seller.dao.SellerDAO SellerDAO;
	
	@Override
	public List<ManagerSellerVO> getSellerList(int page, int size) {
		return SellerDAO.getSellerList(page, size);
	}


	@Override
	public ManagerSellerVO getSellerDetail(String seller_idx) {
		return SellerDAO.getSellerDetail(seller_idx);
	}
	@Override
	public ManagerSellerVO getSellerDetail2(String user_id) {
		return SellerDAO.getSellerDetail2(user_id);
	}

	@Override
	public int getSellerUpdate(ManagerSellerVO msvo) {
		return SellerDAO.getSellerUpdate(msvo);
	}

	@Override
	public int getSellerDelete(String seller_idx) {
		return SellerDAO.getSellerDelete(seller_idx);
	}


	@Override
	public int getSellerCount() {
		return SellerDAO.getSellerCount();
	}


	@Override
	public List<ManagerSellerVO> getSearchSeller(String keyword, int page, int size) {
		return SellerDAO.searchSeller(keyword, page, size);
	}

	@Override
	public int getSearchSellerCount(String keyword) {
		return SellerDAO.getSearchSellerCount(keyword);
	}

}

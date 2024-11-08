package com.ict.manager.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.manager.dao.ManagerDAO;
import com.ict.manager.manager.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAO ManagerDAO;
	
	@Override
	public List<ManagerVO> getManagerList(int page, int size) {
		return ManagerDAO.getManagerList(page, size);
	}

	@Override
	public int getManagerInsert(ManagerVO mmvo) {
		return ManagerDAO.getManagerInsert(mmvo);
	}

	@Override
	public ManagerVO getManagerDetail(String manager_id) {
		return ManagerDAO.getManagerDetail(manager_id);
	}

	@Override
	public int getManagerUpdate(ManagerVO mmvo) {
		return ManagerDAO.getManagerUpdate(mmvo);
	}

	@Override
	public int getManagerDelete(String manager_id) {
		return ManagerDAO.getManagerDelete(manager_id);
	}

	@Override
	public ManagerVO getManagerById(String manager_id) {
		return ManagerDAO.getManagerById(manager_id);
	}


	@Override
	public int getManagerCount() {
		// TODO Auto-generated method stub
		return ManagerDAO.getManagerCount();
	}

	@Override
	public List<ManagerVO> getSearchManager(String keyword, int page, int size) {
		return ManagerDAO.searchManager(keyword, page, size);
	}

	@Override
	public int getSearchManagerCount(String keyword) {
		return ManagerDAO.getSearchManagerCount(keyword);
	}

}

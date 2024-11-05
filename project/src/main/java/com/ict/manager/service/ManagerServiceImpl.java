package com.ict.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.dao.ManagerDAO;
import com.ict.manager.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAO ManagerDAO;
	
	@Override
	public List<ManagerVO> getManagerList(int page, int size) {
		return ManagerDAO.getManagerList(page, size);
	}

	@Override
	public int getManagerInsert(ManagerVO mvo) {
		return ManagerDAO.getManagerInsert(mvo);
	}

	@Override
	public ManagerVO getManagerDetail(String manager_id) {
		return ManagerDAO.getManagerDetail(manager_id);
	}

	@Override
	public int getManagerUpdate(ManagerVO mvo) {
		return ManagerDAO.getManagerUpdate(mvo);
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

}

package com.ict.userrank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.userrank.dao.UserrankDAO;
import com.ict.userrank.vo.UserrankVO;

@Service
public class UserrankServiceImpl implements UserrankService{

	@Autowired
	private UserrankDAO userrankDAO;
	
	@Override
	public UserrankVO getUserById(String user_id) {
		return userrankDAO.getUserById(user_id);
	}

	

}

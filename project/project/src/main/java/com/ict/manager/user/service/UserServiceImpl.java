package com.ict.manager.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.user.vo.ManagerUserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private com.ict.manager.user.dao.UserDAO UserDAO;
	
	@Override
	public List<ManagerUserVO> getUserList(int page, int size) {
		return UserDAO.getUserList(page, size);
	}

	@Override
	public int getUserInsert(ManagerUserVO uvo) {
		return UserDAO.getUserInsert(uvo);
	}

	@Override
	public ManagerUserVO getUserDetail(String user_id) {
		return UserDAO.getUserDetail(user_id);
	}

	@Override
	public int getUserUpdate(ManagerUserVO uvo) {
		return UserDAO.getUserUpdate(uvo);
	}

	@Override
	public int getUserDelete(String user_id) {
		return UserDAO.getUserDelete(user_id);
	}


	@Override
	public int getUserCount() {
		return UserDAO.getUserCount();
	}

	@Override
	public int getUserWarn(ManagerUserVO uvo) {
		return UserDAO.getUserWarn(uvo);
	}

	@Override
	public void deleteExpiredWarnings() {
	}

	@Override
	public List<ManagerUserVO> getSearchUser(String keyword, int page, int size) {
		return UserDAO.searchUser(keyword, page, size);
	}

	@Override
	public int getSearchUserCount(String keyword) {
		return UserDAO.getSearchUserCount(keyword);
	}

	@Override
	public boolean isUserIdExists(String user_id) {
		// TODO Auto-generated method stub
		return UserDAO.getUserIdCheck(user_id) > 0;
	}

}

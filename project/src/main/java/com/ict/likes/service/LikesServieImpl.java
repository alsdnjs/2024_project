package com.ict.likes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.likes.dao.LikesDAO;
import com.ict.likes.vo.LikesVO;

@Service
public class LikesServieImpl implements LikesService{
	
	@Autowired
	private LikesDAO likesDAO;
	
	@Override
	public List<LikesVO> getLikesList(String user_id) {
		return likesDAO.getLikesList(user_id);
	}

}

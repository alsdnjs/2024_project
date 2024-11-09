package com.ict.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.like.dao.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDAO likeDAO;

	@Override
	public int addLike(int product_idx, int user_idx) throws Exception {
		return likeDAO.addLike(product_idx, user_idx);
	}

	@Override
	public int removeLike(int product_idx, int user_idx) throws Exception {
		return likeDAO.removeLike(product_idx, user_idx);
	}

	@Override
	public List<Integer> checkUsersLikes(int user_idx) throws Exception {
		return likeDAO.checkUsersLikes(user_idx);
	}

}

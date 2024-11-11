package com.ict.likes.dao;

import java.util.List;

import com.ict.likes.vo.LikesVO;

public interface LikesDAO {
	
	public List<LikesVO> getLikesList(String user_id);
}

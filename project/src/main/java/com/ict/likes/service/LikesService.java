package com.ict.likes.service;

import java.util.List;

import com.ict.likes.vo.LikesVO;

public interface LikesService {
	
	public List<LikesVO> getLikesList(String user_id);
}

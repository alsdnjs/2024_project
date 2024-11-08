package com.ict.likes.dao;

import java.util.List;

public interface LikeDAO {
	public int addLike(int product_idx, int user_idx) throws Exception;
	public int removeLike(int product_idx, int user_idx) throws Exception;
	public List<Integer> checkUsersLikes(int user_idx) throws Exception;
}

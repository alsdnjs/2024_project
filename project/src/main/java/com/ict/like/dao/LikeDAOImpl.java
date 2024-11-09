package com.ict.like.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAOImpl implements LikeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int addLike(int product_idx, int user_idx) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_idx", product_idx);
		map.put("user_idx", user_idx);
		return sqlSessionTemplate.insert("like.add", map);
	}

	@Override
	public int removeLike(int product_idx, int user_idx) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_idx", product_idx);
		map.put("user_idx", user_idx);
		return sqlSessionTemplate.delete("like.remove", map);
	}

	@Override
	public List<Integer> checkUsersLikes(int user_idx) throws Exception {
		return sqlSessionTemplate.selectList("like.check_user_likes", user_idx);
	}

}

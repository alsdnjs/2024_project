package com.ict.likes.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.likes.vo.LikesVO;

@Repository
public class LikesDAOImpl implements LikesDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<LikesVO> getLikesList(String user_id) {
		  return sqlSessionTemplate.selectList("likes.llist", user_id);
	}

}

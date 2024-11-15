package com.ict.userrank.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.userrank.vo.UserrankVO;

@Repository
public class UserrankDAOImpl implements UserrankDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserrankVO getUserById(String user_id) {
		return sqlSessionTemplate.selectOne("userrank.rank", user_id);
	}

}

package com.ict.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.point.vo.PointVO;

@Repository
public class PointDAOImpl implements PointDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<PointVO> getPointList(String user_id) {
		return sqlSessionTemplate.selectList("point.plist", user_id);
	}

}

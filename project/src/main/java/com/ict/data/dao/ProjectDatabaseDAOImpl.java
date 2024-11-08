package com.ict.data.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.data.vo.ProjectDatabaseVO;


@Repository
public class ProjectDatabaseDAOImpl implements ProjectDatabaseDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String insertDatabaseData(ProjectDatabaseVO pdvo) {
		int result= sqlSessionTemplate.insert("database.insertData", pdvo);
		return String.valueOf(result);
	}

}

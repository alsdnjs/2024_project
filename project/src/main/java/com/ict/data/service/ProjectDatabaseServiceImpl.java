package com.ict.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.data.dao.ProjectDatabaseDAO;
import com.ict.data.vo.ProjectDatabaseVO;

@Service
public class ProjectDatabaseServiceImpl implements ProjectDatabaseService{
	@Autowired
	private ProjectDatabaseDAO projectDatabaseDAO;
	
	@Override
	public String saveDatabaseData(ProjectDatabaseVO pdvo) {
		return projectDatabaseDAO.insertDatabaseData(pdvo);
	}

}

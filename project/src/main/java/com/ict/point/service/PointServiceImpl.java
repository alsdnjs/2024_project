package com.ict.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.point.dao.PointDAO;
import com.ict.point.vo.PointVO;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired
	private PointDAO pointDAO;
	@Override
	public List<PointVO> getPointList(String user_id) {
		return pointDAO.getPointList(user_id);
	}

}

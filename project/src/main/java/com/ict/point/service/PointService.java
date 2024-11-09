package com.ict.point.service;

import java.util.List;

import com.ict.point.vo.PointVO;

public interface PointService {
	public List<PointVO> getPointList(String user_id);
}

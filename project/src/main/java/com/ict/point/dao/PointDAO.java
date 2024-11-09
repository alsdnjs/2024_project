package com.ict.point.dao;

import java.util.List;

import com.ict.point.vo.PointVO;

public interface PointDAO {
	public List<PointVO> getPointList(String user_id);
}

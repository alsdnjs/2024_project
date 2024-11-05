package com.ict.manager.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.vo.ManagerVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ManagerVO> getManagerList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("manager.list", params);
	}

	@Override
	public int getManagerInsert(ManagerVO mvo) {
		return sqlSessionTemplate.insert("manager.insert", mvo);
	}

	@Override
	public ManagerVO getManagerDetail(String manager_id) {
		return sqlSessionTemplate.selectOne("manager.detail", manager_id);
	}

	@Override
	public int getManagerUpdate(ManagerVO mvo) {
		return sqlSessionTemplate.update("manager.update", mvo);
	}

	@Override
	public int getManagerDelete(String manager_id) {
		return sqlSessionTemplate.delete("manager.delete", manager_id);
	}

	@Override
	public ManagerVO getManagerById(String manager_id) {
		return sqlSessionTemplate.selectOne("manager.detail", manager_id);
	}

	@Override
	public int getManagerCount() {
		return sqlSessionTemplate.selectOne("manager.count");
	}

}

package com.ict.manager.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.user.vo.ManagerUserVO;


@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ManagerUserVO> getUserList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("user.list", params);
	}

	@Override
	public int getUserInsert(ManagerUserVO uvo) {
		return sqlSessionTemplate.insert("user.insert", uvo);
	}

	@Override
	public ManagerUserVO getUserDetail(String user_id) {
		return sqlSessionTemplate.selectOne("user.detail", user_id);
	}

	@Override
	public int getUserUpdate(ManagerUserVO uvo) {
		return sqlSessionTemplate.update("user.update", uvo);
	}

	@Override
	public int getUserDelete(String user_id) {
		return sqlSessionTemplate.delete("user.delete", user_id);
	}

	@Override
	public int getUserCount() {
		return sqlSessionTemplate.selectOne("user.count");
	}

	@Override
	public int getUserWarn(ManagerUserVO uvo) {
		return sqlSessionTemplate.update("user.warn", uvo);
	}

	@Override
	public void clearExpiredWarnings() {
		sqlSessionTemplate.update("user.warn_expire");
	}

	@Override
	public List<ManagerUserVO> searchUser(String keyword, int page, int size) {
		// System.out.println(keyword); 여기까지도 잘 감
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%"); // 검색 키워드 설정
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("user.search", params);
	}

	@Override
	public int getSearchUserCount(String keyword) {
		return sqlSessionTemplate.selectOne("user.search_count", "%" + keyword + "%");
	}

	@Override
	public int getUserIdCheck(String user_id) {
		return sqlSessionTemplate.selectOne("user.checkId", user_id);
	}

}

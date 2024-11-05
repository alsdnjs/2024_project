package com.ict.usercenter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.notice.vo.NoticeVO;


@Repository
public class UserCenterDAOImpl implements UserCenterDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<NoticeVO> getCenterList() {
		return sqlSessionTemplate.selectList("notice.list");
	}

	@Override
	public int getCenterInsert(NoticeVO nvo) {
		return sqlSessionTemplate.insert("notice.insert" , nvo);
	}

	@Override
	public NoticeVO getCenterDetail(String n_idx) {
		return sqlSessionTemplate.selectOne("notice.detail", n_idx);
	}

	@Override
	public int getCenterDelete(String n_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCenterUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getViewsUpdate(String n_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeVO> getNoticeList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		
		return sqlSessionTemplate.selectList("notice.pageList", map);
	}
	
	

}

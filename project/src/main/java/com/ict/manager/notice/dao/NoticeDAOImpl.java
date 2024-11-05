package com.ict.manager.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.notice.vo.NoticeVO;
@Repository
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return sqlSessionTemplate.selectList("notice.list");
	}

	@Override
	public int getNoticeInsert(NoticeVO nvo) {

		return sqlSessionTemplate.insert("notice.insert" , nvo);
	}

	@Override
	public NoticeVO getNoticeDetail(String n_idx) {
		return sqlSessionTemplate.selectOne("notice.detail", n_idx);
	}

	@Override
	public int getNoticeDelete(String n_idx) {
	
		return sqlSessionTemplate.delete("notice.delete", n_idx);
	}

	@Override
	public int getNoticeUpdate(NoticeVO nvo) {
		
		return sqlSessionTemplate.update("notice.update", nvo);
	}

	@Override
	public int getNoticeViewUpdate(String n_idx) {
		return sqlSessionTemplate.update("notice.viewupdate" , n_idx);
	}

	@Override
	public int getTotalCount() {
		
		return sqlSessionTemplate.selectOne("notice.count");
	}

	@Override
	public List<NoticeVO> getNoticeList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		
		return sqlSessionTemplate.selectList("notice.pageList", map);
	}


	

}

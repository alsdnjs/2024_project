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
	public List<NoticeVO> getNoticeList(int page, int size) {
		int offset = (page-1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("notice.list", params);
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
	public int getTotalCount() {
		
		return sqlSessionTemplate.selectOne("notice.count");
	}

	@Override
	public List<NoticeVO> getSearchNotice(String keyword, int page, int size) {
		int offset = (page-1)* size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%");
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("notice.search", params);
	}

	@Override
	public int getSearchNoticeCount(String keyword) {
		return sqlSessionTemplate.selectOne("notice.search_count", "%" + keyword + "%");
	}



	

}

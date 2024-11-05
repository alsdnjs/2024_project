package com.ict.inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.inquiry.vo.InquiryVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<InquiryVO> getInquiryList(String userId) {
		return sqlSessionTemplate.selectList("inquiry.list", userId);
	}

	@Override
	public int getInquiryInsert(InquiryVO ivo) {
		return sqlSessionTemplate.insert("inquiry.insert", ivo);
	}

	@Override
	public InquiryVO getInquiryDetail(String u_idx) {
		return sqlSessionTemplate.selectOne("inquiry.detail", u_idx);
	}

	@Override
	public int getTotalCount(String user_id) {
		return sqlSessionTemplate.selectOne("inquiry.count", user_id);
	}

	@Override
	public List<InquiryVO> getInquiryList(String user_id, int offset, int limit) {
		  Map<String, Object> map = new HashMap<String, Object>(); 
		  map.put("user_id",user_id); 
		  map.put("limit",limit); 
		  map.put("offset", offset);
		 
		return sqlSessionTemplate.selectList("inquiry.pageList", map);
	}

	@Override
	public List<InquiryVO> getAdminInquiry() {
		return sqlSessionTemplate.selectList("inquiry.allList");
	}

}

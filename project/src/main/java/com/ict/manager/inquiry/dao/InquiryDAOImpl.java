package com.ict.manager.inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;
import com.ict.manager.inquiry.vo.ManagerInquiryVO;
import com.ict.member.vo.MemberVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO{
     
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ManagerInquiryVO> getInquiryList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("inquiry.list", params);
	}

	@Override
	public ManagerInquiryVO getInquiryDetail(String u_idx) {
		return sqlSessionTemplate.selectOne("inquiry.detail", u_idx);
	}

	@Override
	public int getInquiryDelete(String u_idx) {
		return sqlSessionTemplate.update("inquiry.delete", u_idx);
	}


	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("inquiry.count");
	}

	@Override
	public List<ManagerInquiryVO> searchInquiry(String keyword, int page, int size) {
		int offset = (page -1)* size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%");
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("inquiry.search", params);
	}

	@Override
	public int getSearchInquiryCount(String keyword) {
		return sqlSessionTemplate.selectOne("inquiry.search_count", "%" + keyword + "%");
	}
	
	@Override
	public List<ManagerInquiryVO> getInquiryUserList(String userId) {
		return sqlSessionTemplate.selectList("inquiry.list_user", userId);
	}

	@Override
	public int getInquiryInsert(ManagerInquiryVO mivo) {
		return sqlSessionTemplate.insert("inquiry.insert", mivo);
	}


	@Override
	public int getTotalUserCount(String user_id) {
		return sqlSessionTemplate.selectOne("inquiry.count_user", user_id);
	}

	@Override
	public List<ManagerInquiryVO> getInquiryUserList(String user_id, int offset, int limit) {
		  Map<String, Object> map = new HashMap<String, Object>(); 
		  map.put("user_id",user_id); 
		  map.put("limit",limit); 
		  map.put("offset", offset);
		 
		return sqlSessionTemplate.selectList("inquiry.pageList", map);
	}

	@Override
	public List<ManagerInquiryAnswerVO> getCommentList(String u_idx) {
		return sqlSessionTemplate.selectList("answer.getAnswer", u_idx);
	}

	@Override
	public int updateMemberInfo(MemberVO memberVO) throws Exception {
	    return sqlSessionTemplate.update("inquiry.updateMemberInfo", memberVO);
	}

	@Override
	public MemberVO getMemberInfo(String userId) throws Exception {
	    return sqlSessionTemplate.selectOne("InquiryMapper.getMemberInfo", userId);
	}


}

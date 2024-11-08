package com.ict.manager.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.inquiry.vo.ManagerInquiryVO;
import com.ict.member.vo.MemberVO;
import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;
import com.ict.manager.inquiry.dao.InquiryDAO;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryDAO inquiryDAO; 
	
	@Override
	public List<ManagerInquiryVO> getInquiryList(int page, int size) {
		return inquiryDAO.getInquiryList(page, size);
	}

	@Override
	public ManagerInquiryVO getInquiryDetail(String u_idx) {
		return inquiryDAO.getInquiryDetail(u_idx);
	}

	@Override
	public int getInquiryDelete(String u_idx) {
		return inquiryDAO.getInquiryDelete(u_idx);
	}

	@Override
	public int getTotalCount() {
		return inquiryDAO.getTotalCount();
	}

	@Override
	public List<ManagerInquiryVO> getSearchInquiry(String keyword, int page, int size) {
		return inquiryDAO.searchInquiry(keyword, page, size);
	}

	@Override
	public int getSearchInquiryCount(String keyword) {
		return inquiryDAO.getSearchInquiryCount(keyword);
	}
	
	@Override
	public List<ManagerInquiryVO> getInquiryUserList(String userId) {
		return inquiryDAO.getInquiryUserList(userId);
	}

	@Override
	public int getInquiryInsert(ManagerInquiryVO mivo) {
		return inquiryDAO.getInquiryInsert(mivo);
	}

	@Override
	public int getTotalUserCount(String user_id) {
		return inquiryDAO.getTotalUserCount(user_id);
	}

	@Override
	public List<ManagerInquiryVO> getInquiryUserList(String user_id, int offset, int limit) {
		return inquiryDAO.getInquiryUserList(user_id, offset, limit);
	}


	@Override
	public List<ManagerInquiryAnswerVO> getCommentList(String u_idx) {
		return inquiryDAO.getCommentList(u_idx);
	}
	
	@Override
	public int updateMemberInfo(MemberVO memberVO) throws Exception {
	    return inquiryDAO.updateMemberInfo(memberVO);
	}

	@Override
	public MemberVO getMemberInfo(String userId) throws Exception {
	    return inquiryDAO.getMemberInfo(userId);
	}

}

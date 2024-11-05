package com.ict.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.inquiry.dao.InquiryDAO;
import com.ict.inquiry.vo.InquiryVO;

@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDAO inquiryDAO;
	
	
	@Override
	public List<InquiryVO> getInquiryList(String userId) {
		return inquiryDAO.getInquiryList(userId);
	}

	@Override
	public int getInquiryInsert(InquiryVO ivo) {
		return inquiryDAO.getInquiryInsert(ivo);
	}

	@Override
	public InquiryVO getInquiryDetail(String u_idx) {
		return inquiryDAO.getInquiryDetail(u_idx);
	}

	@Override
	public int getTotalCount(String user_id) {
		return inquiryDAO.getTotalCount(user_id);
	}

	@Override
	public List<InquiryVO> getInquiryList(String user_id, int offset, int limit) {
		return inquiryDAO.getInquiryList(user_id, offset, limit);
	}

	@Override
	public List<InquiryVO> getAdminInquiry() {
		return inquiryDAO.getAdminInquiry();
	}
	

}

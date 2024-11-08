package com.ict.manager.inquiry.answer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.inquiry.answer.dao.InquiryAnswerDAO;
import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;

@Service
public class InquiryAnswerServiceImpl implements InquiryAnswerService{
	@Autowired
	private InquiryAnswerDAO inquiryAnswerDAO;
	
	@Override
	public String getAnswer(String u_idx) {
		ManagerInquiryAnswerVO answerVO = inquiryAnswerDAO.getAnswer(u_idx);
		if (answerVO != null) {
			return answerVO.getAnswer();
		}
		return null;
	}

	@Override
	public int getAnswerInsert(ManagerInquiryAnswerVO miavo) {
		return inquiryAnswerDAO.getAnswerInsert(miavo);
	}

	@Override
	public int getAnswerUpdate(ManagerInquiryAnswerVO miavo) {
		return inquiryAnswerDAO.getAnswerUpdate(miavo);
	}

}

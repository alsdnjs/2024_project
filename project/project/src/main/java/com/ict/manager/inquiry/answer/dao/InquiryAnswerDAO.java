package com.ict.manager.inquiry.answer.dao;

import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;

public interface InquiryAnswerDAO {
	public ManagerInquiryAnswerVO getAnswer(String u_idx);
	
	public int getAnswerInsert(ManagerInquiryAnswerVO miavo);
	
	// 수정
	public int getAnswerUpdate(ManagerInquiryAnswerVO miavo);
}

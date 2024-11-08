package com.ict.manager.inquiry.answer.service;

import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;

public interface InquiryAnswerService {
	public String getAnswer(String u_idx);
	// 삽입
	public int getAnswerInsert(ManagerInquiryAnswerVO miavo);
	// 수정
	public int getAnswerUpdate(ManagerInquiryAnswerVO miavo);
}

package com.ict.manager.inquiry.answer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;

@Repository
public class InquiryAnswerDAOImpl implements InquiryAnswerDAO{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public ManagerInquiryAnswerVO getAnswer(String u_idx) {
		return sqlSessionTemplate.selectOne("answer.getAnswer", u_idx);
	}

	@Override
	public int getAnswerInsert(ManagerInquiryAnswerVO miavo) {
		return sqlSessionTemplate.insert("answer.insert", miavo);
	}

	@Override
	public int getAnswerUpdate(ManagerInquiryAnswerVO miavo) {
		return sqlSessionTemplate.update("answer.update", miavo);
	}
}

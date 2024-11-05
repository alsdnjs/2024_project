package com.ict.inquiry.dao;

import java.util.List;

import com.ict.inquiry.vo.InquiryVO;

public interface InquiryDAO {
		// 특정 사용자 리스트(사용자 ID로 조회)
		public List<InquiryVO> getInquiryList(String userId);
		
		// 모든 문의 가져오기(관리자)
		public List<InquiryVO> getAdminInquiry();
		
		// 삽입 (작성)
		public int getInquiryInsert(InquiryVO ivo);
		
		// 상세보기
		public InquiryVO getInquiryDetail(String u_idx);
		
		// 페이징 처리 - 전체 게시물 수
		public int getTotalCount(String user_id);
		
		// 페이징 처리를 위한 리스트
		public List<InquiryVO> getInquiryList(String user_id, int offset, int limit);
		
		// 관리자 답변 가져오기 (추후 연동하기)
		/* public List<CommVO> getCommentList(String s_idx); */
}

package com.ict.manager.inquiry.dao;

import java.util.List;

import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;
import com.ict.manager.inquiry.vo.ManagerInquiryVO;
import com.ict.member.vo.MemberVO;

public interface InquiryDAO {
	// 관리자페이지
	// 리스트
	public List<ManagerInquiryVO> getInquiryList(int page, int size);

	// 상세보기
	public ManagerInquiryVO getInquiryDetail(String u_idx);

	// 원글 삭제
	public int getInquiryDelete(String u_idx);

	// 페이징 처리 - 전체 게시물의 수
	public int getTotalCount();

	// 검색
	public List<ManagerInquiryVO> searchInquiry(String keyword, int page, int size);

	// 검색 페이지
	public int getSearchInquiryCount(String keyword);

	
	
	// 마이페이지
	// 특정 사용자 리스트(사용자 ID로 조회)
	public List<ManagerInquiryVO> getInquiryUserList(String userId);

	// 삽입 (작성)
	public int getInquiryInsert(ManagerInquiryVO mivo);

	// 페이징 처리 - 전체 게시물 수
	public int getTotalUserCount(String user_id);

	// 페이징 처리를 위한 리스트
	public List<ManagerInquiryVO> getInquiryUserList(String user_id, int offset, int limit);

	// 관리자 답변 가져오기
	public List<ManagerInquiryAnswerVO> getCommentList(String u_idx);
	
	// 마이페이지 회원수정
	int updateMemberInfo(MemberVO memberVO) throws Exception;
    MemberVO getMemberInfo(String userId) throws Exception;
}

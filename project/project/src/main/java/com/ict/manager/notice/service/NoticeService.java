package com.ict.manager.notice.service;

import java.util.List;


import com.ict.manager.notice.vo.NoticeVO;



public interface NoticeService {
	
	// 리스트
	public List<NoticeVO> getNoticeList(int page, int size);
	
	// 삽입
	public int getNoticeInsert(NoticeVO nvo);
	
	// 상세보기
	public NoticeVO getNoticeDetail(String n_idx);
	
	// 원글 삭제
	public int getNoticeDelete(String n_idx);
	
	// 원글 수정 
	public int getNoticeUpdate(NoticeVO nvo);

	// 페이징 처리 - 전체 게시물의 수
	public int getTotalCount();
	
	// 검색
	public List<NoticeVO> getSearchNotice(String keyword, int page, int size);
	
	// 검색 페이지
	public int getSearchNoticePage(String keyword);
	
	
}

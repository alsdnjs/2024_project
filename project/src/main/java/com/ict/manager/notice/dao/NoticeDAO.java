package com.ict.manager.notice.dao;

import java.util.List;

import com.ict.manager.notice.vo.NoticeVO;


public interface NoticeDAO {
	
	// 리스트
		public List<NoticeVO> getNoticeList();
		
		// 삽입
		public int getNoticeInsert(NoticeVO nvo);
		
		// 상세보기
		public NoticeVO getNoticeDetail(String n_idx);
		
		// 원글 삭제
		public int getNoticeDelete(String n_idx);
		
		// 원글 수정 
		public int getNoticeUpdate(NoticeVO nvo);
		
		// 조회수 업데이트
		public int getNoticeViewUpdate(String n_idx);
		// 페이징 처리 - 전체 게시물의 수
		public int getTotalCount();

		
		// 페이징 
		public List<NoticeVO> getNoticeList(int offset, int limit);
		
		
	}

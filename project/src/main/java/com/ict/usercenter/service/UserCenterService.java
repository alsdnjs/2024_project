package com.ict.usercenter.service;

import java.util.List;

import com.ict.manager.notice.vo.NoticeVO;

public interface UserCenterService {
	// 리스트
			public List<NoticeVO> getCenterList();
			
			// 삽입
			public int getCenterInsert(NoticeVO nvo);
			
			// 상세보기
			public NoticeVO getCenterDetail(String n_idx);
			
			// 원글 삭제
			public int getCenterDelete(String n_idx);
			
			// 원글 수정 
			public int getCenterUpdate(NoticeVO nvo);
			
			// 조회수 업데이트
			public int getViewsUpdate(String n_idx);
			// 페이징 처리 - 전체 게시물의 수
			public int getTotalCount();
			
			
			public List<NoticeVO> getNoticeList(int offset, int limit);
}

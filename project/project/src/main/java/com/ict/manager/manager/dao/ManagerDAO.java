package com.ict.manager.manager.dao;

import java.util.List;

import com.ict.manager.manager.vo.ManagerVO;

public interface ManagerDAO {
		// 리스트
		public List<ManagerVO> getManagerList (int page, int size);
		
		// 삽입
		public int getManagerInsert(ManagerVO mmvo);
		
		// 상세보기
		public ManagerVO getManagerDetail(String manager_id);
		
		// 수정하기
		public int getManagerUpdate(ManagerVO mmvo);
		
		// 삭제하기
		public int getManagerDelete(String manager_id);
		
		// 로그인
		public ManagerVO getManagerById(String manager_id);
		
		// 페이지
		public int getManagerCount();
		
		// 검색
		public List<ManagerVO> searchManager(String keyword, int page, int size);
		
		// 검색 페이지
		public int getSearchManagerCount(String keyword);
}

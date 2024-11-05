package com.ict.manager.dao;

import java.util.List;

import com.ict.manager.vo.ManagerVO;

public interface ManagerDAO {
		// 리스트
		public List<ManagerVO> getManagerList (int page, int size);
		
		// 삽입
		public int getManagerInsert(ManagerVO mvo);
		
		// 상세보기
		public ManagerVO getManagerDetail(String manager_id);
		
		// 수정하기
		public int getManagerUpdate(ManagerVO mvo);
		
		// 삭제하기
		public int getManagerDelete(String manager_id);
		
		// 로그인
		public ManagerVO getManagerById(String manager_id);
		
		// 페이지
		public int getManagerCount();

}

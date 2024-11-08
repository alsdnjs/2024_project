package com.ict.manager.user.dao;

import java.util.List;

import com.ict.manager.user.vo.ManagerUserVO;

public interface UserDAO {
		// 리스트
		public List<ManagerUserVO> getUserList (int page, int size);
		
		// 삽입
		public int getUserInsert(ManagerUserVO uvo);
		
		// 상세보기
		public ManagerUserVO getUserDetail(String user_id);
		
		// 수정하기
		public int getUserUpdate(ManagerUserVO uvo);
		
		// 삭제하기
		public int getUserDelete(String user_id);
		
		// 페이지
		public int getUserCount();
		
		// 제재
		public int getUserWarn(ManagerUserVO uvo);
		
		// 제재 해지
		public void clearExpiredWarnings();
		
		// 검색
		public List<ManagerUserVO> searchUser(String keyword, int page, int size);
		
		// 검색 페이지
		public int getSearchUserCount(String keyword);
		
		// 아이디 중복체크
		public int getUserIdCheck(String user_id);
}

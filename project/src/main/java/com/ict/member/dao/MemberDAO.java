package com.ict.member.dao;

import com.ict.member.vo.MemberVO;

public interface MemberDAO {
    // 로그인: 입력받은 정보로 로그인 확인 후 MemberVO 객체 반환
    public MemberVO loginCheck(String user_id) throws Exception;

    // 회원가입: 회원가입 성공 시 1 반환, 실패 시 0 반환
    public int registerMember(MemberVO mvo) throws Exception;

    
    
    
    // 아이디 찾기
    MemberVO findUserId(MemberVO mvo) throws Exception;

    // 비밀번호 찾기
    MemberVO findUserPassword(MemberVO mvo) throws Exception;

    // 비밀번호 변경
    int updatePassword(String userId, String newPassword) throws Exception;
}

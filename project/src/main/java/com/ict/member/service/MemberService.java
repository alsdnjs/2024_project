package com.ict.member.service;

import java.util.List;

import com.ict.member.vo.AddressVO;
import com.ict.member.vo.MemberVO;

public interface MemberService {

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
    
    // 회원 등급 확인 메서드  11/7내가
    String getMemberGrade(String user_idx);
    
    
  //아이디 중복  1109 2시
    public boolean isUserIdAvailable(String userId) throws Exception;
    
    public List<AddressVO> getMemberAddressList(String user_idx) throws Exception;
	public int getTotalPoint(String user_idx) throws Exception;
}

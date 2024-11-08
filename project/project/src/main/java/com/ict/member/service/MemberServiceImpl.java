package com.ict.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.member.dao.MemberDAO;
import com.ict.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public MemberVO loginCheck(String user_id) throws Exception {
        return memberDAO.loginCheck(user_id);  // 로그인 정보 확인
    }

    @Override
    public int registerMember(MemberVO mvo) throws Exception {
        return memberDAO.registerMember(mvo);  // 회원가입 처리
        
    }   
     
        @Override
        public MemberVO findUserId(MemberVO mvo) throws Exception {
            return memberDAO.findUserId(mvo);
        }

        @Override
        public MemberVO findUserPassword(MemberVO mvo) throws Exception {
            return memberDAO.findUserPassword(mvo);
        }

        @Override
        public int updatePassword(String userId, String newPassword) throws Exception {
            return memberDAO.updatePassword(userId, newPassword);
        
    }
}

package com.ict.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.member.dao.MemberDAO;
import com.ict.member.vo.AddressVO;
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
        //11/7 내가 추가한거
        @Override
        public String getMemberGrade(String user_idx) {
            System.out.println("getTotalSpent 호출 - user_idx: " + user_idx);  // userId를 로그에 명확히 출력
            Integer totalSpent = memberDAO.getTotalSpent(user_idx);
            System.out.println("조회된 총 구매 금액: " + totalSpent);

            totalSpent = (totalSpent != null) ? totalSpent : 0;
            if (totalSpent >= 3000000) {
                return "VIP";
            } else if (totalSpent >= 1000000) {
                return "GOLD";
            } else if (totalSpent >= 100000) {
                return "SILVER";
            } else {
                return "FAMILY";
            }
            
        
        }
        
        
        
      //아이디 중복 1109 2시
        @Override
        public boolean isUserIdAvailable(String userId) throws Exception {
            return memberDAO.checkUserId(userId) == 0; // 아이디가 존재하지 않으면 true 반환
        }
        

		@Override
		public List<AddressVO> getMemberAddressList(String user_idx) throws Exception {
			return memberDAO.getMemberAddressList(user_idx);
		}

		@Override
		public int getTotalPoint(String user_idx) throws Exception {
			return memberDAO.getTotalPoint(user_idx);
		}
        
        
}

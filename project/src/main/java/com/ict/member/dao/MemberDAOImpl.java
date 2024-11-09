package com.ict.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.member.vo.AddressVO;
import com.ict.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    // 로그인 처리
    @Override
    public MemberVO loginCheck(String user_id) throws Exception {
        return sqlSessionTemplate.selectOne("member.loginCheck", user_id);
    }

    // 회원가입 처리
    @Override
    public int registerMember(MemberVO mvo) throws Exception {
        return sqlSessionTemplate.insert("member.registerMember", mvo);
    }   
        
        
        
        
        @Override
        public MemberVO findUserId(MemberVO mvo) throws Exception {
            return sqlSessionTemplate.selectOne("member.idfind", mvo);
        }

        @Override
        public MemberVO findUserPassword(MemberVO mvo) throws Exception {
        	 return sqlSessionTemplate.selectOne("member.pwfind", mvo);
        }

        @Override
        public int updatePassword(String userId, String newPassword) throws Exception {
            Map<String, String> params = new HashMap<>();
            params.put("userId", userId);
            params.put("newPassword", newPassword);
            return sqlSessionTemplate.update("member.updatePassword", params);
    }
        // MemberDAOImpl.java 수정
        @Override
        public int getTotalSpent(String user_idx) {
           System.out.println("getTotalSpent 호출 - user_idx: " + user_idx);
           Integer total = sqlSessionTemplate.selectOne("member.getTotalSpent", user_idx);
           System.out.println("조회된 총 구매 금액: " + total);
           return (total != null) ? total : 0;
                
            
    }
        
     // 아이디 중복  11092시
        @Override
        public int checkUserId(String userId) throws Exception {
            return sqlSessionTemplate.selectOne("member.idchk", userId);
        } 
        
        
        @Override
    	public List<AddressVO> getMemberAddressList(int user_idx) throws Exception {
    		return sqlSessionTemplate.selectList("member.getAddressList", user_idx);
    	}

    	@Override
    	public int getTotalPoint(int user_idx) throws Exception {
    		return sqlSessionTemplate.selectOne("member.totalPoint", user_idx);
    	}
        
        
        
        
        
}

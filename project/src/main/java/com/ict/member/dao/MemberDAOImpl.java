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
    
    // 濡쒓렇�씤 泥섎━
    @Override
    public MemberVO loginCheck(String user_id) throws Exception {
        return sqlSessionTemplate.selectOne("member.loginCheck", user_id);
    }

    // �쉶�썝媛��엯 泥섎━
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
        // MemberDAOImpl.java �닔�젙
        @Override
        public int getTotalSpent(String user_idx) {
           System.out.println("getTotalSpent �샇異� - user_idx: " + user_idx);
           Integer total = sqlSessionTemplate.selectOne("member.getTotalSpent", user_idx);
           System.out.println("議고쉶�맂 珥� 援щℓ 湲덉븸: " + total);
           return (total != null) ? total : 0;
                
            
    }
        
     // �븘�씠�뵒 以묐났  11092�떆
        @Override
        public int checkUserId(String userId) throws Exception {
            return sqlSessionTemplate.selectOne("member.idchk", userId);
        } 
        
       

		@Override
		public List<AddressVO> getMemberAddressList(String user_idx) throws Exception {
			return sqlSessionTemplate.selectList("member.getMemberAddressList", user_idx);
		}

		@Override
		public int getTotalPoint(String user_idx) throws Exception {
			String result = sqlSessionTemplate.selectOne("member.getTotalPoint", user_idx);
			
			int point = 0;
			if(result==null) {
				point = 0;
			}else {
				Double doubleValue = Double.parseDouble(result);  // Double로 파싱
				point = doubleValue.intValue();  // int로 변환 (소수점은 버려짐)
			}
			
			
			return point;
		}
        
        
        
        
        
}

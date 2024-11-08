package com.ict.mypage.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mypage.seller.vo.MypageSellerProfileVO;



@Repository
public class MypageSellerUpdateDAOImpl implements MypageSellerUpdateDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String SellerProfileUpdate(String user_id) {
		return sqlSessionTemplate.selectOne("mypage_seller.check", user_id);
	}

	@Override
	public int getSellerProfileUpdateOK(MypageSellerProfileVO mspvo) {
		return sqlSessionTemplate.update("mypage_seller.update", mspvo);
	}

}

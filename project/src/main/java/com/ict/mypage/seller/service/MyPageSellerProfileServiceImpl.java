package com.ict.mypage.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mypage.seller.dao.MypageSellerUpdateDAO;
import com.ict.mypage.seller.vo.MypageSellerProfileVO;



@Service
public class MyPageSellerProfileServiceImpl implements MypageSellerProfileService{
	
	@Autowired
	private MypageSellerUpdateDAO sellerUpdateDAO;
	
	@Override
	public String SellerProfileUpdate(String user_id) {
		return sellerUpdateDAO.SellerProfileUpdate(user_id);
	}

	@Override
	public int getSellerProfileUpdateOK(MypageSellerProfileVO mspvo) {
		return sellerUpdateDAO.getSellerProfileUpdateOK(mspvo);
	}

}

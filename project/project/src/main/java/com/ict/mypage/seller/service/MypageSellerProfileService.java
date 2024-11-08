package com.ict.mypage.seller.service;

import com.ict.mypage.seller.vo.MypageSellerProfileVO;

public interface MypageSellerProfileService {
	public String SellerProfileUpdate(String user_id);
	
	public int getSellerProfileUpdateOK(MypageSellerProfileVO mspvo);
}

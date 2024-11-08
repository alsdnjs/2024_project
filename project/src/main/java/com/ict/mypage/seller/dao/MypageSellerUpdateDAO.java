package com.ict.mypage.seller.dao;

import com.ict.mypage.seller.vo.MypageSellerProfileVO;

public interface MypageSellerUpdateDAO {
	public String SellerProfileUpdate(String user_id);
	
	public int getSellerProfileUpdateOK(MypageSellerProfileVO mspvo);
}

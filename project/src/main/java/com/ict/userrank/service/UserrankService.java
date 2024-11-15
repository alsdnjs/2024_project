package com.ict.userrank.service;

import com.ict.userrank.vo.UserrankVO;

public interface UserrankService {

	    // user_id로 User 정보를 가져오는 메서드
	    public UserrankVO getUserById(String user_id);
	}



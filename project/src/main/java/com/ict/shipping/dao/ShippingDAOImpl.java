package com.ict.shipping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shipping.vo.ShippingVO;

@Repository
public class ShippingDAOImpl implements ShippingDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int getTotalCount(int user_idx) {
		return sqlSessionTemplate.selectOne("shipping.count", user_idx);
	}

	@Override
	public List<ShippingVO> getShippingList(int user_idx, int offset, int limit) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("user_idx", user_idx);  // int 타입이 Integer로 자동 박싱됨
	    paramMap.put("offset", offset);
	    paramMap.put("limit", limit);

	    return sqlSessionTemplate.selectList("shipping.olist", paramMap);
	}

	@Override
	public List<ShippingVO> getOrderCount(int user_idx) {
		return sqlSessionTemplate.selectList("shipping.clist", user_idx);
	}


}

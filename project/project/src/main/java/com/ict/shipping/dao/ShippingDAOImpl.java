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
	
	/*
	@Override
	public List<ShippingVO> getShippingList(int orders_idx) {
		return sqlSessionTemplate.selectList("shipping.list", orders_idx);
	}*/

	@Override
	public int getTotalCount(int orders_idx) {
		return sqlSessionTemplate.selectOne("shipping.count", orders_idx);
	}

	@Override
	public List<ShippingVO> getShippingList(int orders_idx, int offset, int limit) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("orders_idx", orders_idx);  // int 타입이 Integer로 자동 박싱됨
	    paramMap.put("offset", offset);
	    paramMap.put("limit", limit);

	    return sqlSessionTemplate.selectList("shipping.list", paramMap);
	}

	

}

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
	public int getTotalCount(String user_id) {
		return sqlSessionTemplate.selectOne("shipping.count", user_id);
	}

	@Override
	public List<ShippingVO> getShippingList(String user_id, int offset, int limit) {
	    Map<String, Object> paramMap = new HashMap<>();
	    System.out.println("여기는dao"+ user_id);
	    paramMap.put("user_id", user_id);  // int 타입이 Integer로 자동 박싱됨
	    paramMap.put("offset", offset);
	    paramMap.put("limit", limit);

	    return sqlSessionTemplate.selectList("shipping.olist", paramMap);
	}

	@Override
	public List<ShippingVO> getOrderCount(String user_id) {
		return sqlSessionTemplate.selectList("shipping.clist", user_id);
	}

	@Override
	public void insertShipping(ShippingVO shipping) {
		sqlSessionTemplate.insert("shipping.insertShipping", shipping);
		
	}


}

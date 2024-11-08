package com.ict.manager.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.order.vo.ManagerOrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ManagerOrderVO> getOrderList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("order.list", params);
	}


	@Override
	public ManagerOrderVO getOrderDetail(String orders_idx) {
		return sqlSessionTemplate.selectOne("order.detail", orders_idx);
	}


	@Override
	public int getOrderDelete(String orders_idx) {
		return sqlSessionTemplate.delete("order.delete", orders_idx);
	}

	@Override
	public int getOrderCount() {
		return sqlSessionTemplate.selectOne("order.count");
	}

	
	@Override
	public List<ManagerOrderVO> searchOrder(String keyword, int page, int size) {
		// System.out.println(keyword); 여기까지도 잘 감
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%"); // 검색 키워드 설정
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("order.search", params);
	}

	@Override
	public int getSearchOrderCount(String keyword) {
		return sqlSessionTemplate.selectOne("order.search_count", "%" + keyword + "%");
	}

}

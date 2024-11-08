package com.ict.manager.seller.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.seller.vo.ManagerSellerVO;


@Repository
public class SellerDAOImpl implements SellerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ManagerSellerVO> getSellerList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("seller.list", params);
	}

	@Override
	public ManagerSellerVO getSellerDetail(String seller_idx) {
		return sqlSessionTemplate.selectOne("seller.detail", seller_idx);
	}
	@Override
	public ManagerSellerVO getSellerDetail2(String user_id) {
		return sqlSessionTemplate.selectOne("seller.detail2", user_id);
	}

	@Override
	public int getSellerUpdate(ManagerSellerVO msvo) {
		return sqlSessionTemplate.update("seller.update", msvo);
	}

	@Override
	public int getSellerDelete(String seller_idx) {
		return sqlSessionTemplate.delete("seller.delete", seller_idx);
	}

	@Override
	public int getSellerCount() {
		return sqlSessionTemplate.selectOne("seller.count");
	}

	@Override
	public List<ManagerSellerVO> searchSeller(String keyword, int page, int size) {
		// System.out.println(keyword); 여기까지도 잘 감
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%"); // 검색 키워드 설정
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("seller.search", params);
	}

	@Override
	public int getSearchSellerCount(String keyword) {
		return sqlSessionTemplate.selectOne("seller.search_count", "%" + keyword + "%");
	}

}

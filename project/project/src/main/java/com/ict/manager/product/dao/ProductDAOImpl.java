package com.ict.manager.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.manager.product.vo.ManagerProductVO;



@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ManagerProductVO> getProductList(int page, int size) {
		int offset = (page - 1) * size;
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("product.list", params);
	}

	@Override
	public int getProductInsert(ManagerProductVO mpvo) {
		return sqlSessionTemplate.insert("product.insert", mpvo);
	}

	@Override
	public ManagerProductVO getProductDetail(String product_idx) {
		return sqlSessionTemplate.selectOne("product.detail", product_idx);
	}

	@Override
	public int getProductUpdate(ManagerProductVO mpvo) {
		return sqlSessionTemplate.update("product.update", mpvo);
	}

	@Override
	public int getProductDelete(String product_idx) {
		return sqlSessionTemplate.delete("product.delete", product_idx);
	}

	@Override
	public int getProductCount() {
		return sqlSessionTemplate.selectOne("product.count");
	}

	@Override
	public List<ManagerProductVO> searchProduct(String keyword, int page, int size) {
		// System.out.println(keyword); 여기까지도 잘 감
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%"); // 검색 키워드 설정
		params.put("offset", offset);
		params.put("size", size);
		return sqlSessionTemplate.selectList("product.search", params);
	}

	@Override
	public int getSearchProductCount(String keyword) {
		return sqlSessionTemplate.selectOne("product.search_count", "%" + keyword + "%");
	}

	@Override
	public int countByProductId(String product_idx) {
		return sqlSessionTemplate.selectOne("product.check", product_idx);
	}

}

package com.ict.saup.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.saup.vo.SaupVO;

	@Repository
	public class SaupDAOImpl implements SaupDAO {

	    @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;

	    @Override
	    public int insertSaup(SaupVO saupVO) throws Exception {
	        return sqlSessionTemplate.insert("Saup.insertSaup", saupVO);
	    }
	}

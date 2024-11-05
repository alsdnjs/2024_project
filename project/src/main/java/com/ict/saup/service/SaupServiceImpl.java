package com.ict.saup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.saup.dao.SaupDAO;
import com.ict.saup.vo.SaupVO;

@Service
public class SaupServiceImpl implements SaupService {

    @Autowired
    private SaupDAO saupDAO;

    @Override
    public int registerSaup(SaupVO saupVO) throws Exception {
        return saupDAO.insertSaup(saupVO);
    }
}
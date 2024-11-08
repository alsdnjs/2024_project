package com.ict.usercenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.notice.dao.NoticeDAO;
import com.ict.manager.notice.vo.NoticeVO;


@Service
public class UserCenterServiceImpl implements UserCenterService{
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> getCenterList(int page, int size) {
		return noticeDAO.getNoticeList(page, size);
	}
	@Override
	public int getCenterInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeVO getCenterDetail(String n_idx) {
		return noticeDAO.getNoticeDetail(n_idx);
	}

	@Override
	public int getCenterDelete(String n_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCenterUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getViewsUpdate(String n_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	

}

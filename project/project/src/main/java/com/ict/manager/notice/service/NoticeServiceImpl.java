package com.ict.manager.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.manager.notice.dao.NoticeDAO;
import com.ict.manager.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> getNoticeList(int page, int size) {
		return noticeDAO.getNoticeList(page, size);
	}

	@Override
	public int getNoticeInsert(NoticeVO nvo) {
		return noticeDAO.getNoticeInsert(nvo);
	}

	@Override
	public NoticeVO getNoticeDetail(String n_idx) {
		return noticeDAO.getNoticeDetail(n_idx);
	}

	@Override
	public int getNoticeDelete(String n_idx) {
		
		return noticeDAO.getNoticeDelete(n_idx);
	}

	@Override
	public int getNoticeUpdate(NoticeVO nvo) {
		return noticeDAO.getNoticeUpdate(nvo);
	}

	@Override
	public int getTotalCount() {
		return noticeDAO.getTotalCount();
	}

	@Override
	public List<NoticeVO> getSearchNotice(String keyword, int page, int size) {
		return noticeDAO.getSearchNotice(keyword, page, size);
	}

	@Override
	public int getSearchNoticePage(String keyword) {
		return noticeDAO.getSearchNoticeCount(keyword);
	}

	
	

}









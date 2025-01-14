package com.privateplaylist.www.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.NoticeDao;
import com.privateplaylist.www.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<Notice> selectNoticeList() {
		List<Notice> noticeList = noticeDao.selectNoticeList();
		return noticeList;
	}
	
	@Override
	public Notice selectNoticeone(int noticeNo) {
		Notice noticeone = noticeDao.selectNoticeone(noticeNo);
		return noticeone;
	}
	
}

package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bgk.delivery.service.NoticeDto;
import com.bgk.delivery.service.NoticeService;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource(name="noticeDao")
	private NoticeDao noticeDao;

	@Override
	public NoticeDto selectOne(String no) {
		return noticeDao.selectOne(no);
	}//selectOne

	@Override
	public List<NoticeDto> selectList(Map map) {
		return noticeDao.selectList(map);
	}//selectList

	@Override
	public int getTotalRecCount(Map map) {
		return noticeDao.getTotalRecCount(map);
	}//getTotalCount
	
}///NoticeServiceImpl

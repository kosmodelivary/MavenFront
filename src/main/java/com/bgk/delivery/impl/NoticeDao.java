package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.NoticeDto;
import com.bgk.delivery.service.NoticeService;

@Repository
public class NoticeDao implements NoticeService{
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public NoticeDto selectOne(String no) {
		return sqlMapper.selectOne("noticeSelectOne",no);
	}//selectOne

	@Override
	public List<NoticeDto> selectList(Map map) {
		return sqlMapper.selectList("noticeSelectList", map);
	}//selectList

	@Override
	public int getTotalRecCount(Map map) {
		return sqlMapper.selectOne("noticeTotalCount",map);
	}//getTotalRecCount
	
}/////NoticeDao

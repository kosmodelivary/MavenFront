package com.bgk.delivery.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	public List<NoticeDto> selectList(Map map);
	public NoticeDto selectOne(String no);
	public int getTotalRecCount(Map map);

}/////NoticeService
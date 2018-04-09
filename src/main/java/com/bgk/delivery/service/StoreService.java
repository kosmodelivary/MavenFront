package com.bgk.delivery.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	public List<StoreDto> selectList(Map map);
	public StoreDto selectOne(String no);
	public int getTotalRecCount(Map map);
	
	public List<StoreDto> findshop(Map map);

}
package com.bgk.delivery.service;

import java.util.List;

public interface StoreService {

	public List<StoreDto> selectList();
	public StoreDto selectOne(String no);

}
package com.bgk.delivery.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.service.StoreDto;
import com.bgk.delivery.service.StoreService;

@Service("storeService")
public class StoreServiceImpl implements StoreService{

	@Resource(name="storeDao")
	private StoreDao sdao;
	
	@Override
	public List<StoreDto> selectList() {
		return sdao.selectList();
	}

	@Override
	public StoreDto selectOne(String no) {
		return sdao.selectOne(no);
	}
	

}

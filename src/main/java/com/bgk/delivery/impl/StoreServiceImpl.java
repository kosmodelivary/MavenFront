package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.service.StoreDto;
import com.bgk.delivery.service.StoreService;

@Service("storeService")
public class StoreServiceImpl implements StoreService{

	@Resource(name="storeDao")
	private StoreDao sdao;

	@Override
	public StoreDto selectOne(String no) {
		return sdao.selectOne(no);
	}

	@Override
	public List<StoreDto> selectList(Map map) {
		return sdao.selectList(map);
	}

	@Override
	public int getTotalRecCount(Map map) {
		return sdao.getTotalRecCount(map);
	}
	

}

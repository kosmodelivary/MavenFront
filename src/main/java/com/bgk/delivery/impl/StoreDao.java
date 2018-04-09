package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.StoreDto;
import com.bgk.delivery.service.StoreService;

@Repository
public class StoreDao implements StoreService{

	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public StoreDto selectOne(String no) {
		return sqlMapper.selectOne("storeSelectOne",no);
	}

	@Override
	public List<StoreDto> selectList(Map map) {
		return sqlMapper.selectList("storeSelectList", map);
	}

	@Override
	public int getTotalRecCount(Map map) {
		return sqlMapper.selectOne("storeTotalCount",map);
	}

	@Override
	public List<StoreDto> findshop(Map map) {
		return sqlMapper.selectList("findshop",map);
	}

}

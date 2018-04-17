package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.MenuDto;
import com.bgk.delivery.service.MenuService;

@Repository
public class MenuDao implements MenuService{

	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<MenuDto> selectList(Map map) {
		return sqlMapper.selectList("menuSelectList",map);
	}

	@Override
	public MenuDto selectOne(String menu_no) {
		return sqlMapper.selectOne("menuSelectOne",menu_no);
	}

	@Override
	public int getTotalCount(Map map) {
		return sqlMapper.selectOne("menuTotalCount", map);
	}

	@Override
	public int p_SellCount(Map map) {
		return sqlMapper.update("menuSellCount", map);
	}

	@Override
	public List<MenuDto> bestSeller() {
		return sqlMapper.selectList("bestSeller");
	}

	@Override
	public int top4SellCount() {
		return sqlMapper.selectOne("top4SellCount");
	}
	
	

}

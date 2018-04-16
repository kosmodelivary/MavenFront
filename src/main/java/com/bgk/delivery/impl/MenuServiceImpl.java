package com.bgk.delivery.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.impl.MenuDao;
import com.bgk.delivery.service.MenuDto;
import com.bgk.delivery.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService{

	@Resource(name="menuDao")
	private MenuDao		menuDao;

	@Override
	public List<MenuDto> selectList(Map map) {
		return menuDao.selectList(map);
	}

	@Override
	public MenuDto selectOne(String menu_no) {
		return menuDao.selectOne(menu_no);
	}

	@Override
	public int getTotalCount(Map map) {
		return menuDao.getTotalCount(map);
	}

	@Override
	public int p_SellCount(int menu_no) {
		return menuDao.p_SellCount(menu_no);
	}
	
}

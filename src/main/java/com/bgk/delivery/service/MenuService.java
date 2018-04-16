package com.bgk.delivery.service;

import java.util.List;
import java.util.Map;

import com.bgk.delivery.service.MenuDto;

public interface MenuService {

	public List<MenuDto> selectList(Map map);
	public MenuDto selectOne(String menu_no);
	public int getTotalCount(Map map);
	public int p_SellCount(Map map);
	public List<MenuDto> bestSeller();
}

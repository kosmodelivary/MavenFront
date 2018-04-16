package com.bgk.delivery.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgk.delivery.impl.MenuServiceImpl;
import com.bgk.delivery.service.MenuDto;
import com.bgk.delivery.service.StoreDto;


@Controller
public class MenuController {

	
	@Resource(name="menuService")
	private MenuServiceImpl service;
	
	List<MenuDto> records = null;
	
	@RequestMapping("/menu/All.whpr")
	public String list(Model model,
					   @RequestParam Map map) 
	throws Exception
	{
		records = service.selectList(map);
		
		model.addAttribute("menu", records);
		
		return "menu/All.tile";
	}
	
	@RequestMapping("/menu/Set.whpr")
	public String setList(Model model,
					   @RequestParam Map map) 
	throws Exception
	{
		map.put("category_name", "set");
		records = service.selectList(map);
		
		model.addAttribute("menu", records);
		
		return "menu/Set.tile";
	}
	
	@RequestMapping("/menu/Hamburger.whpr")
	public String burgerList(Model model,
					   @RequestParam Map map) 
	throws Exception
	{
		map.put("category_name", "hamburger");
		records = service.selectList(map);
		
		model.addAttribute("menu", records);
		
		return "menu/Hamburger.tile";
	}
	
	@RequestMapping("/menu/Side.whpr")
	public String sideList(Model model,
					   @RequestParam Map map) 
	throws Exception
	{
		map.put("category_name", "side");
		records = service.selectList(map);
		
		model.addAttribute("menu", records);
		
		return "menu/Side.tile";
	}
	
	@RequestMapping("/menu/Drink.whpr")
	public String drinkList(Model model,
					   @RequestParam Map map,HttpServletResponse resp) 
	throws Exception
	{
		map.put("category_name", "drink");
		records = service.selectList(map);
		
		model.addAttribute("menu", records);
		
		
		
		return "menu/Drink.tile";
	}
	
	@ResponseBody
	@RequestMapping(value= {"/menu/getMenu.whpr"}, produces={"text/html; charset=UTF-8"})
	public String getMenu(@RequestParam Map map,
								Map param) 
			throws Exception
	{
		MenuDto md = service.selectOne(map.get("menu_no").toString());
		List<Map> oneMenu = new Vector<Map>();
		Map record = new HashMap();
		record.put("menu_no", md.getMenu_no());
		record.put("category_name", md.getCategory_name());
		record.put("menu_name", md.getMenu_name());
		record.put("menu_price", md.getMenu_price());
		record.put("menu_weight", md.getMenu_weight());
		record.put("menu_calrorie", md.getMenu_calrorie());
		record.put("menu_protein", md.getMenu_protein());
		record.put("menu_sodium", md.getMenu_sodium());
		record.put("menu_sugars", md.getMenu_sugars());
		record.put("menu_fat", md.getMenu_fat());
		record.put("menu_enddate", md.getMenu_enddate().toString());
		record.put("menu_file_extension", md.getMenu_file_extension());
		oneMenu.add(record);
		
		return JSONArray.toJSONString(oneMenu);
	}
	
	@ResponseBody
	@RequestMapping(value= {"/menu/getIndexMenu.whpr"}, produces={"text/html; charset=UTF-8"})
	public String getIndexMenu(@RequestParam Map map,
							   Map param) 
			throws Exception
	{
		List<MenuDto> menuList = service.bestSeller();
		List<Map> indexMenu = new Vector<Map>();
		for(MenuDto md : menuList) {
			Map record = new HashMap();
			record.put("menu_no", md.getMenu_no());
			record.put("category_name", md.getCategory_name());
			record.put("menu_name", md.getMenu_name());
			record.put("menu_price", md.getMenu_price());
			record.put("menu_weight", md.getMenu_weight());
			record.put("menu_calrorie", md.getMenu_calrorie());
			record.put("menu_protein", md.getMenu_protein());
			record.put("menu_sodium", md.getMenu_sodium());
			record.put("menu_sugars", md.getMenu_sugars());
			record.put("menu_fat", md.getMenu_fat());
			record.put("menu_enddate", md.getMenu_enddate().toString());
			record.put("menu_file_extension", md.getMenu_file_extension());
			record.put("sellCount", md.getSellCount());
			indexMenu.add(record);
		}
		
		return JSONArray.toJSONString(indexMenu);
	}
}

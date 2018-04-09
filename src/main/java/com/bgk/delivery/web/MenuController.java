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
//		System.out.println(map.get("menu_no").toString());
//		System.out.println(md);
		
//		param.put("oneMenu", md);
		
//		return "redirect:/menu/detail.whpr";
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
	
	@RequestMapping("/menu/detail.whpr")
	public String detail(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		System.out.println(req.getAttribute("oneMenu"));
		
		return null;
	}
	
	
//	@ResponseBody
//	@RequestMapping(value= {"/menu/menuList.whpr"}, produces={"text/html; charset=UTF-8"})
//	public String menuList(@RequestParam Map map)
//	throws Exception
//	{
//		String category_name = map.get("category_name").toString();
//		records = service.selectList(map);
//		if(category_name.equalsIgnoreCase("set")) {
//			return categoryList(records);
//		}
//		else if(category_name.equalsIgnoreCase("burger")) {
//			return categoryList(records);
//		}
//		else if(category_name.equalsIgnoreCase("side")) {
//			return categoryList(records);
//		}
//		else {//drink
//			return categoryList(records);
//		}
//	}
//	
//	public String categoryList(List<MenuDto> records) {
//		List<Map> menu = new Vector<Map>();
//		for(MenuDto md : records) {
//			Map record = new HashMap();
//			record.put("no", md.getMenu_no());
//			record.put("category_name", md.getCategory_name());
//			record.put("menu_name", md.getMenu_name());
//			record.put("menu_price", md.getMenu_price());
//			record.put("menu_weight", md.getMenu_weight());
//			record.put("menu_calrorie", md.getMenu_calrorie());
//			record.put("menu_protein", md.getMenu_protein());
//			record.put("menu_sodium", md.getMenu_sodium());
//			record.put("menu_sugars", md.getMenu_sugars());
//			record.put("menu_fat", md.getMenu_fat());
//			record.put("menu_enddate", md.getMenu_enddate().toString());
//			record.put("menu_file_extension", md.getMenu_file_extension());
//			menu.add(record);
//		}
//		return JSONArray.toJSONString(menu);
//	}
}

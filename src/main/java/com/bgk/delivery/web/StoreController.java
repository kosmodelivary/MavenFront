package com.bgk.delivery.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bgk.delivery.service.StoreDto;
import com.bgk.delivery.impl.StoreServiceImpl;


@Controller
public class StoreController {
	
	@Resource(name="storeService")
	private StoreServiceImpl service;
	
	@RequestMapping("/store/Search.whpr")
	public String list(Model model) throws Exception
	{
		List<StoreDto> records = service.selectList();
		
		model.addAttribute("store", records);
		
		return "store/search.tile";
	}
	
	@RequestMapping("/store/Detail.whpr")
	public String view(@RequestParam Map map,Model model) throws Exception
	{
		StoreDto sdto = service.selectOne((String)map.get("no"));
		model.addAttribute("sdto", sdto);
		
		return "store/detail.tile";
	}
	
}

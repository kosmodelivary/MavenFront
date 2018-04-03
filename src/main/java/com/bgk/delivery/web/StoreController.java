package com.bgk.delivery.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value={"/store/find.whpr"}, produces={"text/html; charset=UTF-8"})
	public String find(@RequestParam Map map, HttpServletRequest req) throws Exception 
	{
		System.out.println("검색유형 : " + map.get("searchType").toString());
		System.out.println("시도 구분 : " + map.get("aSi").toString());
		JSONParser parser = new JSONParser();

		File file = new File(req.getSession().getServletContext().getRealPath("/WEB-INF/views/resources/zipcode.json"));
		System.out.println(file.exists());
		FileInputStream fis = new FileInputStream(file);
		JSONObject jobj = (JSONObject) parser.parse(new InputStreamReader(fis));
		JSONObject o = new JSONObject();
		if (map.get("searchType").toString().equalsIgnoreCase("address")) {
			Set set = jobj.keySet();
			for (Object a : set) {
				if (a.toString().equals(map.get("aSi"))) {
					o.put(a.toString(), jobj.get(a.toString()));
				}
			}
		}
		return o.toJSONString();
	}
}

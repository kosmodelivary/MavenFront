package com.bgk.delivery.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgk.delivery.service.StoreDto;
import com.bgk.delivery.common.PagingUtil;
import com.bgk.delivery.impl.StoreServiceImpl;


@Controller
public class StoreController {
	
	@Value("${PAGESIZE}")
	private String pageSize;
	
	@Value("${BLOCKPAGE}")
	private String blockPage;
	
	@Resource(name="storeService")
	private StoreServiceImpl service;
	
	@RequestMapping("/store/Search.whpr")
	public String list(Model model,
					   @RequestParam Map map,
					   @RequestParam(required=false,defaultValue="1") int nowPage,
					   HttpServletRequest req) 
	throws Exception
	{
		int totalRecordCount = service.getTotalRecCount(map);
		
		int pagesize = Integer.parseInt(pageSize);
		int totalPage =(int)Math.ceil((double)totalRecordCount/pagesize);		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pagesize +1;
		int end  = nowPage*pagesize;
		
		//페이징을 위한 로직 끝]	
		//서비스 호출]
		map.put("start", start);
		map.put("end", end);
		
		String	pagingString	=
				PagingUtil.pagingBootStrapStyle(totalRecordCount, pagesize, Integer.parseInt(blockPage), nowPage, req.getContextPath() + "/store/Search.whpr?", req);
		
		List<StoreDto> records = service.selectList(map);
		
		model.addAttribute("store", records);
		model.addAttribute("pagingString", pagingString);
		
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
	public String find(@RequestParam Map map, 
					   @RequestParam(required=false,defaultValue="1") int nowPage,
					   Model model,
					   HttpServletRequest req) throws Exception 
	{
		JSONParser parser = new JSONParser();

		File file = new File(req.getSession().getServletContext().getRealPath("/resources/zipcode.json"));
		FileInputStream fis = new FileInputStream(file);
		JSONObject jobj = (JSONObject) parser.parse(new InputStreamReader(fis));
		JSONObject o = new JSONObject();

		if (req.getMethod().equalsIgnoreCase("get") && map.get("aSi") != null && map.get("aGu") == null) {
			Set set = jobj.keySet();
			for (Object a : set) {
				if (a.toString().equals(map.get("aSi")) && map.get("aGu") == null) {
					o.put(a.toString(), jobj.get(a.toString()));
					return o.toJSONString();
				}
			}
		}
				
		System.out.println(map.get("aSi").toString()+" : 시도\r\n"+
						   map.get("aGu").toString()+" : 구군\r\n"+
						   map.get("searchWord").toString()+" : 검색어");
		
		if(map.get("aSi") != null && map.get("searchWord") == "") {
			map.replace("aGu", "");
			return pagingList(map, nowPage, req);
		}
		if(map.get("aSi") != null && map.get("aGu") != null) {
			return pagingList(map, nowPage, req);
		}
		if(map.get("searchType").toString().equalsIgnoreCase("name") 
				&& map.get("searchWord") != null) {
			return pagingList(map, nowPage, req);
		}
		return null;
	}
	
	public String pagingList(Map map, int nowPage, HttpServletRequest req)
	{
		int totalRecordCount = service.getTotalRecCount(map);
		System.out.println("총 레코드수 : "+totalRecordCount);
		
		int pagesize = Integer.parseInt(pageSize);
		
		int totalPage =(int)Math.ceil((double)totalRecordCount/pagesize);		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pagesize +1;
		int end  = nowPage*pagesize;
		
		//페이징을 위한 로직 끝]	
		//서비스 호출]
		map.put("start", start);
		map.put("end", end);
		
		String	pagingString	=
				PagingUtil.pagingBootStrapStyle(totalRecordCount, pagesize, Integer.parseInt(blockPage), nowPage, req.getContextPath() + "/store/Search.whpr?", req);
		
		List<StoreDto> searchList = service.selectList(map);
		List<Map> store = new Vector<Map>();
		for(StoreDto sd : searchList) {
			Map record = new HashMap();
			record.put("no", sd.getNo());
			record.put("name", sd.getName());
			record.put("tel", sd.getTel());
			record.put("addr", sd.getAddr());
			record.put("weekdayon", sd.getWeekdayon());
			record.put("weekdayoff", sd.getWeekdayoff());
			record.put("weekendon", sd.getWeekendon());
			record.put("weekendoff", sd.getWeekendoff());
			record.put("minordermoney", sd.getMinordermoney());
			store.add(record);
		}
		
		return JSONArray.toJSONString(store);
	}
}

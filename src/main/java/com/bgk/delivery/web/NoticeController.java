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
import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bgk.delivery.service.NoticeDto;
import com.sun.javafx.sg.prism.NGShape.Mode;
import com.bgk.delivery.common.PagingUtil;
import com.bgk.delivery.impl.NoticeDao;
import com.bgk.delivery.impl.NoticeServiceImpl;


@Controller
public class NoticeController {
	
	@Value("${PAGESIZE}")
	private String pageSize;
	
	@Value("${BLOCKPAGE}")
	private String blockPage;
	
	@Resource(name="noticeService")
	private NoticeServiceImpl service;
	
	//01. 공지사항 목록
	@RequestMapping("/customer/noticeList.whpr")
	public String list(Model model,
					   @RequestParam Map map,
					   @RequestParam(required=false, defaultValue="1") int nowPage,
					   HttpServletRequest req) 
	throws Exception
	{
		int totalRecordCount = service.getTotalRecCount(map);
		
		int pagesize = Integer.parseInt(pageSize);
		int totalPage =(int)Math.ceil((double)totalRecordCount/pagesize);		
		
		//System.out.println("총 레코드 수 : "+totalRecordCount+", 페이지사이즈 : "+pagesize+", 총 페이지 : "+totalPage);
		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pagesize +1;
		int end  = nowPage*pagesize;
		
		//페이징을 위한 로직 끝]	
		//서비스 호출]
		map.put("start", start);
		map.put("end", end);
		
		String	pagingString	=
				PagingUtil.pagingBootStrapStyle(totalRecordCount, pagesize, Integer.parseInt(blockPage), nowPage, 
				req.getContextPath() + "/customer/noticeList.whpr?", req);
		
		List<NoticeDto> records = service.selectList(map);
		
		model.addAttribute("notice", records);
		model.addAttribute("pagingString", pagingString);
		
		return "customer/noticeList.tile";
	}//list
	
	//02. 공지사항 자세히 보기
	@RequestMapping("/customer/noticeDetail.whpr")
	public String view(@RequestParam Map map, Model model) throws Exception
	{
		//System.out.println(map.get("no"));
		
		NoticeDto ndto = service.selectOne((String)map.get("no"));
		model.addAttribute("ndto", ndto);
		
		return "customer/noticeDetail.tile";
	}//view
	
}/////NoticeController

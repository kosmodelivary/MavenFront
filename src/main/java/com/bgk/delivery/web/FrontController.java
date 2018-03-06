package com.bgk.delivery.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {
	
	@RequestMapping("/menu/All.whpr")
	public String menu() throws Exception
	{
		
		return "menu/All.tile";
	}
	
	@RequestMapping("/home.whpr")
	public String home() throws Exception
	{
		
		return "index.tile";
	}

}

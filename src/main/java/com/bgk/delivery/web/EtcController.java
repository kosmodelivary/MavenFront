package com.bgk.delivery.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcController {
	
	@RequestMapping("/etc/privacy.whpr")
	public String privacy() throws Exception{
		
		return "etc/privacy.tile";
	}
	
	@RequestMapping("/etc/terms.whpr")
	public String terms() throws Exception{
		
		return "etc/terms.tile";
	}
	
}

package com.bgk.delivery.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
	
	@RequestMapping("/customer/faqList.whpr")
	public String faqList() throws Exception{
		
		return "customer/faqList.tile";
	}
	
	@RequestMapping("/customer/noticeList.whpr")
	public String noticelist() throws Exception{
		
		return "customer/noticeList.tile";
	}
	
}

package com.bgk.delivery.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bgk.delivery.impl.FAQServiceImpl;
import com.bgk.delivery.service.FAQDto;

@Controller
public class CustomerController {
	
	@Resource(name="faqService")
	private FAQServiceImpl faqService;
	
	@RequestMapping("/customer/faqList.whpr")
	public String faqList(Model model) throws Exception{
		
		List<FAQDto> 	faq	= faqService.selectList();
		
		model.addAttribute("faq", faq);
		
		return "customer/faqList.tile";
	}
	
	@RequestMapping("/customer/noticeList.whpr")
	public String noticelist() throws Exception{
		
		return "customer/noticeList.tile";
	}
	
}

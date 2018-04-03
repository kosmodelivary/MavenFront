package com.bgk.delivery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.bgk.delivery.impl.FAQServiceImpl;

@Controller
public class FAQController {

	@Resource(name="faqService")
	private FAQServiceImpl service;
	
}

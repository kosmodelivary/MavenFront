package com.bgk.delivery.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bgk.delivery.HomeController;

@Controller
public class FrontController {
	
	@RequestMapping("/home.whpr")
	public String home() throws Exception
	{
		return "index";
	}

}

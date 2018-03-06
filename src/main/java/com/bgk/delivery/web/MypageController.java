package com.bgk.delivery.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("/mypage/memberUpdate.whpr")
	public String memberUpdate() throws Exception{
		
		return "mypage/memberUpdate.tile";
	}
	@RequestMapping("/mypage/passwordUpdate.whpr")
	public String passUpdate() throws Exception{
		
		return "mypage/passwordUpdate.tile";
	}
	@RequestMapping("/mypage/memberWithdraw.whpr")
	public String withdraw() throws Exception{
		
		return "mypage/memberWithdraw.tile";
	}
}

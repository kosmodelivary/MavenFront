package com.bgk.delivery.web;


import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgk.delivery.impl.MemberServiceImpl;
import com.bgk.delivery.service.MemberDTO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberServiceImpl memService;
	
	@RequestMapping("/member/searchIdPassword.whpr")
	public String searchIDPW() throws Exception{
		
		return "member/searchIdPassword.tile";
	}
	
	@RequestMapping("/member/joinAgree.whpr")
	public String joinAgree() throws Exception{
		
		return "member/joinAgree.tile";
	}
	
	@RequestMapping("/member/login.whpr")
	public String login() throws Exception{
		
		return "member/login.tile";
	}
	
	@RequestMapping("/member/join.whpr")
	public String join() throws Exception{
		
		return "member/join.tile";
	}
	//아이디 중복확인
	@RequestMapping("/member/idcheck.whpr")
	@ResponseBody
	public String idcheck(@RequestParam String member_email) throws Exception{
		return memService.memOne(member_email)==null?"true":"false";
	}
	//회원가입 진행
	@RequestMapping("/member/proc.whpr")
	public String proc(MemberDTO dto,Model model) throws Exception{
		dto.setMember_agreeemail(dto.getMember_agreeemail()!=null?"true":"false");
		dto.setMember_agreesms(dto.getMember_agreesms()!=null?"true":"false");
		int affected = memService.memInsert(dto);
		model.addAttribute("suc_fail", affected);
		model.addAttribute("dto", dto);
		return "member/proc";
	}
	//회원가입 완료
	@RequestMapping("/member/joinSuccess.whpr")
	public String joinSuc(MemberDTO dto,Model model) throws Exception{
		model.addAttribute("dto",dto);
		return "member/joinSuccess.tile";
	}
	//아이디 찾기
	@ResponseBody
	@RequestMapping(value="/member/searchID.whpr",produces="text/html; charset=UTF-8")	
	public String searchID(MemberDTO dto) throws Exception{
		MemberDTO find= memService.memSearch(dto);
		JSONObject json = new JSONObject();
		if(find == null) {
			json.put("data", "입력 하신 정보로 회원 정보를 조회할 수 없습니다.");
			return json.toString();
		}
		else {
			json.put("data", find.getMember_email());
			return json.toString();
		}
	}
}
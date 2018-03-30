package com.bgk.delivery.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	//회원가입 및 로그인
	@RequestMapping("/member/searchIdPassword.whpr")
	public String searchIDPW() throws Exception{
		
		return "member/searchIdPassword.tile";
	}
	
	@RequestMapping("/member/joinAgree.whpr")
	public String joinAgree() throws Exception{
		
		return "member/joinAgree.tile";
	}
	
	@RequestMapping("/member/login.whpr")
	public String login(HttpSession session) throws Exception{
		if(session.getAttribute("dto") != null) return "member/memberorder.tile";
		else return "member/login.tile";
	}
	
	@RequestMapping("/member/join.whpr")
	public String join() throws Exception{
		
		return "member/join.tile";
	}
	
	@RequestMapping("/mypage/memberUpdate.whpr")
	public String memberUpdate() throws Exception{
		
		return "mypage/memberUpdate.tile";
	}
	
	//마이페이지
	@RequestMapping("/mypage/passwordUpdate.whpr")
	public String passUpdate() throws Exception{
		
		return "mypage/passwordUpdate.tile";
	}
	
	@RequestMapping("/mypage/memberWithdraw.whpr")
	public String withdraw() throws Exception{
		
		return "mypage/memberWithdraw.tile";
	}
	
	@RequestMapping("/mypage/mypage.whpr")
	public String mypage() throws Exception{
		
		return "mypage/mypage.tile";
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
		if(find == null) return null;
		else {
			json.put("find", find.getMember_email());
			return json.toString();
		}
	}
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/member/searchPW.whpr", produces = "text/html; charset=UTF-8")
	public String findPW(MemberDTO dto) throws Exception {
		MemberDTO findpass = memService.memPass(dto);
		JSONObject json = new JSONObject();
		if(findpass != null) return null;
		else {
			json.put("member_no", dto.getMember_no());
			return json.toString();
		}
	}
	//로그인
	@RequestMapping("/member/loginProc.whpr")
	public String isMember(MemberDTO dto,HttpSession session,HttpServletRequest req) throws Exception{
		dto = memService.isMember(dto);
		if(dto == null) {
			req.setAttribute("loginErr", "일치하는 정보가 없습니다");
			return "forward:/member/login.whpr";
		}
		else {
			session.setAttribute("dto", dto);
			return "forward:/mypage/mypage.whpr";
		}
	}
	//로그아웃
	@RequestMapping("/member/logout.whpr")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/home.whpr";
	}
}
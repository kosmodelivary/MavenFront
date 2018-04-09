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
	//회원가입 및 로그인 페이지 연결
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
		if(session.getAttribute("dto") != null) {
			return "redirect:/cart/cartList.whpr";
		}
		else return "member/login.tile";
	}
	
	@RequestMapping("/member/join.whpr")
	public String join() throws Exception{
		
		return "member/join.tile";
	}
	
	@RequestMapping("/order/nonMemberOrder.whpr")
	public String order() throws Exception{
		
		return "member/nonMemberOrder.tile";
	}
	
	//마이페이지 페이지 연결
	@RequestMapping("/mypage/memberUpdate.whpr")
	public String memberUpdate() throws Exception{
		
		return "mypage/memberUpdate.tile";
	}
	
	@RequestMapping("/mypage/passwordUpdate.whpr")
	public String passUpdate() throws Exception{
		
		return "mypage/passwordUpdate.tile";
	}
	
	@RequestMapping("/mypage/memberWithdraw.whpr")
	public String memberwithdraw() throws Exception{
		
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
	public String proc(MemberDTO dto,Model model,HttpSession session) throws Exception{
		dto.setMember_agreeemail(dto.getMember_agreeemail()!=null?"true":"false");
		dto.setMember_agreesms(dto.getMember_agreesms()!=null?"true":"false");
		int affected = memService.memInsert(dto);
		session.setAttribute("email", dto.getMember_email());
		model.addAttribute("suc_fail", affected);
		model.addAttribute("mmb", "join");
		return "member/proc";
	}
	//회원가입 완료
	@RequestMapping("/member/joinSuccess.whpr")
	public String joinSuc() throws Exception{
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
		if(findpass == null) return null;
		else {
			json.put("find", dto.getMember_email());
			return json.toString();
		}
	}
	//비밀번호 찾았을 경우 비밀번호 변경
	@RequestMapping("/mypage/newpass.whpr")
	public String newpass(MemberDTO dto,Model model) throws Exception{
		int affected = memService.passChange(dto);
		model.addAttribute("suc_fail", affected);
		return "member/proc";
	}
	//로그인
	@RequestMapping("/member/loginProc.whpr")
	public String isMember(MemberDTO dto,HttpSession session,HttpServletRequest req) throws Exception{
		if(session.getAttribute("dto")==null) {
			if(memService.isMember(dto)==null) {
				req.setAttribute("loginErr", "일치하는 정보가 없습니다");
				return "forward:/member/login.whpr";
			}
			dto = memService.memOne(dto.getMember_email());
		}
		else dto = memService.memOne(((MemberDTO)session.getAttribute("dto")).getMember_email());
		session.setAttribute("dto", dto);
		return "redirect:/mypage/mypage.whpr";
	}
	//로그아웃
	@RequestMapping("/member/logout.whpr")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/home.whpr";
	}
	//회원정보수정
	@RequestMapping("/mypage/update.whpr")
	public String update(MemberDTO dto,Model model) throws Exception{
		dto.setMember_agreeemail(dto.getMember_agreeemail()!=null?"true":"false");
		dto.setMember_agreesms(dto.getMember_agreesms()!=null?"true":"false");
		int affected = memService.memUpdate(dto);
		model.addAttribute("suc_fail", affected);
		model.addAttribute("mmb", "edit");
		return "member/proc";
	}
	//비밀번호 변경
	@RequestMapping("/mypage/passchange.whpr")
	public String passChange(MemberDTO dto,Model model) throws Exception{
		int affected = 0;
		//변경 전 비밀번호 일치 검사
		if(dto.getMember_password().equals(((MemberDTO)memService.memOne(dto.getMember_email())).getMember_password())) {
			dto.setMember_password(dto.getPasschange());
			affected = memService.passChange(dto);
		}
		model.addAttribute("suc_fail", affected);
		model.addAttribute("mmb", "pass");
		return  "member/proc";
	}
	//회원탈퇴
	@RequestMapping("/mypage/withdraw.whpr")
	public String withdraw(MemberDTO dto,Model model) throws Exception{
		int affected = memService.memDelete(dto);
		model.addAttribute("suc_fail",affected);
		model.addAttribute("mmb", "with");
		return "member/proc";
	}
	//회원탈퇴 완료
	@RequestMapping("/mypage/withdrawsuccess.whpr")
	public String withdrawsuccess(HttpSession session) throws Exception{
		session.invalidate();
		return "mypage/withdrawsuccess.tile";
	}
}
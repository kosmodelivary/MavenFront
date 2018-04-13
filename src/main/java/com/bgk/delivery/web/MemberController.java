package com.bgk.delivery.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgk.delivery.impl.CartServiceImpl;
import com.bgk.delivery.impl.MemberServiceImpl;
import com.bgk.delivery.impl.StoreServiceImpl;
import com.bgk.delivery.service.CartDTO;
import com.bgk.delivery.service.MemberDTO;
import com.bgk.delivery.service.StoreDto;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberServiceImpl memService;
	
	@Resource(name = "cartService")
	private CartServiceImpl service;
	
	@Resource(name = "storeService")
	private StoreServiceImpl st_service;
	
	private String sendOrderNo;
	
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
	public String mypage(HttpSession session, Model model) throws Exception{
		
		// session의 id
		if(session.getAttribute("dto") != null) {
			String member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();
			
			List<CartDTO> orderComplete = service.listCompleteOrder(member_email); // 주문 정보
			int sumMoney = service.sumCompleteOrder(member_email); // 주문 금액 호출
			List<CartDTO> newComplete = new Vector<CartDTO>();
			for(CartDTO cd : orderComplete) {
				CartDTO record = new CartDTO();
				record.setOrder_no(cd.getOrder_no());
				String menu_name = "";
				if(cd.getMenu_name().contains(",")) {
					String [] temp = cd.getMenu_name().split(",");
					for(int i = 0 ; i < temp.length ; i++) {
						if(i == 0) {menu_name = temp[i];}
						if(i == temp.length-1) {menu_name += "(외 "+i+"개)";}
					}
					record.setMenu_name(menu_name);
				}
				else {record.setMenu_name(cd.getMenu_name());}
				record.setOrder_price(cd.getOrder_price());
				record.setPay_complete(cd.getPay_complete());
				record.setStore_name(cd.getStore_name());
				record.setStore_tel(cd.getStore_tel());
				record.setStatus(cd.getStatus());
				newComplete.add(record);
			}
			model.addAttribute("orderComplete", newComplete); // 주문완료 정보를 model에 저장
			
		}
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
		int affected = 0;
		if(memService.isMember(dto)!=null) {
			affected = memService.memDelete(dto);
		}
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
	
	@RequestMapping(value="/mypage/orderDetail.whpr",produces="text/html; charset=UTF-8")
	public String orderDetail(@RequestParam Map map, Model model)
	throws Exception
	{
		List<CartDTO> orderInfo = service.orderList(map.get("order_no").toString());
		StoreDto sd = null;
		MemberDTO md = null;
		String store_no = null, member_email = null;
		for(CartDTO cd : orderInfo) {
			store_no = cd.getStore_no();
			member_email = cd.getMember_email();
		}
		int sumMoney = service.sumCompleteOrder(member_email); // 주문 금액 호출
		sd = st_service.selectOne(store_no);
		md = memService.memOne(member_email);
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("storeInfo", sd);
		model.addAttribute("memberInfo", md);
		model.addAttribute("sumMoney", sumMoney);
		
		return "mypage/orderDetail.tile";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/rtSend.whpr",produces="text/html; charset=UTF-8")
	public String rtSend(HttpServletRequest req, HttpServletResponse resp) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String callback = req.getParameter("callback");
		
		List<CartDTO> orderComplete = service.rtOrderList("접수"); // 주문 정보
		List<Map> order = new Vector<Map>();
		String member_email = null;
		for(CartDTO cd : orderComplete) {
			sendOrderNo = cd.getOrder_no();
			Map record = new HashMap();
			record.put("cart_no", cd.getCart_no());
			record.put("member_email", cd.getMember_email());
			member_email = cd.getMember_email();
			record.put("menu_no", cd.getMenu_no());
			record.put("pay_complete", cd.getPay_complete());
			record.put("order_no", cd.getOrder_no());
			record.put("store_no", cd.getStore_no());
			record.put("status", cd.getStatus());
			record.put("order_memo", cd.getOrder_memo());
			record.put("order_addr", cd.getOrder_addr());
			order.add(record);
		}
		
		System.out.println("rtSend.whpr에서 sendOrderNo : "+sendOrderNo);
		System.out.println("백엔드로 뿌려줄 jsonp 객체 : "+JSONArray.toJSONString(order));
		
		
		return callback+"("+JSONArray.toJSONString(order)+")";
	}
}
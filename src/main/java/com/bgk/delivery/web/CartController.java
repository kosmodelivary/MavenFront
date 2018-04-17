package com.bgk.delivery.web;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgk.delivery.impl.CartServiceImpl;
import com.bgk.delivery.impl.MemberServiceImpl;
import com.bgk.delivery.impl.MenuServiceImpl;
import com.bgk.delivery.service.CartDTO;
import com.bgk.delivery.service.MemberDTO;

@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartServiceImpl service;
	
	@Resource(name = "memberService")
	private MemberServiceImpl memService;
	
	@Resource(name = "menuService")
	private MenuServiceImpl menuService;

	String member_email;
	
	// 1. 장바구니 추가
	@RequestMapping("/cart/cartInsert.whpr")
	public String insert(@ModelAttribute CartDTO dto, HttpSession session) {
		
		member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();

		if (member_email == null) {
			return "member/login.tile";
		}
		
		dto.setMember_email(member_email);

		// 장바구니에 기존 상품이 있는지 검사
		
		int count = service.countCart(dto.getMenu_no(), member_email);
		if (count == 0) {
			// 없으면 insert
			service.insert(dto);
			System.out.println("insert!!!!!!!!!!!!!");
		} else {
			// 있으면 update
			service.updateCart(dto);
			System.out.println("update!!!!!!!!!!!!!");
		}
		System.out.println(String.format("count : %s, getMember_email : %s, getMenu_no : %s, getAmount : %s", 
				count , dto.getMember_email(), dto.getMenu_no(), dto.getAmount()));
		
		return "redirect:/cart/cartList.whpr";
	}

	// 2. 장바구니 목록
	@RequestMapping("/cart/cartList.whpr")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("dto") != null) {
			member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();
	
			Map<String, Object> map = new HashMap<String, Object>();
			List<CartDTO> list = service.listCart(member_email); // 장바구니 정보
			int sumMoney = service.sumMoney(member_email); // 장바구니 전체 금액 호출
	
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(10만원이상 => 무료, 미만 => 2500원)
			int fee = sumMoney >= 30000 ? 0 : 2500;
	
			map.put("list", list); // 장바구니 정보를 map에 저장
			map.put("count", list.size()); // 장바구니 상품의 유무
			map.put("sumMoney", sumMoney); // 장바구니 전체 금액
			map.put("fee", fee); // 배송금액
			map.put("allSum", sumMoney + fee); // 주문 상품 전체 금액
	
			mav.setViewName("cart/cartList.tile"); // view(jsp)의 이름 저장
			mav.addObject("map", map); // map 변수 저장
	
			return mav;
		}
		else mav.setViewName("cart/cartList.tile");
		return mav;
	}

	// 3. 장바구니 삭제
	@RequestMapping("/cart/cartDelete.whpr")
	public String delete(@RequestParam int cart_no) {
		service.delete(cart_no);
		System.out.println("delete!!!!!!!!!!!!!");
		return "redirect:/cart/cartList.whpr";
	}

	// 4. 장바구니 수량 확정 후 오더페이지 이동
	@RequestMapping("/cart/cartUpdateAndPayment.whpr")
	public ModelAndView update(@RequestParam String[] amount, 
							   @RequestParam int[] menu_no, 
							   HttpSession session, HttpServletRequest req,
							   ModelAndView mav) {
		System.out.println(amount.length);
        // session의 id
		member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();

		// 레코드의 갯수 만큼 반복문 실행해서 db자료 업데이트
        for(int i=0; i<menu_no.length; i++){
            CartDTO dto = new CartDTO();
            dto.setMember_email(member_email);
            dto.setAmount(Integer.parseInt(amount[i]));
            dto.setMenu_no(menu_no[i]);
            System.out.println("메뉴 번호 : "+menu_no[i]+", 수량 : "+amount[i]);
            
            service.modifyCart(dto);
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = service.listCart(member_email); // 장바구니 정보
        int sumMoney = service.sumMoney(member_email); 

		int fee = sumMoney >= 30000 ? 0 : 2500;

		map.put("list", list); // 장바구니 정보를 map에 저장
		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("sumMoney", sumMoney); // 장바구니 전체 금액
		map.put("fee", fee); // 배송금액
		map.put("allSum", sumMoney + fee); // 주문 상품 전체 금액

		map.put("ordererName", memService.memOne(member_email).getMember_name());
		map.put("phone1", memService.memOne(member_email).getMember_tel().split("-")[0]);
		map.put("phone2", memService.memOne(member_email).getMember_tel().split("-")[1]);
		map.put("phone3", memService.memOne(member_email).getMember_tel().split("-")[2]);
		
        mav.setViewName("order/payment.tile"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

        return mav;
    }
	
	@RequestMapping("/cart/payment.whpr")
	public String sendToBackEnd(@RequestParam String [] amount,
						 @RequestParam int[] menu_no,
						 HttpSession session,
						 HttpServletRequest req) throws Exception
	{
		//백엔드로 주문을 넘겨야하는 메소드...
		// session의 id
		member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();
        // 레코드의 갯수 만큼 반복문 실행 db 업데이트
		System.out.println(req.getParameter("order_no"));
        for(int i=0; i<menu_no.length; i++){
            CartDTO dto = new CartDTO();
            dto.setMember_email(member_email);
            dto.setMenu_no(menu_no[i]);
            Map map = new HashMap();
            map.put("menu_no", menu_no[i]);
            map.put("amount", amount[i]);
            menuService.p_SellCount(map);
            dto.setPay_complete(req.getParameter("payFlag").toString());
            dto.setOrder_no(req.getParameter("order_no"));
            dto.setStore_no(req.getParameter("store_no"));
            dto.setStatus("접수");
            dto.setOrder_memo(req.getParameter("order_memo"));
            dto.setOrder_addr(req.getParameter("defaultAddr").trim()+" "+req.getParameter("detailAddr").trim());
            
            service.completeOrder(dto);
        }

		return "redirect:/mypage/mypage.whpr";
	}
	
	@RequestMapping("/cart/keepShopping.whpr")
	public String keepShop(@RequestParam String [] amount,
						   @RequestParam int [] menu_no,
						   HttpSession session,
						   HttpServletRequest req) throws Exception
	{
		// 회원의 장바구니를 조회
		member_email = ((MemberDTO) session.getAttribute("dto")).getMember_email();
		List<CartDTO> list = service.listCart(member_email);
		for(CartDTO pickOne : list) {
			for(int i = 0 ; i < menu_no.length ; i++) {
				if(pickOne.getMenu_no() == menu_no[i] && // 메뉴 번호 같으면서 수량은 다른지 
						pickOne.getAmount() != Integer.parseInt(amount[i]))
				{
					pickOne.setAmount(Integer.parseInt(amount[i])); // 다르면 이 코드 실행
				}
				service.modifyCart(pickOne);// 바뀐 수량 적용
			}
		}
		return "redirect:/menu/All.whpr";
	}
	
}

package com.bgk.delivery.web;

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
import com.bgk.delivery.service.CartDTO;
import com.bgk.delivery.service.MemberDTO;

@Controller
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Resource(name = "cartService")
	private CartServiceImpl service;
	@Resource(name = "memberService")
	private MemberServiceImpl memService;

	// 1. 장바구니 추가
	@RequestMapping("/cart/cartInsert.whpr")
	public String insert(@ModelAttribute CartDTO dto, HttpSession session) {

		String memberEmail = ((MemberDTO) session.getAttribute("dto")).getMember_email();
		System.out.println("memberEmail : " + memberEmail);

		if (memberEmail == null) {
			return "member/login.tile";
		}
		dto.setMember_email(memberEmail);

		// 장바구니에 기존 상품이 있는지 검사
		int count = service.countCart(dto.getMenu_no(), memberEmail);
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
			String memberEmail = ((MemberDTO) session.getAttribute("dto")).getMember_email();
	
			Map<String, Object> map = new HashMap<String, Object>();
			List<CartDTO> list = service.listCart(memberEmail); // 장바구니 정보
			int sumMoney = service.sumMoney(memberEmail); // 장바구니 전체 금액 호출
	
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
						HttpSession session, 
						ModelAndView mav) {
        // session의 id
		String memberEmail = ((MemberDTO) session.getAttribute("dto")).getMember_email();
        // 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<menu_no.length; i++){
            CartDTO dto = new CartDTO();
            dto.setMember_email(memberEmail);
            dto.setAmount(Integer.parseInt(amount[i]));
            dto.setMenu_no(menu_no[i]);
            service.modifyCart(dto);
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = service.listCart(memberEmail); // 장바구니 정보
        int sumMoney = service.sumMoney(memberEmail); 

		int fee = sumMoney >= 30000 ? 0 : 2500;

		map.put("list", list); // 장바구니 정보를 map에 저장
		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("sumMoney", sumMoney); // 장바구니 전체 금액
		map.put("fee", fee); // 배송금액
		map.put("allSum", sumMoney + fee); // 주문 상품 전체 금액

		map.put("ordererName", memService.memOne(memberEmail).getMember_name());
		map.put("phone1", memService.memOne(memberEmail).getMember_tel().split("-")[0]);
		map.put("phone2", memService.memOne(memberEmail).getMember_tel().split("-")[1]);
		map.put("phone3", memService.memOne(memberEmail).getMember_tel().split("-")[2]);
		
        mav.setViewName("order/payment.tile"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

        return mav;
    }
	
	@RequestMapping("/cart/payment.whpr")
	public String toBack(@RequestParam String [] amount,
						 @RequestParam int[] menu_no,
						 HttpSession session,
						 HttpServletRequest req) throws Exception
	{
		//백엔드로 주문을 넘겨야하는 메소드...
		// session의 id
		String memberEmail = ((MemberDTO) session.getAttribute("dto")).getMember_email();
        // 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<menu_no.length; i++){
            CartDTO dto = new CartDTO();
            dto.setMember_email(memberEmail);
            dto.setAmount(Integer.parseInt(amount[i]));
            dto.setMenu_no(menu_no[i]);
            service.completeOrder(dto);
        }
		
		
		return null;
	}
	
	
}

package com.bgk.delivery.service;

import java.util.List;
import java.util.Map;

public interface CartService {

	// 1. 장바구니 추가
	public void insert(CartDTO dto);
	// 2. 장바구니 목록
	public List<CartDTO> listCart(String memberEmail);
	// 3. 장바구니 삭제
	public void delete(int cartNo);
	// 4. 장바구니 수정
	public int modifyCart(CartDTO dto);
	// 5. 장바구니 금액 합계
	public int sumMoney(String memberEmail);
	// 6. 장바구니 상품 확인
	public int countCart(int menuNo, String memberEmail);
	// 7. 장바구니 상품 수량 변경
	public int updateCart(CartDTO dto);

	// temp 1. 장바구니 최종 결제 완료
	public int completeOrder(CartDTO dto);
	// temp 2. 장바구니 목록
	public List<CartDTO> listCompleteOrder(String memberEmail);
	// temp 3. 장바구니 목록
	public int sumCompleteOrder(Map map);
	// temp 4. 주문완료된 레코드 가져오기
	public List<CartDTO> orderList(String order_no);
	// temp 5. 회원과 무관하게 주문완료 및 접수된 주문정보 가져오기
	public List<CartDTO> rtOrderList(String status);
	

	/*	
	* insertCart 	: 장바구니 insert
	* listCart	 	: 장바구니 전체 목록을 select
	* sumMoney 		: 장바구니에 담긴 상품과 수량 전체를 합산한 결과를 select, 장바구니가 비어있으면 0
	* deleteCart 	: 장바구니 delete
	* countCart 	: 장바구니 동일한 상품 레코드가 있으면 select count
	* modifyCart 	: 장바구니 수량 update(수량 덮어쓰기)
	* updateCart	: 장바구니 동일한 상품 레코드가 있으면 기존의 수량과 입력받은 수량을 합산하여 update(수량 합산하기)	
	*/
}

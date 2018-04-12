package com.bgk.delivery.service;

import java.sql.Date;
import java.sql.Timestamp;

public class CartDTO {
	
	private int 		cart_no;		// 카트번호(pk)
	private String		member_email;	// 회원이메일(ID)
	private int			menu_no;		// 메뉴번호(fk)
	private int 		amount;			// 수량
	private String  	pay_complete;	// 주문완료
	private String		order_no;		// 주문번호(중복으로 같은 넘버의 레코드들을 꺼내와야함)
	private String		store_no;		// 매장번호(fk)
	private String		status;			// 주문상태
	private String		order_memo;		// 주문메모
	private String		order_addr;		// 주문메모
	
	//  ===== 여기부터 join문으로 가져오는 칼럼들 =====
	private String 		menu_name;		// 메뉴이름
	private int 		menu_price;		// 메뉴가격
	private int 		total_price;	// 가격합계
	private String 		member_name;	// 회원이름
	private String		store_name;
	private String		store_tel;
	
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPay_complete() {
		return pay_complete;
	}
	public void setPay_complete(String pay_complete) {
		this.pay_complete = pay_complete;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getStore_no() {
		return store_no;
	}
	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStore_name() {
		return store_name;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", member_email=" + member_email + ", member_name=" + member_name
				+ ", menu_no=" + menu_no + ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", amount="
				+ amount + ", total_price=" + total_price + ", pay_complete=" + pay_complete + ", order_no=" + order_no + "]";
	}
	
}

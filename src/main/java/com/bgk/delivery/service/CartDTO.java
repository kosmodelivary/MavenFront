package com.bgk.delivery.service;

public class CartDTO {
	
	private int 	cart_no;		// 카트번호
	private String	member_email;	// 회원이메일(ID)
	private String 	member_name;	// 회원이름
	private int		menu_no;		// 메뉴번호
	private String 	menu_name;		// 메뉴이름
	private int 	menu_price;		// 메뉴가격
	private int 	amount;			// 수량
	private int 	total_price;	// 가격합계
	private String  pay_complete;
	
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
	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", member_email=" + member_email + ", member_name=" + member_name
				+ ", menu_no=" + menu_no + ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", amount="
				+ amount + ", total_price=" + total_price + ", pay_complete=" + pay_complete + "]";
	}
	
}

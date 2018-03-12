package com.bgk.delivery.service;

public class StoreDto {

	private String 	store_no;
	private String 	store_name;
	private String 	store_tel;
	private String 	store_addr;
	private int 	store_weekdayon;
	private int 	store_weekdayoff;
	private int 	store_weekendon;
	private int 	store_weekendoff;
	private int		store_minordermoney;
	
	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	public String getNo() {
		return store_no;
	}
	public void setNo(String store_no) {
		this.store_no = store_no;
	}
	public String getName() {
		return store_name;
	}
	public void setName(String store_name) {
		this.store_name = store_name;
	}
	public String getTel() {
		return store_tel;
	}
	public void setTel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getAddr() {
		return store_addr;
	}
	public void setAddr(String store_addr) {
		this.store_addr = store_addr;
	}
	public int getWeekdayon() {
		return store_weekdayon;
	}
	public void setWeekdayon(int store_weekdayon) {
		this.store_weekdayon = store_weekdayon;
	}
	public int getWeekdayoff() {
		return store_weekdayoff;
	}
	public void setWeekdayoff(int store_weekdayoff) {
		this.store_weekdayoff = store_weekdayoff;
	}
	public int getWeekendon() {
		return store_weekendon;
	}
	public void setWeekendon(int store_weekendon) {
		this.store_weekendon = store_weekendon;
	}
	public int getWeekendoff() {
		return store_weekendoff;
	}
	public void setWeekendoff(int store_weekendoff) {
		this.store_weekendoff = store_weekendoff;
	}
	public int getMinordermoney() {
		return store_minordermoney;
	}
	public void setMinordermoney(int store_minordermoney) {
		this.store_minordermoney = store_minordermoney;
	}
} // end StoreDto 

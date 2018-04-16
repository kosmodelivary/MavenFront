package com.bgk.delivery.service;

import java.sql.Date;

public class MenuDto {
	
	private String 	menu_no;
	private String 	category_name;
	private String 	menu_name;
	private String 	menu_price;
	private String 	menu_weight;
	private String 	menu_calrorie;
	private String 	menu_protein;
	private String 	menu_sodium;
	private String 	menu_sugars;
	private String 	menu_fat;
	private Date   	menu_enddate;
	private String 	menu_file_extension;
	private int  	sellCount;
	
	public String getMenu_no() {
		return menu_no;
	}
	public String getCategory_name() {
		return category_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public String getMenu_weight() {
		return menu_weight;
	}
	public String getMenu_calrorie() {
		return menu_calrorie;
	}
	public String getMenu_protein() {
		return menu_protein;
	}
	public String getMenu_sodium() {
		return menu_sodium;
	}
	public String getMenu_sugars() {
		return menu_sugars;
	}
	public String getMenu_fat() {
		return menu_fat;
	}
	public Date getMenu_enddate() {
		return menu_enddate;
	}
	public String getMenu_file_extension() {
		return menu_file_extension;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	
	
}

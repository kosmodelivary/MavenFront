package com.bgk.delivery.service;

import java.sql.Date;

public class NoticeDto {

	private String notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_visitcount;
	private Date notice_postdate;
	
//---------------------------------------------------
// getter / setter
//---------------------------------------------------
	
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_visitcount() {
		return notice_visitcount;
	}
	public void setNotice_visitcount(int notice_visitcount) {
		this.notice_visitcount = notice_visitcount;
	}
	public Date getNotice_postdate() {
		return notice_postdate;
	}
	public void setNotice_postdate(Date notice_postdate) {
		this.notice_postdate = notice_postdate;
	}
		
}///NoticeDto

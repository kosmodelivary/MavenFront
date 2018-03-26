package com.bgk.delivery.service;


public interface MemberService {
	public MemberDTO memOne(String id);
	
	public int memInsert(MemberDTO dto);
	public int memUpdate(MemberDTO dto);
	public int memDelete(MemberDTO dto);
	
	public MemberDTO memSearch(MemberDTO dto);
	public int memPass(MemberDTO dto);
}
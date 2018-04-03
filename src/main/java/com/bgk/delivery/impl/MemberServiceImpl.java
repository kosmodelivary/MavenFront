package com.bgk.delivery.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.service.MemberDTO;
import com.bgk.delivery.service.MemberService;
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberdao;

	@Override
	public MemberDTO memOne(String id) {
		return memberdao.memOne(id);
	}

	@Override
	public int memInsert(MemberDTO dto) {
		return memberdao.memInsert(dto);
	}

	@Override
	public int memUpdate(MemberDTO dto) {
		return memberdao.memUpdate(dto);
	}

	@Override
	public int memDelete(MemberDTO dto) {
		return memberdao.memDelete(dto);
	}
	
	@Override
	public int passChange(MemberDTO dto) {
		return memberdao.passChange(dto);
	}
	
	@Override
	public MemberDTO memSearch(MemberDTO dto) {
		return memberdao.memSearch(dto);
	}

	@Override
	public MemberDTO memPass(MemberDTO dto) {
		return memberdao.memPass(dto);
	}

	@Override
	public MemberDTO isMember(MemberDTO dto) {
		return memberdao.isMember(dto);
	}
	
}
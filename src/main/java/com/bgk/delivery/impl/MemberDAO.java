package com.bgk.delivery.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.MemberDTO;
import com.bgk.delivery.service.MemberService;

@Repository
public class MemberDAO implements MemberService{
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public MemberDTO memOne(String id) {
		return sqlMapper.selectOne("memOne",id);
	}

	@Override
	public int memInsert(MemberDTO dto) {
		return sqlMapper.insert("memInsert",dto);
	}

	@Override
	public int memUpdate(MemberDTO dto) {
		return sqlMapper.update("memUpdate",dto);
	}

	@Override
	public int memDelete(MemberDTO dto) {
		return sqlMapper.delete("memDelete", dto);
	}

	@Override
	public int passChange(MemberDTO dto) {
		return sqlMapper.update("passChange",dto);
	}
	
	@Override
	public MemberDTO memSearch(MemberDTO dto) {
		return sqlMapper.selectOne("memSearch", dto);
	}

	@Override
	public MemberDTO memPass(MemberDTO dto) {
		return sqlMapper.selectOne("memPass", dto);
	}

	@Override
	public MemberDTO isMember(MemberDTO dto) {
		return sqlMapper.selectOne("isMember", dto);
	}

	
	
}
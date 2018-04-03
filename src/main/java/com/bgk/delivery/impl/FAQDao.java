package com.bgk.delivery.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.FAQDto;
import com.bgk.delivery.service.FAQService;

@Repository
public class FAQDao implements FAQService  {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<FAQDto> selectList() {
		return sqlMapper.selectList("faqSelectList");
	}

	@Override
	public FAQDto selectOne(String no) {
		return sqlMapper.selectOne("faqSelectOne",no);
	}

}
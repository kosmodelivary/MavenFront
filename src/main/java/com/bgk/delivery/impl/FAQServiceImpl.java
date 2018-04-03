package com.bgk.delivery.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.service.FAQDto;
import com.bgk.delivery.service.FAQService;

@Service("faqService")
public class FAQServiceImpl implements FAQService  {

	@Resource(name="FAQDao")
	private FAQDao fdao;
	
	@Override
	public List<FAQDto> selectList() {
		return fdao.selectList();
	}

	@Override
	public FAQDto selectOne(String no) {
		return fdao.selectOne(no);
	}

	
}

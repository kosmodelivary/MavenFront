package com.bgk.delivery.service;

import java.util.List;

public interface FAQService {
	
	public List<FAQDto> selectList();
	public FAQDto selectOne(String no);

}

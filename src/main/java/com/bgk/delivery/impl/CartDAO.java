package com.bgk.delivery.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bgk.delivery.service.CartDTO;
import com.bgk.delivery.service.CartService;

@Repository
public class CartDAO implements CartService {

	@Resource(name = "sqlMapper")
	private SqlSessionTemplate sqlMapper;

	// 1. 장바구니 추가
	@Override
	public void insert(CartDTO dto) {
		sqlMapper.insert("insertCart", dto);
	}

	// 2. 장바구니 목록
	@Override
	public List<CartDTO> listCart(String memberEmail) {
		return sqlMapper.selectList("listCart", memberEmail);
	}

	// 3. 장바구니 삭제
	@Override
	public void delete(int cartNo) {
		sqlMapper.delete("deleteCart", cartNo);
	}

	// 4. 장바구니 수정
	@Override
	public int modifyCart(CartDTO dto) {
		return sqlMapper.update("modifyCart", dto);
	}

	// 5. 장바구니 금액 합계
	@Override
	public int sumMoney(String memberEmail) {
		sqlMapper.selectOne("sumMoney", memberEmail);
		return sqlMapper.selectOne("sumMoney", memberEmail);
	}

	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(int menuNo, String memberEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu_no", menuNo);
		map.put("member_email", memberEmail);
		return sqlMapper.selectOne("countCart", map);
	}

	// 7. 장바구니 상품수량 변경
	@Override
	public int updateCart(CartDTO dto) {
		return sqlMapper.update("updateCart", dto);
	}

	@Override
	public int completeOrder(CartDTO dto) {
		return sqlMapper.update("completeOrder", dto);
	}

	@Override
	public List<CartDTO> listCompleteOrder(String memberEmail) {
		return sqlMapper.selectList("listCompleteOrder", memberEmail);
	}

	@Override
	public int sumCompleteOrder(String memberEmail) {
		return sqlMapper.selectOne("sumCompleteOrder", memberEmail);
	}
	
	@Override
	public List<CartDTO> orderList(String order_no) {
		return sqlMapper.selectList("orderList", order_no);
	}

	@Override
	public List<CartDTO> rtOrderList(String status) {
		return sqlMapper.selectList("rtOrderList", status);
	}

}

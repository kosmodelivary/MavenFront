package com.bgk.delivery.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bgk.delivery.service.CartDTO;
import com.bgk.delivery.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService{

	@Resource(name="cartDAO")
	private CartDAO 	cartdao;	
	
	@Override
	public void insert(CartDTO dto) {
		cartdao.insert(dto);		
	}

	@Override
	public List<CartDTO> listCart(String memberEmail) {
		return cartdao.listCart(memberEmail);
	}

	@Override
	public void delete(int cartNo) {
		cartdao.delete(cartNo);
	}

	@Override
	public int modifyCart(CartDTO dto) {
		return cartdao.modifyCart(dto);
	}

	@Override
	public int sumMoney(String memberEmail) {
		return cartdao.sumMoney(memberEmail);
	}

	@Override
	public int countCart(int memuNo, String memberEmail) {
		return cartdao.countCart(memuNo, memberEmail);
	}

	@Override
	public int updateCart(CartDTO dto) {
		return cartdao.updateCart(dto);		
	}

	@Override
	public int completeOrder(CartDTO dto) {
		return cartdao.completeOrder(dto);
	}

	@Override
	public List<CartDTO> listCompleteOrder(String memberEmail) {
		return cartdao.listCompleteOrder(memberEmail);
	}

	@Override
	public int sumCompleteOrder(String memberEmail) {
		return cartdao.sumCompleteOrder(memberEmail);
	}

}

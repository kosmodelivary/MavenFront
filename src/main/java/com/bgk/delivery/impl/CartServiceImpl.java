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
	public void modifyCart(CartDTO dto) {
		cartdao.modifyCart(dto);
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
	public void updateCart(CartDTO dto) {
		cartdao.updateCart(dto);		
	}

	@Override
	public void completeOrder(CartDTO dto) {
		cartdao.completeOrder(dto);
	}

}

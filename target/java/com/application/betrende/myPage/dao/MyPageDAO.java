package com.application.betrende.myPage.dao;

import java.util.List;
import java.util.Map;

import com.application.betrende.myPage.dto.CartDTO;

public interface MyPageDAO {
	
//	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
//	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception;
//	public MemberDTO selectOneMyInfo(String memberId) throws Exception;
//	public void updateMyInfo(MemberDTO memberDTO) throws Exception;
//	public void deleteMember(String memberId) throws Exception;
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception;
	public void insertCart(CartDTO cartDTO) throws Exception;
	public List<Map<String,Object>> selectListMyCart(String memberId) throws Exception;
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	public void updateCartProductQty(Map<String,Object> updateMap) throws Exception;
	public int selectCountMyCart(String memberId) throws Exception;
//	public void deleteCartListByRemoveMember(String memberId) throws Exception;
//	public void deleteOrderListByRemoveMember(String memberId) throws Exception;
	
	
}

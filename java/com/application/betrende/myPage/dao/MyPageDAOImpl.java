package com.application.betrende.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.betrende.myPage.dto.CartDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
//	@Override
//	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception {
//		return sqlSession.selectList("myPage.selectListMyOrder" , memberId);
//	}
//
//	@Override
//	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception {
//		return sqlSession.selectOne("myPage.selectOneMyOrder" , orderDetailMap);
//	}
//
//	@Override
//	public MemberDTO selectOneMyInfo(String memberId) throws Exception {
//		return sqlSession.selectOne("myPage.selectOneMyInfo" , memberId);
//	}
//
//	@Override
//	public void updateMyInfo(MemberDTO memberDTO) throws Exception {
//		sqlSession.update("myPage.updateMyInfo" , memberDTO);
//	}
//
//	@Override
//	public void deleteMember(String memberId) throws Exception {
//		sqlSession.delete("myPage.deleteMember" , memberId);
//	}
//	
	@Override
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedCart" , cartDTO);

	}
	
	@Override
	public void insertCart(CartDTO cartDTO) throws Exception {
		sqlSession.insert("myPage.insertCart" , cartDTO);
	}

	@Override
	public List<Map<String,Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyCart" , memberId);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {
		sqlSession.delete("myPage.deleteCart" , deleteCartCdList);
	}

	@Override
	public void updateCartProductQty(Map<String,Object> updateMap) throws Exception {
		sqlSession.update("myPage.updateCartProductQty" , updateMap);
	}

	@Override
	public int selectCountMyCart(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountMyCart" , memberId);
	}
//
//	@Override
//	public void deleteCartListByRemoveMember(String memberId) throws Exception {
//		sqlSession.delete("myPage.deleteCartListByRemoveMember" , memberId);
//	}
//
//	@Override
//	public void deleteOrderListByRemoveMember(String memberId) throws Exception {
//		sqlSession.delete("myPage.deleteOrderListByRemoveMember" , memberId);
//	}
//	
}

package com.application.betrende.seller.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.betrende.seller.member.dto.SellerMemberDTO;

@Repository
public class SellerMemberDAOImpl implements SellerMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertSellerMember(SellerMemberDTO sellerMemberDTO) throws Exception {
		sqlSession.insert("seller.member.insertSellerMember" , sellerMemberDTO);
		
	}

	@Override
	public SellerMemberDTO selectSellerLogin(SellerMemberDTO sellerMemberDTO) throws Exception {
		return sqlSession.selectOne("seller.member.selectSellerLogin", sellerMemberDTO);
	}

}

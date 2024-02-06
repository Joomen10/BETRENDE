package com.application.betrende.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.betrende.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("member.insertMember" , memberDTO);
	}

	@Override
	public MemberDTO selectLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("member.selectLogin", memberDTO);
	}

	@Override
	public String selectDuplicatedId(String memberId) throws Exception{
		return sqlSession.selectOne("member.selectDuplicatedId" , memberId);
	}
	
//	@Override
//	public int selectMyOrderCnt(String memberId) throws Exception {
//		return sqlSession.selectOne("member.selectMyOrderCnt" , memberId);
//	}
//
	@Override
	public int selectMyCartCnt(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectMyCartCnt" , memberId);
	}

}

package com.application.betrende.member.dao;

import com.application.betrende.member.dto.MemberDTO;

public interface MemberDAO {
	
	public void insertMember(MemberDTO memberDTO) throws Exception;
	public MemberDTO selectLogin(MemberDTO memberDTO) throws Exception;
	public String selectDuplicatedId(String memberId) throws Exception;
//	public int selectMyOrderCnt(String memberId) throws Exception;
	public int selectMyCartCnt(String memberId) throws Exception;

}

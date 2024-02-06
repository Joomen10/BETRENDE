package com.application.betrende.member.service;

import com.application.betrende.member.dto.MemberDTO;

public interface MemberService {
	
	public void addMember(MemberDTO memberDTO) throws Exception;
	public boolean login(MemberDTO memberDTO) throws Exception;
	public String checkDuplicatedId(String memberId) throws Exception;
//	public int getMyOrderCnt(String memberId) throws Exception;
	public int getMyCartCnt(String memberId) throws Exception;
	

}

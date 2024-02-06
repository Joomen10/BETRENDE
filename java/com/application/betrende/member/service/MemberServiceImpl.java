package com.application.betrende.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.betrende.member.dao.MemberDAO;
import com.application.betrende.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		if (memberDTO.getEmailstsYn() == null)  memberDTO.setEmailstsYn("N");
		if (memberDTO.getSmsstsYn() == null)    memberDTO.setSmsstsYn("N");
		memberDAO.insertMember(memberDTO);
		
	}

	@Override
	public boolean login(MemberDTO memberDTO) throws Exception {
		
		MemberDTO checkExsistId = memberDAO.selectLogin(memberDTO);
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDTO.getPasswd() ,checkExsistId.getPasswd())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String checkDuplicatedId(String memberId) throws Exception {
		if (memberDAO.selectDuplicatedId(memberId) == null)	return "duplicate";
		else												return "notDuplicate";
	}
	
//	@Override
//	public int getMyOrderCnt(String memberId) throws Exception{
//		return memberDAO.selectMyOrderCnt(memberId);
//	}
	
	@Override
	public int getMyCartCnt(String memberId) throws Exception{
		return memberDAO.selectMyCartCnt(memberId);
	}
}

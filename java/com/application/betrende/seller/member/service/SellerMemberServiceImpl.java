package com.application.betrende.seller.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.betrende.seller.member.dao.SellerMemberDAO;
import com.application.betrende.seller.member.dto.SellerMemberDTO;

@Service
public class SellerMemberServiceImpl implements SellerMemberService {
	
	@Autowired
	private SellerMemberDAO sellerMemberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void addSellerMember(SellerMemberDTO sellerMemberDTO) throws Exception {
		
		sellerMemberDTO.setPasswd(bCryptPasswordEncoder.encode(sellerMemberDTO.getPasswd())); 
		sellerMemberDAO.insertSellerMember(sellerMemberDTO);
		
	}

	@Override
	public boolean sellerLogin(SellerMemberDTO sellerMemberDTO) throws Exception {
		
		SellerMemberDTO checkExsistId = sellerMemberDAO.selectSellerLogin(sellerMemberDTO);
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(sellerMemberDTO.getPasswd() ,checkExsistId.getPasswd())) {
				return true;
			}
		}
		return false;
	}

}

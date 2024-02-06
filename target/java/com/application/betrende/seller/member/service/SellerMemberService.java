package com.application.betrende.seller.member.service;

import com.application.betrende.seller.member.dto.SellerMemberDTO;

public interface SellerMemberService {
	
	public void addSellerMember(SellerMemberDTO sellerMemberDTO) throws Exception;
	public boolean sellerLogin(SellerMemberDTO sellerMemberDTO) throws Exception;

}

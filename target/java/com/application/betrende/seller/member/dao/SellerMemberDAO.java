package com.application.betrende.seller.member.dao;

import com.application.betrende.seller.member.dto.SellerMemberDTO;

public interface SellerMemberDAO {
	
	public void insertSellerMember(SellerMemberDTO sellerMemberDTO) throws Exception;
	public SellerMemberDTO selectSellerLogin(SellerMemberDTO sellerMemberDTO) throws Exception;

}

package com.application.betrende.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {

	private long cartCd;
	private int	productCd;
	private int cartProductQty;
	private String memberId;
	private Date enrollDt;
	
	public long getCartCd() {
		return cartCd;
	}
	public void setCartCd(long cartCd) {
		this.cartCd = cartCd;
	}
	public int getProductCd() {
		return productCd;
	}
	public void setProductCd(int productCd) {
		this.productCd = productCd;
	}
	public int getCartProductQty() {
		return cartProductQty;
	}
	public void setCartProductQty(int cartProductQty) {
		this.cartProductQty = cartProductQty;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartCd=" + cartCd + ", productCd=" + productCd + ", cartProductQty=" + cartProductQty
				+ ", memberId=" + memberId + ", enrollDt=" + enrollDt + "]";
	}
	
	
	
}

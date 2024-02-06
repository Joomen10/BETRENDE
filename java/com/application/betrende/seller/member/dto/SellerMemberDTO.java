package com.application.betrende.seller.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class SellerMemberDTO {
	
	private String sellerId;
	private String sellerNm;
	private String passwd;
	private String hp;
	private String email;
	private String zipcode;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String state;
	private String intro;
	private String brand;
	private String avgReview;
	private String sellerFileName;
	private Date joinDt;
	
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerNm() {
		return sellerNm;
	}
	public void setSellerNm(String sellerNm) {
		this.sellerNm = sellerNm;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddreessLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getAvgReview() {
		return avgReview;
	}
	public void setAvgReview(String avgReview) {
		this.avgReview = avgReview;
	}
	public String getSellerFileName() {
		return sellerFileName;
	}
	public void setSellerFileName(String sellerFileName) {
		this.sellerFileName = sellerFileName;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	@Override
	public String toString() {
		return "SellerMemberDTO [sellerId=" + sellerId + ", sellerNm=" + sellerNm + ", passwd=" + passwd + ", hp=" + hp
				+ ", email=" + email + ", zipcode=" + zipcode + ", addressLine1=" + addressLine1 + ", addressLine2="
				+ addressLine2 + ", city=" + city + ", state=" + state + ", intro=" + intro + ", brand=" + brand
				+ ", avgReview=" + avgReview + ", sellerFileName=" + sellerFileName + ", joinDt=" + joinDt + "]";
	}

}

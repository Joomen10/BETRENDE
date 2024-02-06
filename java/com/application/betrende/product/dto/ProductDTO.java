package com.application.betrende.product.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductDTO {
	
	private int productCd;
	private String productNm;
	private String sellerId;
	private int price;
	private int stock;
	private String brand;
	private int views;
	private int likes;
	private String category;
	private String gender;
	private int discountRate;
	private String info;
	private String color;
	private String sizeXsYn;
	private String sizeSYn;
	private String sizeMYn;
	private String sizeLYn;
	private String sizeXlYn;
	private String productFileName1;
	private String productFileName2;
	private String productFileName3;
	private String productFileName4;
	private Date updateDt;
	
	public int getProductCd() {
		return productCd;
	}
	public void setProductCd(int productCd) {
		this.productCd = productCd;
	}
	public String getProductNm() {
		return productNm;
	}
	public void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSizeXsYn() {
		return sizeXsYn;
	}
	public void setSizeXsYn(String sizeXsYn) {
		this.sizeXsYn = sizeXsYn;
	}
	public String getSizeSYn() {
		return sizeSYn;
	}
	public void setSizeSYn(String sizeSYn) {
		this.sizeSYn = sizeSYn;
	}
	public String getSizeMYn() {
		return sizeMYn;
	}
	public void setSizeMYn(String sizeMYn) {
		this.sizeMYn = sizeMYn;
	}
	public String getSizeLYn() {
		return sizeLYn;
	}
	public void setSizeLYn(String sizeLYn) {
		this.sizeLYn = sizeLYn;
	}
	public String getSizeXlYn() {
		return sizeXlYn;
	}
	public void setSizeXlYn(String sizeXlYn) {
		this.sizeXlYn = sizeXlYn;
	}
	public String getProductFileName1() {
		return productFileName1;
	}
	public void setProductFileName1(String productFileName1) {
		this.productFileName1 = productFileName1;
	}
	public String getProductFileName2() {
		return productFileName2;
	}
	public void setProductFileName2(String productFileName2) {
		this.productFileName2 = productFileName2;
	}
	public String getProductFileName3() {
		return productFileName3;
	}
	public void setProductFileName3(String productFileName3) {
		this.productFileName3 = productFileName3;
	}
	public String getProductFileName4() {
		return productFileName4;
	}
	public void setProductFileName4(String productFileName4) {
		this.productFileName4 = productFileName4;
	}
	public Date getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}
	@Override
	public String toString() {
		return "ProductDTO [productCd=" + productCd + ", productNm=" + productNm + ", sellerId=" + sellerId + ", price="
				+ price + ", stock=" + stock + ", brand=" + brand + ", views=" + views + ", likes=" + likes
				+ ", category=" + category + ", gender=" + gender + ", discountRate=" + discountRate + ", info=" + info
				+ ", color=" + color + ", sizeXsYn=" + sizeXsYn + ", sizeSYn=" + sizeSYn + ", sizeMYn=" + sizeMYn
				+ ", sizeLYn=" + sizeLYn + ", sizeXlYn=" + sizeXlYn + ", productFileName1=" + productFileName1
				+ ", productFileName2=" + productFileName2 + ", productFileName3=" + productFileName3
				+ ", productFileName4=" + productFileName4 + ", updateDt=" + updateDt + "]";
	}
	
	private int page;
    private int perPageNum;
    
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public ProductDTO() {
        this.page = 1;
        this.perPageNum = 6;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

	
	
	

}

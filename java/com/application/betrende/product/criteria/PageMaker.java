package com.application.betrende.product.criteria;

import com.application.betrende.product.dto.ProductDTO;

public class PageMaker {
    
    private ProductDTO productDTO;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5;
    
    public ProductDTO getProductDTO() {
        return productDTO;
    }
    public void setCri(ProductDTO productDTO) {
        this.productDTO = productDTO;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }
    
    private void calcData() {
        
        endPage = (int) (Math.ceil(productDTO.getPage() / (double) displayPageNum) * displayPageNum);
 
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double) productDTO.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        prev = startPage == 1 ? false : true;
        next = endPage * productDTO.getPerPageNum() < totalCount ? true : false;
        
    }
    
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
 
}


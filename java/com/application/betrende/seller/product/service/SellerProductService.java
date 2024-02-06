package com.application.betrende.seller.product.service;

import java.util.List;

import com.application.betrende.product.dto.ProductDTO;

public interface SellerProductService {
	
	public List<ProductDTO> getProductList(String sellerId) throws Exception;
	public void addNewProduct(ProductDTO productDTO) throws Exception;
	public void modifyProduct(ProductDTO productDTO) throws Exception;
	public void removeProduct(int productCd) throws Exception;

}

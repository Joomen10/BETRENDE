package com.application.betrende.seller.product.dao;

import java.util.List;

import com.application.betrende.product.dto.ProductDTO;

public interface SellerProductDAO {
	
	public List<ProductDTO>selectListProduct(String sellerId) throws Exception;
	public void insertProduct(ProductDTO productDTO) throws Exception;
	public void updateProduct(ProductDTO productDTO) throws Exception;
	public void deleteProduct(int productCd) throws Exception;

}

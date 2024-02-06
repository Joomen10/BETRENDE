package com.application.betrende.seller.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.betrende.product.dto.ProductDTO;
import com.application.betrende.seller.product.dao.SellerProductDAO;

@Service
public class SellerProductServiceImpl implements SellerProductService {

	@Autowired
	private SellerProductDAO sellerProductDAO;
	
	@Override
	public List<ProductDTO> getProductList(String sellerId) throws Exception {
		return sellerProductDAO.selectListProduct(sellerId);
	}

	@Override
	public void addNewProduct(ProductDTO productDTO) throws Exception {
		sellerProductDAO.insertProduct(productDTO);
		
	}
	
	@Override
	public void modifyProduct(ProductDTO productDTO) throws Exception {
		sellerProductDAO.updateProduct(productDTO);
	}
	
	@Override
	public void removeProduct(int productCd) throws Exception {
		sellerProductDAO.deleteProduct(productCd);
		
	}

}

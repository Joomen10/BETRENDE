package com.application.betrende.product.service;

import java.util.List;
import java.util.Map;

import com.application.betrende.product.criteria.Criteria;
import com.application.betrende.product.dto.ProductDTO;


public interface ProductService {
	
	public List<ProductDTO> getProductList(ProductDTO productDTO) throws Exception;
	public List<ProductDTO> getRelatedProductList(ProductDTO productDTO) throws Exception;
	public ProductDTO getProductDetail(int productCd) throws Exception;
	public List<ProductDTO> getSearchProductList(Map<String,Object> searchMap) throws Exception;
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception;
	public int countProductListTotal() throws Exception;
}

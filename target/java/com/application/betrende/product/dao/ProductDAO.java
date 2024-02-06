package com.application.betrende.product.dao;

import java.util.List;
import java.util.Map;

import com.application.betrende.product.criteria.Criteria;
import com.application.betrende.product.dto.ProductDTO;


public interface ProductDAO {

	public List<ProductDTO> selectProductList(ProductDTO productDTO) throws Exception;
	public List<ProductDTO> selectRelatedProductList(ProductDTO productDTO) throws Exception;
	public ProductDTO selectOneProduct(int productCd) throws Exception;
	public List<ProductDTO> selectListSearchProduct(Map<String,Object> searchMap) throws Exception;
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception;
	public int countProductList() throws Exception;

}


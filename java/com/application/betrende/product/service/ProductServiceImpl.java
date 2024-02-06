package com.application.betrende.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.betrende.product.criteria.Criteria;
import com.application.betrende.product.dao.ProductDAO;
import com.application.betrende.product.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductDTO> getProductList(ProductDTO productDTO) throws Exception {
		return productDAO.selectProductList(productDTO);
	}
	
	@Override
	public List<ProductDTO> getRelatedProductList(ProductDTO productDTO) throws Exception {
		return productDAO.selectRelatedProductList(productDTO);
	}
	
	@Override
	public ProductDTO getProductDetail(int productCd) throws Exception {
		return productDAO.selectOneProduct(productCd);
	}

	@Override
	public List<ProductDTO> getSearchProductList(Map<String, Object> searchMap) throws Exception {
		return productDAO.selectListSearchProduct(searchMap);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception{
	    return productDAO.selectBoardList(cri);
	}
	
	@Override
	public int countProductListTotal() throws Exception{
	    return productDAO.countProductList();
	}

}

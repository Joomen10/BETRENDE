package com.application.betrende.seller.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.betrende.product.dto.ProductDTO;

@Repository
public class SellerProductDAOImpl implements SellerProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> selectListProduct(String sellerId) throws Exception {
		return sqlSession.selectList("seller.product.selectListProduct", sellerId);
	}

	@Override
	public void insertProduct(ProductDTO productDTO) throws Exception {
		sqlSession.insert("seller.product.insertProduct" , productDTO);
		
	}

	@Override
	public void updateProduct(ProductDTO productDTO) throws Exception {
		sqlSession.update("seller.product.updateProduct" , productDTO);
		
	}

	@Override
	public void deleteProduct(int productCd) throws Exception {
		sqlSession.delete("seller.product.deleteProduct" , productCd);
	}

}

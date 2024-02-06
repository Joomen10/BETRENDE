package com.application.betrende.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.betrende.product.criteria.Criteria;
import com.application.betrende.product.dto.ProductDTO;

@Repository
public class ProductDAOimpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> selectProductList(ProductDTO productDTO) throws Exception {
	   return sqlSession.selectList("product.selectListProduct" , productDTO);	
	}
	
	@Override
	public List<ProductDTO> selectRelatedProductList(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList("product.selectListRelatedProduct" , productDTO);	
	}
	
	@Override
	public ProductDTO selectOneProduct(int productCd) throws Exception {
		return sqlSession.selectOne("product.selectOneProduct" , productCd);
	}

	@Override
	public List<ProductDTO> selectListSearchProduct(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("product.selectListSearchProduct" , searchMap);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception{
		return sqlSession.selectList("product.selectBoardList", cri);
	}
	
	
	public int countProductList(){
	    return sqlSession.selectOne("product.countProductList");
	}

	

}

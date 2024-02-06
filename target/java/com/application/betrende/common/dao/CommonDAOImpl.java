package com.application.betrende.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAOImpl implements CommonDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListBestSeller() throws Exception {
		return sqlSession.selectList("common.selectListBestSeller");
	}

	@Override
	public List<Map<String, Object>> selectListMostViewed() throws Exception {
		return sqlSession.selectList("common.selectListMostViewed");
	}

	@Override
	public List<Map<String, Object>> selectListNewArrivals() throws Exception {
		return sqlSession.selectList("common.selectListNewArrivals");
	}

	@Override
	public List<Map<String, Object>> selectListHotSales() throws Exception {
		return sqlSession.selectList("common.selectListHotSales");
	}

}

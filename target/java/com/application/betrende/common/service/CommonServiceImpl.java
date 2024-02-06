package com.application.betrende.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.betrende.common.dao.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDAO commonDAO;

	@Override
	public List<Map<String, Object>> getBestSellerMainInfo() throws Exception {
		return commonDAO.selectListBestSeller();
	}

	@Override
	public List<Map<String, Object>> getMostViewedMainInfo() throws Exception {
		return commonDAO.selectListMostViewed();
	}

	@Override
	public List<Map<String, Object>> getNewArrivalsMainInfo() throws Exception {
		return commonDAO.selectListNewArrivals();
	}

	@Override
	public List<Map<String, Object>> getHotSalesMainInfo() throws Exception {
		return commonDAO.selectListHotSales();
	}

}

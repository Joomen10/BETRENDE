package com.application.betrende.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {
	
	public List<Map<String,Object>> getBestSellerMainInfo() throws Exception;
	public List<Map<String,Object>> getMostViewedMainInfo() throws Exception;
	public List<Map<String,Object>> getNewArrivalsMainInfo() throws Exception;
	public List<Map<String,Object>> getHotSalesMainInfo() throws Exception;

}

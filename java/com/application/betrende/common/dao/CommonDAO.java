package com.application.betrende.common.dao;

import java.util.List;
import java.util.Map;

public interface CommonDAO {
	
	public List<Map<String,Object>> selectListBestSeller() throws Exception;
	public List<Map<String,Object>> selectListMostViewed() throws Exception;
	public List<Map<String,Object>> selectListNewArrivals() throws Exception;
	public List<Map<String,Object>> selectListHotSales() throws Exception;
	

}

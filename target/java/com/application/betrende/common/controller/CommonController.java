package com.application.betrende.common.controller;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.common.service.CommonService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	
	private final String PRODUCT_IMAGE_REPO_PATH = "/Users/chris/Downloads/file_repo/";
	//private final String PRODUCT_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("productFileName1") String productFileName1 , HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		String filePath = PRODUCT_IMAGE_REPO_PATH + productFileName1;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}

//	@GetMapping("/")
//	public ModelAndView home() throws Exception{
//		
//		ModelAndView mv = new ModelAndView("/main");
//		
//		Map<String, String> goodsListMap = new HashMap<String, String>();
//		goodsListMap.put("sort", "all");
//		goodsListMap.put("part", "all");
//		
//		mv.addObject("newBookCnt"      , commonService.getNewBookCnt());
//		mv.addObject("generalBookCnt"  , commonService.getGeneralBookCnt());
//		mv.addObject("bestSellerCnt"   , commonService.getBestSellerCnt());
//		mv.addObject("steadySellerCnt" , commonService.getSteadySellerCnt());
//		mv.addObject("newBooksInfo"    , commonService.getNewGoodsMainInfo());
//		mv.addObject("bestBooksInfo"   , commonService.getBestGoodsMainInfo());
//		mv.addObject("steadyBooksInfo" , commonService.getSteadyGoodsMainInfo());
//		
//		return mv;
//		
//	}
	
	@GetMapping("/")
	public ModelAndView home() throws Exception{
		
		ModelAndView mv = new ModelAndView("/main");

//		mv.addObject("newBookCnt"      , commonService.getNewBookCnt());
//		mv.addObject("generalBookCnt"  , commonService.getGeneralBookCnt());
//		mv.addObject("bestSellerCnt"   , commonService.getBestSellerCnt());
//		mv.addObject("steadySellerCnt" , commonService.getSteadySellerCnt());
//		mv.addObject("newBooksInfo"    , commonService.getNewGoodsMainInfo());
//		mv.addObject("bestBooksInfo"   , commonService.getBestGoodsMainInfo());
//		mv.addObject("steadyBooksInfo" , commonService.getSteadyGoodsMainInfo());
		mv.addObject("bestSellerInfo"	,	commonService.getBestSellerMainInfo());
		mv.addObject("mostViewedInfo"	,	commonService.getMostViewedMainInfo());
		mv.addObject("newArrivalsInfo"	,	commonService.getNewArrivalsMainInfo());
		mv.addObject("hotSalesInfo"	,	commonService.getHotSalesMainInfo());
		
		return mv;
	}
	
	@GetMapping("/selectuserLogin")
	public ModelAndView selectuserLogin() throws Exception{
		return new ModelAndView("/selectuserLogin");
	}
	
	@GetMapping("/selectuserRegister")
	public ModelAndView selectuserRegister() throws Exception{
		return new ModelAndView("/selectuserRegister");
	}
}

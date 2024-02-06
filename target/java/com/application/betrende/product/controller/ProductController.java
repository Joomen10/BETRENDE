package com.application.betrende.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.product.criteria.Criteria;
import com.application.betrende.product.criteria.PageMaker;
import com.application.betrende.product.dto.ProductDTO;
import com.application.betrende.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/productDetail")
	public ModelAndView goodsDetail(@RequestParam("productCd") int productCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		
		ProductDTO productDTO = productService.getProductDetail(productCd);
		
		mv.setViewName("/product/productDetail");
		mv.addObject("productDTO" , productDTO);
		mv.addObject("relatedProductList" , productService.getRelatedProductList(productDTO));
		
		return mv;
		
	} 
	
	@GetMapping("/productList")
	public ModelAndView productList(@ModelAttribute ProductDTO productDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/product/productList");
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(productDTO);
	    pageMaker.setTotalCount(productService.countProductListTotal());
	    List<ProductDTO> productList = productService.getProductList(productDTO);
	    
	    mv.addObject("productTotal", productService.countProductListTotal());
		mv.addObject("productList" , productList);
		mv.addObject("pageMaker" , pageMaker);
		
		return mv;
		
	}

	@GetMapping("/searchProduct")
	public ModelAndView searchProduct(@RequestParam Map<String,Object> searchMap)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/product/productList");
		mv.addObject("productList" , productService.getSearchProductList(searchMap));
		
		return mv;
		
	}

}

package com.application.betrende.seller.product.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.product.dto.ProductDTO;
import com.application.betrende.product.service.ProductService;
import com.application.betrende.seller.product.service.SellerProductService;

@Controller
@RequestMapping("/seller/product")
public class SellerProductController {
	
	@Autowired
	private SellerProductService sellerProductService;
	
	@Autowired
	private ProductService productService;
	
	private final String PRODUCT_IMAGE_REPO_PATH = "/Users/chris/Downloads/file_repo/";
	//private final String PRODUCT_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	@GetMapping("/sellerProductList")
	public ModelAndView sellerProductList(@RequestParam("sellerId") String sellerId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/seller/product/sellerProductList");
		
		mv.addObject("productList", sellerProductService.getProductList(sellerId));
		
		return mv;
		
	}
	
	@GetMapping("/sellerProductAdd")
	public ModelAndView addNewGoods() {
		return new ModelAndView("/seller/product/sellerProductAdd");
	}
	
	@PostMapping("/sellerProductAdd")
	public ResponseEntity<Object> addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");

		//SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNm(multipartRequest.getParameter("productNm"));
		productDTO.setSellerId(multipartRequest.getParameter("sellerId"));
		productDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		productDTO.setStock(Integer.parseInt(multipartRequest.getParameter("stock")));
		productDTO.setBrand(multipartRequest.getParameter("brand"));
		productDTO.setViews(0);
		productDTO.setLikes(0);
		productDTO.setCategory(multipartRequest.getParameter("category"));
		productDTO.setGender(multipartRequest.getParameter("gender"));
		productDTO.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		productDTO.setInfo(multipartRequest.getParameter("info"));
		productDTO.setColor(multipartRequest.getParameter("color"));
		productDTO.setSizeXsYn(multipartRequest.getParameter("sizeXsYn"));
		productDTO.setSizeSYn(multipartRequest.getParameter("sizeSYn"));
		productDTO.setSizeMYn(multipartRequest.getParameter("sizeMYn"));
		productDTO.setSizeLYn(multipartRequest.getParameter("sizeLYn"));
		productDTO.setSizeXlYn(multipartRequest.getParameter("sizeXlYn"));
		
		int n = 1;
		Iterator<String> file = multipartRequest.getFileNames();
		while (file.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
				
					if(!uploadFile.getOriginalFilename().isEmpty()) {
						String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
						System.out.println(uploadFileName);
						File f = new File(PRODUCT_IMAGE_REPO_PATH + uploadFileName);	
						uploadFile.transferTo(f); 
						if(n == 1) productDTO.setProductFileName1(uploadFileName);
						else if(n == 2) productDTO.setProductFileName2(uploadFileName);
						else if(n == 3) productDTO.setProductFileName3(uploadFileName);
						else if(n == 4) productDTO.setProductFileName4(uploadFileName);
				}
		n++;
		}
		
			
//		if(!uploadFile.getOriginalFilename().isEmpty()) {
//			String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
//			File f = new File(PRODUCT_IMAGE_REPO_PATH + uploadFileName);	
//			uploadFile.transferTo(f); 
//			productDTO.setProductFileName(uploadFileName);
//		}
		
		System.out.println(productDTO);
		sellerProductService.addNewProduct(productDTO);
		
		String jsScript= "<script>";
			   jsScript += " alert('상품을 등록하였습니다.');";
			   jsScript +=" location.href='" + request.getContextPath() + "/seller/product/sellerProductList?sellerId=" + productDTO.getSellerId() + "';";
			   jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@GetMapping("/sellerProductModify")
	public ModelAndView modifyGoods(@RequestParam("productCd") int productCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/seller/product/sellerProductModify");
		mv.addObject("productDTO" , productService.getProductDetail(productCd));
		
		return mv;
		
	}
	
	
	@PostMapping("/sellerProductModify")
	public ResponseEntity<Object> sellerProductModify(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");

		//SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductCd(Integer.parseInt(multipartRequest.getParameter("productCd")));
		productDTO.setProductNm(multipartRequest.getParameter("productNm"));
		productDTO.setSellerId(multipartRequest.getParameter("sellerId"));
		productDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		productDTO.setStock(Integer.parseInt(multipartRequest.getParameter("stock")));
		productDTO.setBrand(multipartRequest.getParameter("brand"));
		productDTO.setViews(0);
		productDTO.setLikes(0);
		productDTO.setCategory(multipartRequest.getParameter("category"));
		productDTO.setGender(multipartRequest.getParameter("gender"));
		productDTO.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		productDTO.setInfo(multipartRequest.getParameter("info"));
		productDTO.setColor(multipartRequest.getParameter("color"));
		productDTO.setSizeXsYn(multipartRequest.getParameter("sizeXsYn"));
		productDTO.setSizeSYn(multipartRequest.getParameter("sizeSYn"));
		productDTO.setSizeMYn(multipartRequest.getParameter("sizeMYn"));
		productDTO.setSizeLYn(multipartRequest.getParameter("sizeLYn"));
		productDTO.setSizeXlYn(multipartRequest.getParameter("sizeXlYn"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(PRODUCT_IMAGE_REPO_PATH + uploadFileName);	
				uploadFile.transferTo(f); 
				int n = 1;
				while(n < 4) {
					if(n == 1) productDTO.setProductFileName1(uploadFileName);
					else if(n == 2) productDTO.setProductFileName2(uploadFileName);
					else if(n == 3) productDTO.setProductFileName3(uploadFileName);
					else if(n == 4) productDTO.setProductFileName4(uploadFileName);
					n = n + 1;
				}
				
				new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(Integer.parseInt(multipartRequest.getParameter("productCd"))).getProductFileName1()).delete();
				new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(Integer.parseInt(multipartRequest.getParameter("productCd"))).getProductFileName2()).delete();
				new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(Integer.parseInt(multipartRequest.getParameter("productCd"))).getProductFileName3()).delete();
				new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(Integer.parseInt(multipartRequest.getParameter("productCd"))).getProductFileName4()).delete();
			}
			
		}
		
		sellerProductService.modifyProduct(productDTO);
		
		String jsScript= "<script>";
				jsScript +=" alert('상품정보를 수정하였습니다.');";
				jsScript +=" location.href='" + request.getContextPath() + "/seller/product/sellerProductList?sellerId=" + productDTO.getSellerId() + "';";
				jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
	
	
	@GetMapping("/sellerProductRemove")
	public ResponseEntity<Object> sellerProductRemove(@RequestParam("productCd") int productCd, HttpServletRequest request) throws Exception {
		
		String targetSellerId = productService.getProductDetail(productCd).getSellerId(); 
		System.out.println(targetSellerId);
		
		new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(productCd).getProductFileName1()).delete();
		new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(productCd).getProductFileName2()).delete();
		new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(productCd).getProductFileName3()).delete();
		new File(PRODUCT_IMAGE_REPO_PATH + productService.getProductDetail(productCd).getProductFileName4()).delete();
		sellerProductService.removeProduct(productCd);
		
		String jsScript= "<script>";
			   jsScript += " alert('등록된 상품을 삭제하였습니다.');";
			   jsScript +=" location.href='" + request.getContextPath() + "/seller/product/sellerProductList?sellerId=" + targetSellerId + "';";
			   jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
	
	

}

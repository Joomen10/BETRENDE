package com.application.betrende.seller.member.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.seller.member.dto.SellerMemberDTO;
import com.application.betrende.seller.member.service.SellerMemberService;

@Controller
@RequestMapping("/seller/member")
public class SellerMemberController {
	
	@Autowired
	private SellerMemberService sellerMemberService;
	
	private final String SELLER_IMAGE_REPO_PATH = "/Users/chris/Downloads/file_repo/";
	//private final String SELLER_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	@GetMapping("/sellerLogin")
	public ModelAndView sellerLogin() throws Exception {
		return new ModelAndView("/seller/member/sellerLogin");
	}
	
	@PostMapping("/sellerLogin")
	public @ResponseBody String sellerLogin(SellerMemberDTO sellerMemberDTO , HttpServletRequest request) throws Exception{
		
		String message = "";
		if (sellerMemberService.sellerLogin(sellerMemberDTO)) { 	
			
			HttpSession session = request.getSession();		
			session.setAttribute("sellerId"   , sellerMemberDTO.getSellerId());
			session.setAttribute("role"       , "seller");
			//session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(memberDTO.getMemberId()));
			//session.setAttribute("myCartCnt"  , memberService.getMyCartCnt(memberDTO.getMemberId()));
			session.setMaxInactiveInterval(60 * 30);
			
			message  = "<script>";
			message += " alert('You are successfully logged in!');";
			message += " location.href='" + request.getContextPath() + "/';";
			message += " </script>";
			
		}
		else { 
			
			message  = "<script>";
			message += " alert('login failed. Please check your ID and password');";
			message += " history.go(-1);";
			message += " </script>";
			
		}
		
		return message;
		
	}
	
	
	
	@GetMapping("/sellerRegister")
	public ModelAndView sellerRegister() throws Exception {
		return new ModelAndView("/seller/member/sellerRegister");
	}
	
	@PostMapping("/sellerRegister")
	public @ResponseBody String sellerRegister(MultipartHttpServletRequest multipartRequest , HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");

		SellerMemberDTO sellerMemberDTO = new SellerMemberDTO();
		sellerMemberDTO.setSellerId(multipartRequest.getParameter("sellerId"));
		sellerMemberDTO.setSellerNm(multipartRequest.getParameter("sellerNm"));
		sellerMemberDTO.setPasswd(multipartRequest.getParameter("passwd"));
		sellerMemberDTO.setHp(multipartRequest.getParameter("hp"));
		sellerMemberDTO.setEmail(multipartRequest.getParameter("email"));
		sellerMemberDTO.setZipcode(multipartRequest.getParameter("zipcode"));
		sellerMemberDTO.setAddressLine1(multipartRequest.getParameter("addressLine1"));
		sellerMemberDTO.setAddressLine2(multipartRequest.getParameter("addressLine2"));
		sellerMemberDTO.setCity(multipartRequest.getParameter("city"));
		sellerMemberDTO.setState(multipartRequest.getParameter("state"));
		sellerMemberDTO.setIntro(multipartRequest.getParameter("intro"));
		sellerMemberDTO.setBrand(multipartRequest.getParameter("brand"));
		sellerMemberDTO.setAvgReview(multipartRequest.getParameter("avgReview"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(SELLER_IMAGE_REPO_PATH + uploadFileName);	
				uploadFile.transferTo(f); 
				sellerMemberDTO.setSellerFileName(uploadFileName);
			}
		
		}
		
		sellerMemberService.addSellerMember(sellerMemberDTO);

		
		String message  = "<script>";
			   message += " alert('Welcome!');";
			   message += " location.href='" + request.getContextPath() + "/';";
			   message += " </script>";
	    
	   
		return message;

		
	}
	
	
	


}

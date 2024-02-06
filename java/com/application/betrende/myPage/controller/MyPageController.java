package com.application.betrende.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.member.service.MemberService;
import com.application.betrende.myPage.dto.CartDTO;
import com.application.betrende.myPage.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/myInfo")
//	public ModelAndView main(@RequestParam("memberId") String memberId) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/myPage/myInfo");
//		mv.addObject("memberDTO" , myPageService.getMyInfo(memberId));
//		
//		return mv;
//	}
//	
//	
//	@PostMapping("/modifyInfo")
//	public ResponseEntity<Object> modifyInfo(MemberDTO memberDTO , HttpServletRequest request) throws Exception {
//
//		myPageService.modifyMyInfo(memberDTO);
//		
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		
//		String jsScript  = "<script>";
//				jsScript += " alert('수정되었습니다.');";
//				jsScript += " location.href='" + request.getContextPath() + "/myPage/myInfo?memberId=" + memberDTO.getMemberId() +  "';";
//				jsScript += " </script>";
//		
//		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
//		
//	}
//	
//	
//	@GetMapping("/removeMember")
//	public ResponseEntity<Object> removeMember(HttpServletRequest request) throws Exception {
//		
//		HttpSession session = request.getSession();
//		session.invalidate(); 
//		
//		myPageService.removeMember(request.getParameter("memberId"));
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		
//		String jsScript  = "<script>";
//				jsScript += "alert('탈퇴되었습니다.');";
//				jsScript += "location.href='" + request.getContextPath() + "/';";
//				jsScript += "</script>";
//		
//		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
//		
//	}
//	
//	
//	@GetMapping("/myOrderList")
//	public ModelAndView myOrderList(HttpServletRequest request) throws Exception {
//		
//		HttpSession session = request.getSession();
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/myPage/myOrderList");
//		mv.addObject("myOrderList" , myPageService.getMyOrderList((String)session.getAttribute("memberId")));
//		
//		return mv;
//		
//	}
//	
//	
//	@GetMapping("/myOrderDetail")
//	public ModelAndView myOrderDetail(@RequestParam Map<String, Object> orderDetailMap) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/myPage/myOrderDetail");
//		mv.addObject("myOrder" , myPageService.getMyOrderDetail(orderDetailMap));
//		
//		return mv;
//		
//	}
//	
//	
	@GetMapping("/addCart")
	public @ResponseBody String addCart(@RequestParam ("productCd") int productCd , @RequestParam ("cartProductQty") int cartProductQty , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setMemberId(memberId);
		cartDTO.setProductCd(productCd);
		cartDTO.setCartProductQty(cartProductQty);
		

		String result = "duple";
		if (!myPageService.checkDuplicatedCart(cartDTO)) {
			myPageService.addCart(cartDTO);
			session.setAttribute("myCartCnt" , memberService.getMyCartCnt((memberId)));
			result = "notDuple";
		} 
		
		return result;
		
	}
	
	
	@GetMapping("/myCartList")
	public ModelAndView myCartList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cart/myCartList");
		
		String memberId = (String)session.getAttribute("memberId");
		mv.addObject("myCartList" , myPageService.getMyCartList(memberId));
		mv.addObject("countCartList" , myPageService.countCartList(memberId));
		
		return mv;
		
	}
	
	
	@GetMapping("/removeCart")
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList , HttpServletRequest request) throws Exception {
		
		String[] temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myPageService.removeCart(deleteCartCdList);
		
		HttpSession session = request.getSession();
		session.setAttribute("myCartCnt" , memberService.getMyCartCnt((String)session.getAttribute("memberId")));
		
		String jsScript = "<script>";
			   jsScript += "alert('장바구니 품목이 삭제되었습니다.'); ";
			   jsScript += "location.href='myCartList'";
			   jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/modifyCartProductQty")
	public ResponseEntity<Object> modifyProductQty(@RequestParam Map<String,Object> updateMap) throws Exception {
		myPageService.modifyCartProductQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
}

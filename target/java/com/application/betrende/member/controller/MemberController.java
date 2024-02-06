package com.application.betrende.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.betrende.member.dto.MemberDTO;
import com.application.betrende.member.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/register")
	public ModelAndView register() throws Exception{
		return new ModelAndView("/member/register");
	}
	
	@PostMapping("/register")
	public @ResponseBody String register(MemberDTO memberDTO , HttpServletRequest request) throws Exception {
		
		memberService.addMember(memberDTO);

		String message  = "<script>";
			   message += " alert('Welcome');";
			   message += " location.href='" + request.getContextPath() + "/';";
			   message += " </script>";
	    
		return message;
		
	}
	
	@GetMapping("/checkDuplicatedId")
	public ResponseEntity<String> checkDuplicatedId(@RequestParam("memberId") String memberId) throws Exception{
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
	@GetMapping("/login")
	public ModelAndView login() throws Exception {
		return new ModelAndView("/member/login");
	}
	
	@PostMapping("/login")
	public @ResponseBody String login(MemberDTO memberDTO , HttpServletRequest request) throws Exception{
		
		String message = "";
		if (memberService.login(memberDTO)) { 	
			
			HttpSession session = request.getSession();		
			session.setAttribute("memberId"   , memberDTO.getMemberId());
			session.setAttribute("role"       , "client");
			//session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(memberDTO.getMemberId()));
			session.setAttribute("myCartCnt"  , memberService.getMyCartCnt(memberDTO.getMemberId()));
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
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	
	}
	
}

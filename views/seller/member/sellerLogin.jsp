<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="checkout spad">	
		<div class="container">
        	<form action="${contextPath }/seller/member/sellerLogin" method="post" class="checkout__form">
               <div class="col-lg-8">
                   <h5>Seller SIGN IN</h5>
                   <br>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__input">
                               <p>아이디 <span>*</span></p>
                               <input type="text" name="sellerId">
                           </div>
                           <div class="checkout__input">
                               <p>비밀번호 <span>*</span></p>
                               <input type="password" name="passwd">
                           </div>
                           <div align="right">
	                           <button type="submit" class="site-btn">SIGN IN</button>
                           </div>
                       </div>
                   </div>
               </div>
            </form>
        </div>
   	</section>
</body>
</html>
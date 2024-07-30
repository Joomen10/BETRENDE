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
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                            <c:choose>
	                    		<c:when test="${sessionScope.memberId ne null || sessionScope.sellerId ne null}">
			                        <div class="">
			                            <a href="${contextPath }/member/logout">logout</a>
			                        </div>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<div class="">
			                            <a href="${contextPath }/selectuserLogin">Login</a>
			                            <a href="${contextPath }/selectuserRegister">Register</a>
			                        </div>
	                    		</c:otherwise>
                    		</c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${contextPath }/"><img src="${contextPath }/resources/bootstrap/img/betrendeLogo.png" alt="" width=200px; height=50px;></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="${contextPath }/">Home</a></li>
                            <li><a href="${contextPath }/product/productList?category=all&gender=all">Shop</a></li>
                            <c:choose>
                        		<c:when test="${sessionScope.role eq 'admin'}">
		                             <li><a href="#"><span class="icon_menu"></span> Management</a>
		                                <ul class="dropdown">
	                        			 <li><a href="${contextPath }/admin/goods/adminGoodsList">Goods Management</a></li>
	                        			 <li><a href="${contextPath }/admin/member/adminMemberList">User Management</a></li>
	                        			 <li><a href="${contextPath }/admin/order/adminOrderList">Order Management</a></li>
	                        			 <li><a href="${contextPath }/admin/contact/contactList">Contact Management</a></li>
		                                </ul>
		                             </li>
                        		</c:when>
                        		<c:when test="${sessionScope.role eq 'seller'}">
		                             <li><a href="#"><span class="icon_menu"></span> Management</a>
		                                <ul class="dropdown">
			                                <li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"> My Info</a></li>
		                        			<li><a href="${contextPath }/seller/product/sellerProductList?sellerId=${sessionScope.sellerId}">Product Management</a></li>
		                        			<li><a href="${contextPath }/admin/order/adminOrderList">Order Management</a></li>
		                                </ul>
		                             </li>
                        		</c:when>
                        		<c:otherwise>
		                             <li><a href="#"><span class="icon_menu"></span> My Pages</a>
		                                <ul class="dropdown">
			                             <li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"><span class="icon_info"></span> My Info</a></li>
			                             <li><a href="${contextPath }/myPage/myCartList"><span class="icon_cart"></span> My Cart</a></li>
			                             <li><a href="${contextPath }/myPage/myOrderList"><span class="icon_chat_alt"></span> My Order</a></li>
		                             	</ul>
		                             </li>
				                     <li><a href="./contact.html">Contact</a></li>
                        		</c:otherwise>
                        	</c:choose>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a>
                        <a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a>
                        <a href="${contextPath }/myPage/myCartList"><img src="${contextPath }/resources/bootstrap/img/icon/cart.png" alt=""><span>
                        	<c:choose>
                                	<c:when test="${sessionScope.role == 'client'}">
		                                <div class="tip">${sessionScope.myCartCnt }</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="tip">0</div>
                                	</c:otherwise>
                        	</c:choose></span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function processToCart(productCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"productCd" : productCd , "cartProductQty" : $("#orderProductQty").val()},
				success : function(result) {
					
					if (result == "duple") {
						alert("이미 추가된 품목입니다.");
					}
					else {
						alert("장바구니에 추가되었습니다.");
					}
					
				}
			})
			
		} 
	}

	
</script>
</head>
<body>

	<!-- Shop Section Begin -->
	<section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="${contextPath }/product/searchProduct" method="get">
                                <input type="text" name="word" placeholder="Search...">
                                <input type="hidden" name="method" value="search">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li><a href="${contextPath }/product/productList?category=outer&gender=all">Outer</a></li>
                                                    <li><a href="${contextPath }/product/productList?category=top&gender=all">Top</a></li>
                                                    <li><a href="${contextPath }/product/productList?category=bottom&gender=all">Bottom</a></li>
                                                    <li><a href="${contextPath }/product/productList?category=accessories&gender=all">Accessories</a></li>
                                                    <li><a href="${contextPath }/product/productList?category=shoes&gender=all">Shoes</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">Gender</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                    <li><a href="${contextPath }/product/productList?category=all&gender=m">Menswear</a></li>
                                                    <li><a href="${contextPath }/product/productList?category=all&gender=w">Womenswear</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=0&max=50">$0.00 - $50.00</a></li>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=50&max=100">$50.00 - $100.00</a></li>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=100&max=150">$100.00 - $150.00</a></li>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=150&max=200">$150.00 - $200.00</a></li>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=200&max=250">$200.00 - $250.00</a></li>
                                                    <li><a href="${contextPath }/product/searchProduct?method=price&min=250&max=10000000">250.00+</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs">
                                                    <a href="${contextPath }/product/searchProduct?method=size&sizeXsYn=Y">
                                                    <input type="radio" id="sizeXsYn" name="sizeXsYn">
                                                    xs
                                                    </a>
                                                </label>
                                                <label for="s">
                                                	<a href="${contextPath }/product/searchProduct?method=size&sizeSYn=Y">
                                                    <input type="radio" id="sizeSYn" name="sizeSYn">
                                                    s
                                                    </a>
                                                </label>
                                                <label for="m">
                                                	<a href="${contextPath }/product/searchProduct?method=size&sizeMYn=Y">
                                                    <input type="radio" id="sizeMYn" name="sizeMYn">
                                                    m
                                                    </a>
                                                </label>
                                                <label for="l">
                                                	<a href="${contextPath }/product/searchProduct?method=size&sizeLYn=Y">
                                                    <input type="radio" id="sizeLYn" name="sizeLYn">
                                                    l
                                                    </a>
                                                </label>
                                                <label for="xl">
                                                	<a href="${contextPath }/product/searchProduct?method=size&sizeXlYn=Y">
                                                    <input type="radio" id="sizeXlYn" name="sizeXlYn">
                                                    xl
                                                    </a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div>
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=blue" style="text-color:black">
			                                    	<input type="radio" name="color" value="blue" style="text-color:black"> 
			                                    	Blue 
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=green">
			                                    	<input type="radio" name="color" value="green"> 
			                                    	Green 
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=yellow">
			                                    	<input type="radio" name="color" value="yellow"> 
			                                    	Yellow
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=brown">
			                                    	<input type="radio" name="color" value="brown"> 
			                                    	Brown
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=orange">
			                                    	<input type="radio" name="color" value="orange"> 
			                                    	Orange
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=pink">
			                                    	<input type="radio" name="color" value="pink"> 
			                                    	Pink 
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=purple">
			                                    	<input type="radio" name="color" value="purple"> 
			                                    	Purple
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=white">
			                                    	<input type="radio" name="color" value="white"> 
			                                    	White
			                                    	</a>
			                                    </label>&nbsp;
			                                    <label>
			                                    	<a href="${contextPath }/product/searchProduct?method=color&color=black">
			                                    	<input type="radio" name="color" value="black"> 
			                                    	Black 
			                                    	</a>
			                                    </label>&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Showing 1–6 of "${productTotal }" results</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <select onchange="if(this.value) location.href=(this.value);">
                                    	<option value="${contextPath }/product/searchProduct?method=sort&sort=new">
                                       		Sort
                                        </option>
                                    	<option value="${contextPath }/product/searchProduct?method=sort&sort=new">
                                       		Latest arrivals
                                        </option>
                                        <option value="${contextPath }/product/searchProduct?method=sort&sort=view">
                                       		Most Viewed
                                        </option>
                                        <option value="${contextPath }/product/searchProduct?method=sort&sort=popular">
                                       		Popular
                                        </option>
                                        <option value="${contextPath }/product/searchProduct?method=sort&sort=low">
                                       		Price: Low To High
                                        </option>
                                        <option value="${contextPath }/product/searchProduct?method=sort&sort=high">
                                       		Price: High To Low
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<c:choose>
                    		<c:when test="${empty productList}">
	                            <div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
		                    	<c:forEach var="productDTO" items="${productList }">
			                        <div class="col-lg-4 col-md-6 col-sm-6">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName1}">
			                                    <ul class="product__hover">
			                                        <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a></li>
			                                        <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/compare.png" alt=""> <span>Compare</span></a>
			                                        </li>
			                                        <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a></li>
			                                    </ul>
			                                </div>
			                                <div class="product__item__text">
			                                	<div>${productDTO.brand }</div>
			                                    <div><a href="${contextPath }/product/productDetail?productCd=${productDTO.productCd}">${productDTO.productNm }</a></div>
					                            <div class="product__price">$<span>${productDTO.price - productDTO.price * productDTO.discountRate / 100}</span> <span style="text-decoration: line-through; color: gray">$${productDTO.price }</span></div>
					                            <div><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width=15px; height=17px; alt=""> : ${productDTO.views }&nbsp;
					                            <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width=15px; height=15px; alt=""> : ${productDTO.likes }</div>
			                                    <div class="rating">
			                                        <i class="fa fa-star-o"></i>
			                                        <i class="fa fa-star-o"></i>
			                                        <i class="fa fa-star-o"></i>
			                                        <i class="fa fa-star-o"></i>
			                                        <i class="fa fa-star-o"></i>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
		                     	</c:forEach>
                   			</c:otherwise>
                   		</c:choose>
					</div>
					<div class="row" style="text-align:center">
                        <div class="col-lg-12" style="text-align:center">
                            <div class="product__pagination" style="text-align:center">
                                <ul class="btn-group pagination" style="text-align:center">
								    <c:if test="${pageMaker.prev }">
								    <li>
								        <a href='<c:url value="/product/productList?category=all&gender=all&page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
								    </li>
								    </c:if>
								    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								    <li>
								        <a href='<c:url value="/product/productList?category=all&gender=all&page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
								    </li>
								    </c:forEach>
								    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
								    <li>
								        <a href='<c:url value="/product/productList?category=all&gender=all&page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
								    </li>
								    </c:if>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

</body>
</html>
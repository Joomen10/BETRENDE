<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i></a>
                        <span>${productDTO.productNm }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
        <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName1 }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName2 }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName3 }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName4 }">
                                    </div>
                                </a>
                            </li> 
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName1 }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName2 }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName3 }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName4 }" alt="">
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${productDTO.productNm }</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3>$${productDTO.price - productDTO.price * productDTO.discountRate / 100}<span style="text-decoration: line-through; color: gray; font-size: 25px;">$${productDTO.price }</span></h3>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <c:choose>
                                    	<c:when test="${productDTO.sizeXsYn == 'Y'}">
		                                    <label class="active" for="xs">xs
                                        	<input type="radio" id="xs">
                                    		</label>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${productDTO.sizeSYn == 'Y'}">
		                                    <label class="active" for="s">s
                                        	<input type="radio" id="s">
                                    		</label>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${productDTO.sizeMYn == 'Y'}">
		                                    <label class="active" for="m">m
                                        	<input type="radio" id="m">
                                    		</label>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${productDTO.sizeLYn == 'Y'}">
		                                    <label class="active" for="l">l
                                        	<input type="radio" id="l">
                                    		</label>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${productDTO.sizeXlYn == 'Y'}">
		                                    <label class="active" for="xl">xl
                                        	<input type="radio" id="xl">
                                    		</label>
                                    	</c:when>
                                    </c:choose>
                                </div>
                                <div class="product__details__option__color">
                                    <span>Color:</span>
                                    <span style="font-size: 25px;">${productDTO.color }</span>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" id="orderProductQty" name="orderProductQty" value="1">
                                    </div>
                                </div>
                                <a href="javascript:processToCart(${productDTO.productCd });" class="primary-btn"><span class="icon_cart_alt"></span>  add to cart</a>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                            </div>
                            <div class="product__details__last__option">
                                <ul>
                                    <li><span>Categories:</span> ${productDTO.category}</li>
                                    <li><span>Gender:</span> ${productDTO.gender}</li>
                                    <li><span>Brand:</span> ${productDTO.brand}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                    Reviews(5)</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>${productDTO.info }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Reivews</h5>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->
    
        <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="relatedProduct" items="${relatedProductList }">
	                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${relatedProduct.productFileName1}">
	                            <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
	                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
	                                <li><a href="javascript:processToCart(${relatedGoods.goodsCd})"><span class="icon_cart_alt"></span></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${contextPath }/product/productDetail?productCd=${relatedProduct.productCd}">${relatedProduct.productNm }</a></h6>
		                        <h6><a href="javascript:processToCart(${productDTO.productCd });" class="add-cart"><span class="icon_cart_alt"></span>+ Add To Cart</a></h6>
	                            <div class="rating">
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                            </div>
	                            <h6>$${relatedProduct.price - relatedProduct.price * relatedProduct.discountRate / 100} <span style="text-decoration: line-through; color: gray; font-size: 13px;">$${relatedProduct.price }</span></h6>
	                        </div>
	                    </div>
	                </div>
	        	</c:forEach>
	    	</div>
        </div>
    </section>
    <!-- Related Section End -->


</body>
</html>
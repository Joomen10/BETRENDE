<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>
	
	function sellerProductRemove(productCd) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/seller/product/sellerProductRemove?productCd=" + productCd;
		}
	}
	
	/* function gerateGoodsExcelExport() {
		location.href = "${contextPath}/admin/goods/goodsExcelExport";
	} */ 

</script>
</head>
<body>
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Seller</a>
                        <span>Product List</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End --> 
    
    
    <!-- Shop Cart Section Begin -->
	<section class="shopping-cart spad">
        <div class="container">
	        <div align="right">
				<button type="button" onclick="javascript:location.href='${contextPath}/seller/product/sellerProductAdd'" class="site-btn"><span class="icon_plus"></span> Add Product</button>
			</div>
			<br>
            <div class="row">	
                <div class="col-lg-12">
	            	<!-- <div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateGoodsExcelExport();"><span class="icon_folder_download"></span>Excel</a>
					</div> -->
                    <div class="shopping__cart__table">
                        <table>
                            <thead style="text-align:center">
                                <tr>
                                    <th width="10%">코드</th>
                                    <th width="60%">상품정보</th>
                                    <th width="10%">stock</th>
                                    <th width="10%">등록날짜</th>
                                    <th width="10%">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            		<c:when test="${empty productList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>조회된 상품이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="productDTO" items="${productList }" varStatus="i">
		                            		 <tr>
		                            		 	<td class="product__cart__item" align="center">
		                            		 		<h6>${productDTO.productCd }</h6>
			                                    </td>
                                    			<td class="product__cart__item">
                                    				<div class="product__cart__item__pic">
			                                        	<img src="${contextPath }/thumbnails?productFileName1=${productDTO.productFileName1 }" width="100" height="100">
			                                        </div>
			                                        <div class="product__cart__item__text">
			                                            <h4><a href="${contextPath }/product/productDetail?productCd=${productDTO.productCd}">${productDTO.productNm }</a></h4>
			                                            <h5>$ ${productDTO.price }</h5>
			                                            <h6><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width="15px" height="15px"> VIEWS: ${productDTO.views }&emsp; <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width="13px" height="13px"> LIKES: ${productDTO.likes }</h6>
			                                        </div>
			                                    </td>
			                                    <td class="product__cart__item" align="center">${productDTO.stock }</td>
			                                    <td class="product__cart__item" align="center"><fmt:formatDate value="${productDTO.updateDt }" pattern="yyyy-MM-dd"/> </td>
			                                	<td class="product__cart__item" align="center">
			                                		<a href="${contextPath }/seller/product/sellerProductModify?productCd=${productDTO.productCd}"><span class="icon_pencil-edit"></span></a>
			                                		<a href="javascript:sellerProductRemove(${productDTO.productCd });"><span class="icon_trash_alt"></span></a>
			                                	</td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>
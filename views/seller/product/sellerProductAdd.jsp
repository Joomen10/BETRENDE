<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	 $().ready(function() {

		$("form").submit(function(){
			
			if ($("#sizeXsYn").val() != "Y" || $("#sizeXsYn").val() != null) {
				$(this).val("N");
			}
			if ($("#sizeSYn").val() != "Y" || $("#sizeSYn").val() != null) {
				$(this).val("N")
			}
			if ($("#sizeMYn").val() != "Y" || $("#sizeMYn").val() != null) {
				$(this).val("N")
			}
			if ($("#sizeLYn").val() != "Y" || $("#sizeLYn").val() != null) {
				$(this).val("N")
			}
			if ($("#sizeXlYn").val() != "Y" || $("#sizeXlYn").val() != null) {
				$(this).val("N")
			}
		});
		
	});
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
                        <a href="${contextPath }//seller/product/sellerProductList">Product List</a>
                        <span>add Product</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
    <!-- Contact Section Begin -->
	<section class="checkout spad">
        <div class="container">
            <form action="${contextPath }/seller/product/sellerProductAdd" method="post" enctype="multipart/form-data" class="checkout__form" >
                <div class="row">
                    <div class="col-lg-8">
                        <h4>Add Product</h4>
                        <br>
                        <div class="row  blog__details__option">
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>Product Image1<span>*</span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="productFileName1">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>Product Image2<span></span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="productFileName2">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>Product Image3<span></span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="productFileName3">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>Product Image4<span></span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="productFileName4">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="productNm" placeholder="상품명을 입력하세요.">
                                </div>
                            </div>
                            <div>
                            	<input type="hidden" name="sellerId" value="${sessionScope.sellerId }"/>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__input">
                                    <p>가격 <span>*</span></p>
                                    <input type="text" name="price" placeholder="가격을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__input">
                                    <p>할인률 <span>*</span></p>
                                    <input type="text" name="discountRate" placeholder="할인률을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__input">
                                    <p>재고 <span>*</span></p>
                                    <input type="text" name="stock" placeholder="재고를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__input">
                                    <p>Brand <span>*</span></p>
                                    <input type="text" name="brand" placeholder="브랜드를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__input">
                                    <p>Category <span>*</span></p>
                                    <select name="category">
                                    	<option value="outer">outer</option>
                                    	<option value="top">top</option>
                                    	<option value="bottom">bottom</option>
                                    	<option value="accessories">accessories</option>
                                    	<option value="shoes">shoes</option>
                                    </select>
                                    <br>
                                </div>
                                <br>
                                <br>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div>
                                    <p>성별 <span style="color:red;">*</span></p>
                                    남 &nbsp;<input type="radio" name="gender" value="m"> &emsp;
                                    여 &nbsp;<input type="radio" name="gender" value="f">
                               </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 product__details__option">
                               <div class="">
                                    <p>Color <span style="color:red;">*</span></p>
                                    <label><input type="radio" name="color" value="blue"> blue </label>&nbsp;
                                    <label><input type="radio" name="color" value="green"> green </label>&nbsp;
                                    <label><input type="radio" name="color" value="red"> red </label>&nbsp;
                                    <label><input type="radio" name="color" value="yellow"> yellow </label>&nbsp;
                                    <label><input type="radio" name="color" value="brown"> brown </label>&nbsp;
                                    <label><input type="radio" name="color" value="orange"> orange </label>&nbsp;
                                    <label><input type="radio" name="color" value="pink"> pink </label>&nbsp;
                                    <label><input type="radio" name="color" value="purple"> purple </label>&nbsp;
                                    <label><input type="radio" name="color" value="white"> white</label>&nbsp;
                                    <label><input type="radio" name="color" value="black"> black </label>&nbsp;
                               </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                            	<div>
                            		<p>Size <span style="color:red;">*</span></p>
								        <label><input type="checkbox" id="sizeXsYn" name="sizeXsYn" value="Y"> XS </label>&nbsp;    
								        <label><input type="checkbox" id="sizeSYn" name="sizeSYn" value="Y"> S </label>&nbsp;  
								        <label><input type="checkbox" id="sizeMYn" name="sizeMYn" value="Y"> M </label>&nbsp;
								        <label><input type="checkbox" id="sizeLYn" name="sizeLYn" value="Y"> L </label>&nbsp;
								        <label><input type="checkbox" id="sizeXlYn" name="sizeXlYn" value="Y"> XL </label>&nbsp;
								</div>
							</div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>Product Info<span>*</span></p>
                                    <textarea rows="5" cols="100" name="info" placeholder="상품소개를 입력하세요."></textarea> 
                                	<script>CKEDITOR.replace("info");</script>
                                </div>
                            </div>
                        </div>
                    </div>
            	</div>
            	<div align="right">
                	<button type="submit" class="site-btn"><span class="icon_plus"></span>Add Product</button>
                </div>
        	</form>
    	</div>
	</section>
	<!-- Contact Section End -->
</body>
</html>
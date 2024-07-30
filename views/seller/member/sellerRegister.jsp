<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	 $().ready(function() {
	
		/*$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
		       success : function (data){
		          if (data == "duplicate"){
					  alert("사용할 수 있는 ID입니다.");
		          }
		          else {
		          	  alert("사용할 수 없는 ID입니다.");
		          }
		       }
		    });
		    
		 }); */	
		
		
		$("form").submit(function(){
			
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			
			if ($("#passwd").val() != $("#confirmPasswd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			
			$("[name='brand']").val($("#brand1").val() +" " + $("#brand2").val() +" " + $("#brand3").val());
			$("[name='hp']").val($("#hp1").val() +"-" + $("#hp2").val() +"-" + $("#hp3").val());
			
			
		});
		
	});
</script>
</head>
<body>
	<section class="checkout spad">
		<div class="container">
            <form action="${contextPath }/seller/member/sellerRegister" method="post" enctype="multipart/form-data" class="checkout__form" >
                <div class="row">
                    <div class="col-lg-8">
                        <h5>Seller SIGN UP</h5>
                        <br>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" id="sellerId" name="sellerId" style="width: 60%;" placeholder="아이디를 입력하세요.">
                                    <input type="button" id="btnOverlapped" value="중복확인"  style="width: 20%; padding-left: 0">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>비밀번호 <span>*</span></p>
                                    <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>비밀번호 확인 <span>*</span></p>
                                    <input type="password" id="confirmPasswd" placeholder="비밀번호를 확인하세요.">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" name="sellerNm" placeholder="이름을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>연락처 <span>*</span></p>
	                                    <input type="text" id="hp1" style="width: 10%;" required> - 
										<input type="text" id="hp2" style="width: 10%;" required> - 
										<input type="text" id="hp3" style="width: 10%;" required>
										<input type="hidden" name="hp">
                                </div>
                            </div>
                             <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" name="email" placeholder="이메일을 입력하세요.">
                                    <!-- <div class="checkout__input__checkbox">
	                                    <label for="emailstsYn">
	                                        BETRENDE에서 발송하는 E-mail을 수신합니다.
	                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
	                                        <span class="checkmark"></span>
	                                    </label>
                                    </div> -->
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>Zip / Postcode <span>*</span></p>
                                    <input type="text" id="zipcode" name="zipcode" style="width: 20%;">
                                    <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                </div>
                                <div class="checkout__input">
                                    <p>Address Line 1<span>*</span></p>
                                    <input type="text" id="addressLine1" name="addressLine1" placeholder="도로명주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>Address Line 2<span></span></p>
                                    <input type="text" id="addressLine2" name="addressLine2" placeholder="지번주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>City / Suburb <span>*</span></p>
                                    <input type="text" id="city" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>State <span>*</span></p>
                                    <input type="text" id="city" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>Seller Introduction for About Us Page<span>*</span></p>
                                    <textarea rows="5" cols="100" name="intro" placeholder="상품소개를 입력하세요."></textarea> 
                                	<script>CKEDITOR.replace("intro");</script>
                                </div>
                                <!-- <div class="checkout__input">
                                    <p>Product's brands y<span>*</span></p>
                                    <textarea rows="3" cols="100" name="brand" placeholder="상품소개를 입력하세요."></textarea> 
                                	<script>CKEDITOR.replace("intro");</script>
                                </div> -->
                                <div class="checkout__input">
                                	<p>3 brands mostly sell<span>*</span></p>
                                	<input type="text" id="brand1" style="width: 20%;" required>
									<input type="text" id="brand2" style="width: 20%;" required>
									<input type="text" id="brand3" style="width: 20%;" required>
									<input type="hidden" name="brand">
								</div>
								
								<div class="checkout__form__input">
                                    <p>셀러 로고이미지<span>*</span><span class="icon_upload"></span></p>
                                    <input type="file" name="sellerFileName">
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
	                    		<div align="right">
		                        	<button type="submit" class="site-btn"><span class="icon_plus"></span> SIGN UP</button>
		                        </div>
                </form>
            </div>
		</section>
</body>
</html>
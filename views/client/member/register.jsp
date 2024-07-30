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
	
	 	$("#btnOverlapped").click(function(){
			
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
		    
	 	}); 	
		
		
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
			
			$("[name='hp']").val($("#hp1").val() +"-" + $("#hp2").val() +"-" + $("#hp3").val());
			
			
		});
		
	});
</script>
</head>
<body>
	<section class="checkout spad">
		<div class="container">
            <form action="${contextPath }/member/register" method="post" class="checkout__form" >
                <div class="row">
                    <div class="col-lg-8">
                        <h5>User SIGN UP</h5>
                        <br>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" id="memberId" name="memberId" style="width: 60%;" placeholder="아이디를 입력하세요.">
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
                                    <input type="text" name="memberNm" placeholder="이름을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div>
                                    <p>성별 <span style="color:red;">*</span></p>
                                    남 &nbsp;<input type="radio" name="sex" value="m"> &emsp;
                                    여 &nbsp;<input type="radio" name="sex" value="f">
                               </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="">
                                    <p>생년월일 <span>*</span></p>
                                    <select id="birthY">
                                    	<c:forEach var="i" begin="0" end="2023" >
                                    		<option>${2023 - i}</option>
                                    	</c:forEach>
                                    </select>년 
                                    <select id="birthM">
                                    	<c:forEach var="i" begin="1" end="12" >
                                    		<c:choose>
	                                    		<c:when test="${i < 10 }">
		                                    		<option>0${i}</option>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<option>${i}</option>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:forEach>
                                    </select>월
                                    <select id="birthD">
                                    	<c:forEach var="i" begin="1" end="31" >
                                    		<c:choose>
	                                    		<c:when test="${i < 10 }">
		                                    		<option>0${i}</option>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<option>${i}</option>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:forEach>
                                    </select>일	
                                    <input type="hidden" name="dateBirth"/>
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
                                    <div class="checkout__input__checkbox">
	                                    <label for="smsstsYn">
	                                        BETRENDE에서 발송하는 SMS를 수신합니다.
	                                        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
	                                        <span class="checkmark"></span>
	                                    </label>
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" name="email" placeholder="이메일을 입력하세요.">
                                    <div class="checkout__input__checkbox">
	                                    <label for="emailstsYn">
	                                        BETRENDE에서 발송하는 E-mail을 수신합니다.
	                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
	                                        <span class="checkmark"></span>
	                                    </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>우편번호 <span>*</span></p>
                                    <input type="text" id="zipcode" name="zipcode" style="width: 20%;">
                                    <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                </div>
                                <div class="checkout__input">
                                    <p>도로명 주소 <span>*</span></p>
                                    <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>지번 주소 <span>*</span></p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>나머지 주소 <span>*</span></p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                        	</div>
                    	</div>
                	</div>
                </div>
	            <div align="right">
	            	<button type="submit" class="site-btn"><span class="icon_plus"></span> 가입</button>
	            </div>
        	</form>
    	</div>
	</section>
</body>
</html>
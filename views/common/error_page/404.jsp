<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
</head>
<body>
	<div align="center">
		<h2>Page Not Found</h2>
		<img src="${contextPath }/resources/bootstrap/img/404.PNG" alt="404에러 이미지">
		<h4>페이지를 찾을 수 없습니다.</h4>
	</div>
</body>
</html>
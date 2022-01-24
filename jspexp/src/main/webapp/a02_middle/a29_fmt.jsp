<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.6.0.js"></script>
<script type="text/javascript">
<%--
 #fmt 유형 jstl 태크
 1. 데이터 유형을 변경하거나, 원하는 데이터를 처리할 때 , 주로 활용된다
 2. 공통 설정 변경
 	String path = request.getContextPath();
 	==> <c:set var="path" value="${pageContext.request.contextPath}"/>
 	request.setCharacterEncoding("utf-8")
 	==> <fmt:requestEncoding value="UTF-8" /> 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<%
	request.setAttribute("now", new Date()); //java.util.Date
	request.setAttribute("num01", 99999.75); //숫자 데이터
%>
<body>
	<h3>날짜처리</h3>
	<h4>기본출력:${now }</h4>
	<table>
		<tr><th>날짜 full형식</th><td><fmt:formatDate type="date" dateStyle="full" value="${now}"/></td></tr>
	</table>
</body>
</html>
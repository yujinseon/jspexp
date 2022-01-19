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
 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>request 객체</h3>
	<table>
		<tr><th>getRemoteAddr()</th><td><%=request.getRemoteAddr() %></td></tr>
		<tr><th>getMethod()</th><td><%=request.getMethod() %></td></tr>
		<tr><th>RequestURI()</th><td><%=request.getRequestURI() %></td></tr>
		<tr><th>**getContextPath()</th><td><%=request.getContextPath() %></td></tr>
		<%--
		request.getContextPath() : 서버의 절대주소를 지정할 때, 주로 사용된다.
		 --%>
		<tr><th>getServerName()</th><td><%=request.getServerName() %></td></tr>
		<tr><th>getServerPort()</th><td><%=request.getServerPort() %></td></tr>
		<%--
		외부에서 접속해서 현재 자원에 대한 정보들을 log로 남겨서 특정자원에 대한 트래픽 정도를 확인할 때,
		주로 사용된다.
		 --%>
	</table>
</body>
</html>
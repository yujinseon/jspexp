<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a04_member.*"
    %>
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
		$("#logoutBtn").click(function(){
			if(confirm("로그아웃하시겠습니까?")){
				location.href="login.jsp";
			}
		});
	});
	function goMypage(){
		if(confirm("회원정보화면으로\n이동하시겠습니까?")){
			location.href="mypage.jsp";
		}
	}
</script>
</head>
<body>
	<% 
	member_vo m =(member_vo)session.getAttribute("mem");
	%>
	<%if(m!=null){ %>
		<h3 align="right" onclick="goMypage()"><%=m.getName() %>님 로그인 중</h3>
		<h4 align="right">point:<%=m.getPoint() %></h4>
		<p align="right"><input type="button" id="logoutBtn" value="로그아웃"/></p>
	<%}else{%>
		<script type="text/javascript">
			alert("로그인 하셔야 합니다!");
			location.href="login.jsp";
		</script>
	<%}%>

</body>
</html>
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
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>사원정보(MVC)</h3>
	<form method="post">
		<table>
			<tr><th>사원번호</th><td><input type="text" name = "ename" value="${param.ename}"></td></tr>
			<tr><th>직책명</th><td><input type="text" name = "ename" value="${param.job}"></td></tr>
			<tr><td colspan="2"><input type="submit" value="조희"></td></tr>
		</table>
	</form>
		<table>
			<tr><th>사원번호</th><th>사원명</th><th>직책명</th><th>입사일</th>
			<th>급여</th><th>보너스</th><th>부서번호</th></tr>
			<c:forEach var="emp" items="${emplist}"><%--controller에서 온 emplist --%>
			<tr><td>${emp.empno}</td>
				<td>${emp.ename}</td>
				<td>${emp.job}</td>
				<td>${emp.hiredate}</td>
				<td>${emp.sal}</td>
				<td>${emp.comm}</td>
				<td>${emp.deptno}</td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>
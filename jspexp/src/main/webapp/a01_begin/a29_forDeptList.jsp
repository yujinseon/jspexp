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
	<h3>dept리스트</h3>
	<jsp:useBean id="deptlist" class="jspexp.a03_database.A01_Dao"/>
	<form>
		<table>
			<tr><th>지역</th><td><input type="text" name = "loc" value="${param.loc}"></td></tr>
			<tr><td colspan="2"><input type="submit" value="조희"></td></tr>
		</table>
	</form>
	
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
		<c:forEach var="dept" items="${deptlist.deptList(param.loc)}">
		<tr><td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td></tr>
		</c:forEach>
	</table>
</body>
</html>
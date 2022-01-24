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
 # jstl을 통한 객체의 property 값 변경..
 1. 객체의 호출 
 	request.setAttribute("p01", new Person("홍길동",25,"서울신림"));
 	${p01.name} 
 2. jstl을 통해서 필드값의 변경
 <c:set var="p02" value="${p01}" scope="session" /> 
 	Person p02 = p01; session.setAttribute("p02",p01);
 	1) property를 통해서 변경..
 	<c:set target="p02" property="name" value="마길동" />
 	==>	p02.setName("마길동");
 	${p02.name} : 기존에 홍길동에서 마길동으로 변경되어 해당 property를 확인 할 수 있다
 	 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<% 
	request.setAttribute("p01", new Person("홍길동",25,"서울 신림동"));
	
	%>
	<h3>jstl을 통한 객체의 변경..</h3>
	<table>
		<tr><th>이름</th><td>${p01.name}</td></tr>
		<tr><th>나이</th><td>${p01.age}</td></tr>
		<tr><th>사는곳</th><td>${p01.loc}</td></tr>
	</table>
	<c:set var="p02" value="${p01}" scope="session"/>
	<c:set target="${p02}" property="name" value="마길동"/>
	<table>
		<tr><th>이름</th><td>${p02.name}</td></tr>
		<tr><th>나이</th><td>${p02.age}</td></tr>
		<tr><th>사는곳</th><td>${p02.loc}</td></tr>
	</table>
	<%-- Product객체로 prod01 선언하여 사과, 3000,2 할당하고,
		 prod02로 물건명 가격 갯수를 다 바꾸어 출력하세요 --%>
	<%
		request.setAttribute("prod01", new Product("사과",3000,2));
	%>
	<c:set var = "prod02" value="${prod01}" scope="session"/>
	<c:set target="${prod02}" property="name" value="복숭아"/>
	<c:set target="${prod02}" property="price" value="5000"/>
	<c:set target="${prod02}" property="cnt" value="3"/>
	<table>
		<tr><th>물건명</th><td>${prod02.name}</td></tr>
		<tr><th>가격</th><td>${prod02.price}</td></tr>
		<tr><th>갯수</th><td>${prod02.cnt}</td></tr>
	</table>
</body>
</html>
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
 # useBean 활용하기
 1. jsp에서 데이터 저장을 효율적으로 처리하기 위하여 사용되는 태그형 객체이다
 2. 구성을 위한 처리
 	1) VO객체 만들기
 	2) <jsp:useBean id="빈의이름" class="패키지명.vo클래스" scope="session 범위">
 		로 선언
 		: 선언하는 순간 클래스 참조변수 = new 객체명(); 형식으로 객체가 생성되어 jsp에 포함되게
 		처리 된다
 3. useBean의 기능
 	1) 객체가 session범위로 생성이 되어, jsp 페이지 안에서 사용할 수 있다
 	2) 태크형태로 기능메서드를 사용할 수도 있고, script(<%%>, <%=%>) 형태로도 사용할 수 있다.
 	3) el태그와 jstl에서도 활용할 수 있다
 	4) 요청값을 request.getParameter("") 호출 없이도 자동으로 처리할 수 있다 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>useBean 활용</h3>
	<jsp:useBean id="p01" class="jspexp.z01_vo.Person" scope="page"/>
	<%--
	page 범위로 객체 Person이 생성되어 참조변수 p01을 사용할 수 있게 된 상황
	
	1. setProperty 기능 메서드로 필드값 저장처리 하기
	 	property="기능메서드" : 기능메서드의 set/get을 빼고 소문자로 선언한
	 	void setName(String name) ==> name
	 	name : 위에 선언된 useBean의 id 값을 설정해준다
	 	value : 해당 setName() 메서드를 통해 저장될 데이터를 처리한다
	 --%>
	 <jsp:setProperty property="name" name="p01" value="홍길동"/>
	 <%
	 	p01.setAge(25); p01.setLoc("서울");
	 %>
	 <%-- p01.setName("홍길동")  과 동일--%>
	 <%-- 저장된 내용 가져오기 --%>
	<table>
		<tr><th>이름</th><td><jsp:getProperty property="name" name="p01"/></td></tr>
		<tr><th>나이</th><td><%=p01.getAge() %></td></tr>
		<tr><th>사는곳</th><td>${p01.loc}</td></tr>
			<%-- el 태그 : ${참조변수.프로퍼티명} 
				주의) 프로퍼티는 절대 필드를 호출하는 것이 아니다
				프로퍼티(property)는 메서드의 setXXX()/getXXX()의 메서드명에서 set/get를 삭제하고
					소문자로 변환하여 사용되는 개념이다
			
			--%>
			
			<%-- p01.getName() 과 동일 --%>
	</table>
	<jsp:useBean id="p02" class="jspexp.z01_vo.Product" scope="session"/>
	<jsp:setProperty property="name" name="p02" value="사과"/>
	<jsp:setProperty property="price" name="p02" value="3000"/>
	<jsp:setProperty property="cnt" name="p02" value="2"/>
	
	<h3>product </h3>
	<table>
		<tr><th>이름</th><td><jsp:getProperty property="name" name="p02"/></td></tr>
		<tr><th>가격</th><td><jsp:getProperty property="price" name="p02"/></td></tr>
		<tr><th>갯수</th><td><jsp:getProperty property="cnt" name="p02"/></td></tr>
			<%-- p02.getName() 과 동일 --%>
	</table>
	<h3 onclick="location.href='a20_useBeanScope.jsp'"> useBeanScope 영향 범위 확인</h3>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%-- <%@ include file="" %> 포함해서 함께 컴파일시킬 jsp/html 페이지. --%>
<%--
# directive의 종류
1. <%@ page : 페이지 directive
	contentType="text/html; charset=UTF-8"
	현재 jsp의 실행결과 형태를 나타낸다. 이것을 이용해서 excel/pdf, 파일다운로드 처리
	import : 사용하게될 객체..
	session : 세션설정 default true
	isErrorPage : 에러페이지인지 여부
	errorPage : 에러 페이지 지정.
	
2. <%@ taglib : 태그라이브러리 directive
3. <%@ include : 인클루드 directive

%>
  
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
# jsp페이지의 구성요소
1. 디렉티브(directive)
2. 스크립트 : scriptlet, expression, declaration
			<% %>      <%= %> 	   <%! %>
3. 표현언어(expression language) ${변수명}
4. 기본 객체(implicit object)
	protected void service(HttpServletRequest request, HttpServletResponse response)
	jsp의 경우 변환될 서블릿 자바에서 위 내용을 감싸기에 가능하다.
	request, response, out,			 
5. 정적 데이터 : 변수, 객체 등 스트립트에서 사용되는 데이터
6. 표준 액션 태그(action tag) : <jsp:include, <jsp:useBean>
7. 컴스텀 태그 : <c:set  <c:if <c:forEach
--%>
// ex) 선언부 연습 예제
//     1.  물건가격과 갯수를 받아서 총계를 처리하는 기능 메서드를
//         선언부에 선언하고, 하단에서 호출하여 출력하세요.
//    ex) 2조는 진행된 내용 개별적으로 개인톡으로 제출, 나머지조는 조장님이 손들어주세요.
<%!
   int num01;
   public int productTotal(int price, int num) {
      int total = price * num;
      return total;
   }
   class Person{
	   String name;
	   Person(String name){
	   	  this.name = name;
       }
   	   String getName(){
   		   return name+"님!!";
   	   }
   }
%>
	$(document).ready(function(){});
</script>
</head>
<body>
	<%
		num01 = 30; //  declare부분 호출
		Person p01 = new Person("홍길동");
	%>
	<h3>제목</h3>
	<table>
		<tr><th>함수호출</th><td><%=productTotal(3000,2) %></td></tr>
		<tr><th>변수호출</th><td><%=num01 %></td></tr>
		<tr><th>객체함수호출</th><td><%=p01.getName()%></td></tr>
	</table>
</body>
</html>
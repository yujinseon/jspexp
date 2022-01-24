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
	<%
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String status = "";
	if(id!=null){
		status = "login";
		member_dao dao = new member_dao();
		member_vo m = dao.login(id, pass);
		if(m!=null){
			status = "success";
			session.setAttribute("mem",m);
		}else{
			status = "fail";
		}
	}
	
	%>

	$(document).ready(function(){
		var status = "<%=status %>";
		if(status=="success"){
			alert("로그인 성공");
			location.href="main.jsp";
		}
		if(status=="fail"){
			alert("로그인 실패\n다시 로그인 하세요!")
			$("[name=id]").focus();
		}
		$('#btn_login').click(function(){
			var id = $('[name=id]').val();
			var pass = $('[name=pass]').val();
			if(id!=""&&pass!=""){
				$('form').submit();
			}else{
				alert("아이디나 패스워드를 입력하세요");
			}
			
		});
	});
</script>
</head>
<body>
	<h3>로그인</h3>
	<form method="post" name="loginInfo">
			<fieldset >
					<table>
				   	  <tr><th>ID</th><td><input type="text"  name="id" style="width: 40%;"/></td></tr>
				   	  <tr><th>PASSWORD</th><td><input type="password" name="pass" style="width: 40%;"/></td></tr>
				      
				      <tr><td colspan="2"><input type="submit" value="로그인" id="btn_login" /></td></tr>
					  <tr><td colspan="2" onclick="location.href='join.jsp'">회원가입</td></tr>
					</table>
			</fieldset>
		</form>
</body>
</html>
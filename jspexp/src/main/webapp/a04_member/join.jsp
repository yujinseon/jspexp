<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"
	import="jspexp.a04_member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style>
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
<%--
 
 
--%>
	//
	$(document).ready(function() {
				$('#btn_join').click(
						function() {
							if ($("[name=id]").val() == "") {
								alert("아이디 입력해주세요");
								$("[name=id]").focus();
								return;
							}
							if ($("[name=pass]").val() == "") {
								alert("패스워드를 입력해주세요");
								$("[name=pass]").focus();
								return;
							}
							if ($("[name=pass2]").val() == "") {
								alert("패스워드확인을 입력해주세요");
								$("[name=pass2]").focus();
								return;
							}
							if ($("[name=pass]").val() != $("[name=pass2]")
									.val()) {
								alert("패스워드가 서로 다릅니다");
								return;
							}
							if ($("[name=point]").val() == ""
									|| isNaN($("[name=point]").val())) {
								alert("포인트는 숫자형으로 입력하여야 합니다");
								$("[name=point]").val("");
								$("[name=point]").focus();
								return;
							}
							if($("#ckId").val()!="Y"){
								alert("회원 아이디 등록 여부를 check하셔야 합니다!");
								return;
							}
							if (confirm("등록하시겠습니까?")) {
								$("form").submit();
							}

						});
					$("#ckIdBtn").click(function(){
						// ajax 처리통해서 check해서 지금 등록된 id가 아닐 때.
						// 2. 페이지와 요청값 설정
						$.ajax({
							url:"${path}/checkId.do",
							data:"id="+$("[name=id]").val(),
							success:function(data){
								if(data==0){
									$("#ckId").val("Y");
									alert
								}
								
							}
						});
					});
			});
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post">
		<fieldset>
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" />
					<input type="button" id="ckIdBtn" value="등록여부"/></td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<th>PASSWORD확인</th>
					<td><input type="password" name="pass2" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<th>권한</th>
					<td><select name="auth">
							<option>관리자</option>
							<option>일반방문자</option>
							<option>방문자</option>
					</select></td>
				</tr>
				<tr>
					<th>포인트</th>
					<td><input type="text" name="point" /></td>
				</tr>

				<tr>
					<td colspan="2"><input type="button" value="등록" id="btn_join" /></td>
				</tr>

			</table>
		</fieldset>
	</form>
</body>

<%
	String id= request.getParameter("id"); 
	String pass= request.getParameter("pass"); 
	String name= request.getParameter("name"); 
	String auth= request.getParameter("auth"); 
	String pointS= request.getParameter("point");
	if(id!=null){
		member_vo ins = new member_vo(id, pass, name, auth, Integer.parseInt(pointS) );
		member_dao dao = new member_dao();
		dao.insertMember(ins);
%>
	<script type="text/javascript">
		alert("등록 성공!");
		location.href="login.jsp";
	</script>
<%		
	}

%>
</html>
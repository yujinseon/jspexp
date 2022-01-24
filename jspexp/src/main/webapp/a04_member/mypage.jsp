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
<%
member_vo m =(member_vo)session.getAttribute("mem");
if(m==null){ //로그인된 session이 없으면 로그인페이지로 이동 처리하게 처리한다
%>
 <script type="text/javascript">
 	alert("로그인이 필요합니다");
 	location.href="login.jsp";
 </script>
<% 
}
	String proc = request.getParameter("proc"); 
	String id= request.getParameter("id"); 
	String pass= request.getParameter("pass"); 
	String name= request.getParameter("name"); 
	String auth= request.getParameter("auth"); 
	String pointS= request.getParameter("point");
	if(proc!=null){
		member_dao dao = new member_dao();
		if(proc.equals("upt")){
			member_vo upt = new member_vo(id, pass, name, auth, Integer.parseInt(pointS) );
			dao.updateMember(upt);
			//수정후 변경된 정보를 session 다시 넣어서 사용할 수 있게 처리
			session.setAttribute("mem", dao.getMember(id));
		}
		if(proc.equals("del")){
			dao.deleteMember(id);
			//session.setAttribute("mem","");
			//response.sendRedirect("login.jsp");
		}

	}

%>

<script type="text/javascript">
	
<%--
 
 
--%>
	//
	$(document).ready(function() {
		var proc = <%=proc%>;
		if(proc=="upt"){
			alert("수정이 완료되었습니다!");
		}
		if(proc=="del"){
			alert("삭제가 완료되었습니다!");
			loaction.href="login.jsp";
		}
		$('#uptBtn').click(function() {
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
			if (confirm("수정하시겠습니까?")) {
				$("[name=proc]").val("upt");
				$("form").submit();
			}

		});
		$("#delBtn").click(function(){
			if (confirm("삭제하시겠습니까?")) {
				$("[name=proc]").val("del");
				$("form").submit();
			}
		});
	});
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post">
		<input type="hidden" name="proc">
		<fieldset>
			<table>
		<tr><th>아이디</th><%-- 현재 id의 등록 여부를 확인 --%>
			<td><input type="text" name="id" value="${mem.id}"/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value="${mem.pass}"/></td></tr>
		<tr><th>패스워드확인</th><td><input type="password" name="pass2"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"  value="${mem.name}"/></td></tr>
		<tr><th>권한</th><td>
							<select name="auth">
								<option>관리자</option>
								<option>일반사용자</option>
								<option>방문자</option>
							</select>
							<script>$("[name=auth]").val("${mem.auth}")</script>
						</td></tr>
		<tr><th>포인트</th><td><input type="text" name="point"   value="${mem.point}"/></td></tr>
		<tr><td colspan="2">
				<input type="button" id="uptBtn" value="수정"/>
				<input type="button" id="delBtn" value="삭제"/>
			</td></tr>
	</table>
		</fieldset>
	</form>
</body>
</html>
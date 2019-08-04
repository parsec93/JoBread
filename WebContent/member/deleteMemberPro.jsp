<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String pass2 = request.getParameter("pass2");
	
	
	if(pass == pass2){%>
		<script type="text/javascript">
			alert("비밀번호 같음");
			history.back();
		</script>
	<%}else {
		MemberDAO mdao = new MemberDAO();
		int isPassRight = mdao.deletePassCheck(id, pass);
		
		if(isPassRight != 1 ){%>
			<script type="text/javascript">
				alert("비밀번호 틀림");
				history.back();
			</script>
		<% }else {%>
			<script type="text/javascript">
				alert("회원탈퇴 성공");
				location.href="../member/logout.jsp";
			</script>
		<% }
	}
	
%>
</body>
</html>
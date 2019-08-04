 <%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberBean"%>
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
//request  한글처리
request.setCharacterEncoding("utf-8");

//파라미터 id pass name email addressd phone mobile
String id = request.getParameter("id");
String pass = request.getParameter("pass");

String  name = request.getParameter("name");
String  email = request.getParameter("email");
int postcode = Integer.parseInt(request.getParameter("postcode"));
String address = request.getParameter("add1")+request.getParameter(" add2")+request.getParameter(" add3");
String add1 = request.getParameter("add1");
String add2 = request.getParameter("add2");
String add3 = request.getParameter("add3");
String mobile = request.getParameter("mobile");

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setPostcode(postcode);
mb.setAddress(address);
mb.setAdd1(add1);
mb.setAdd2(add2);
mb.setAdd3(add3);
mb.setMobile(mobile);


MemberDAO mdao = new MemberDAO();
//패키지 member 파일이름 MemberDAO
// MemberDAO mdao 객체 생성
int isUpdate = mdao.updateMember(mb);
//insertMember(mb) 
//login.jsp로 이동.
session.invalidate();
%>
<%if(isUpdate == 1){%>
	<script type="text/javascript">
		alert ("회원정보 수정완료");
		location.href = "login.jsp";
	</script>
<% } else {%>
	<script type="text/javascript">
		alert ("회원정보 수정실패");
		history.back();
	</script>
<%}%>

</body>
</html>
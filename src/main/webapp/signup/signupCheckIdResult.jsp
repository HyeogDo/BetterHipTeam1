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
		String result = session.getAttribute("RESULT_ID").toString();
		if (result.equals("Possible")) {
			%>사용 가능한 아이디 입니다!!<%
		} else {
			%>이미 사용 중인 아이디 입니다!!<%
		}
	%>
</body>
</html> 
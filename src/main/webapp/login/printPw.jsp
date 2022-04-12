<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>비밀번호 찾기</b><br>
	<button onclick="location.href='findId.jsp'">아이디 찾기</button> <button onclick="location.href='findPw.jsp'">비밀번호 찾기</button><br>
	${USER_NAME }님 
	비밀번호는 <b>${USER_PW }</b>입니다.
	<form action="loginForm.do">
		<input type="submit" value="로그인 페이지">
	</form>
</body>
</html>
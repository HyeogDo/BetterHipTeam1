<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function find() {

		var regExpName = /^[가-힣]*$/
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		
		var form = document.findPw

		
		// 이름 확인
		var user_name = form.user_name.value
		if(user_name == "") {
			alert("이름을 입력해주세요")
			return
		}else {
			if (!regExpName.test(user_name)) {
				alert("이름은 한글만 입력해주세요")
				form.user_name.select()
				return
			}
		}
		
		
		
		//이메일 확인
		var user_email = form.user_email.value
		if(user_email == "") {
			alert("이메일을 입력해주세요")
			return
		}else {
			if (!regExpEmail.test(user_email)) {
				alert("이메일 입력을 확인해 주세요")
				form.user_email.select()
				return
			}
		}
		
		
		document.findPw.submit();
	}
</script>
<body>
	<b>비밀번호 찾기</b><br>
	<button onclick="location.href='/BetterHip/login/findId.jsp'">아이디 찾기</button> <button onclick="location.href='/BetterHip/login/findPw.jsp'">비밀번호 찾기</button>
	<form action="findPw.do" name="findPw">
		<input type="text" name="user_id" placeholder="아이디를 입력해주세요"><br>
		<input type="text" name="user_name"  placeholder="이름을 입력하세요"><br>
		<input type="text" name="user_email" placeholder="이메일 주소를 입력하세요"><br>
		<input type="button" value="비밀번호 찾기" onclick="find()"><br>
	</form>
</body>
</html>
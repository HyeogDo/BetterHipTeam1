<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<% 
HttpSession session2 = request.getSession();
String USER_ID = (String) session2.getAttribute("USER_ID"); 
%>
<script type="text/javascript">

function adminCheck() {
	switch("<%=USER_ID%>"){
	case "fk1119":
		location.href="noticeDelete.do?notice_id=${noticeContent.notice_id }"
		break;
	default:
		alert("어드민 아님")
		break;
	}
}
function adminCheckUpdate() {
	switch("<%=USER_ID%>"){
	case "fk1119":
		document.updateForm.submit()
		break;
	default:
		alert("어드민 아님")
		break;
	}
}

</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>

<body>

	<h2>공지사항</h2>
	
	<table border="1">
		<form name="updateForm" action="noticeUpdateView.do" method="post">
			<tr>
				<td>번호</td>
				<td><input type="text" name="notice_id" value="${noticeContent.notice_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title" size="50" value="${noticeContent.notice_title }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="notice_content" rows="10" cols="50" readonly="readonly">${noticeContent.notice_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" onclick="adminCheckUpdate()" value="수정">&nbsp;&nbsp;&nbsp;
				<a href="noticeList.do">목록보기</a></td>
			</tr>
			<tr>
				<%-- <td><input type="button" value="삭제" onclick="del(${content_view.bId})"></td> --%>
				<td><input type="button" value="삭제" onclick="adminCheck()"></td>
			</tr>
	 	</form>
	</table>
</body>
</html>
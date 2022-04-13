<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
</head>
<script type="text/javascript">
<% 
HttpSession session2 = request.getSession();
String USER_ID = (String) session2.getAttribute("USER_ID"); 
%>

function adminCheck() {
	switch("<%=USER_ID%>"){
	case "fk1119":
		location.href="noticeFormView.do"
		break;
	default:
		alert("어드민 아님")
		break;
	}
}

</script>
<body>
	<h1 style="text-align: center;">공지사항</h1>
	<div style="text-align: center;">
	<table border="1">
		<tr>
			<th width="50">No.</th>
			<th width="200">제목</th>
			<th width="500">내용</th>
			<th width="150">작성일</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="noticeContent.do?notice_id=${dto.notice_id}">${dto.notice_id }</a></td>
				<td>${dto.notice_title }</td>
				<td>${dto.notice_content }</td>
				<td>${dto.notice_date }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5"><input type="button" onclick="adminCheck()" value="작성"></td>
		</tr>
		
	</table>
	
	
	
	</div>
</body>
</html>
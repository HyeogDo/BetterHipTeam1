<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String notice_id=request.getParameter("notice_id");
String notice_title=request.getParameter("notice_title");
String notice_content=request.getParameter("notice_content");



%>
<body>

	<h2>공지사항 수정</h2>
	
	<table border="1">
		<form action="noticeUpdate.do" method="post">
			<tr>
				<td>번호</td>
				<td><input type="text" name="notice_id" value="<%=notice_id %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title" size="50" value="<%=notice_title %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="notice_content" rows="10" cols="50"><%=notice_content %></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
				<a href="noticeList.do">목록보기</a></td>
			</tr>
	 	</form>
	</table>
</body>
</body>
</html>
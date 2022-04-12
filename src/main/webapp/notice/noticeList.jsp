<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
</head>
<body>
	<h1>공지사항</h1>
	<table border="1">
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="noticeContent.do?notice_id=${dto.notice_id}">${dto.notice_id }</a></td>
				<td>${dto.notice_id }</td>
				<td>${dto.notice_title }</td>
				<td>${dto.notice_content }</td>
				<td>${dto.notice_date }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5"><a href="../noticeForm.do">글작성</a></td>
		</tr>
		
	</table>
</body>
</html>
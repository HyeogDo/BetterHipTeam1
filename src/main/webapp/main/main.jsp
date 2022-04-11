<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
	<c:forEach items="${list}" var="dto" varStatus="status">
		<td><img src="data:cake_img/png;base64, ${dto.base64Image }"><br>
		${dto.cake_name}<br>
		${dto.cake_saleprice}
		</td>
		<c:if test="${status.index % 4 == 3 }">
	</tr>
		<tr>
		</c:if>
	</c:forEach>
	</table>

</body>
</html>
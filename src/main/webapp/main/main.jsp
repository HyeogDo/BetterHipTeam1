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
<<<<<<< HEAD
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
=======
성공111s
>>>>>>> b2565e729f625ea8e6413f521eb0a22113800e03
</body>
</html>
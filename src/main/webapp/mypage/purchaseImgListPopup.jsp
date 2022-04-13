<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부이미지 팝업</title>
</head>
<body>


	<c:choose>
		<c:when test="${Purchase_Img.purchase_img_base64Image eq 'NO IMAGE'}">
			<img src="./mypage/mypage_image/noimg.jpg" width = "100" height="100">
		</c:when>
		<c:otherwise>
			<img src="data:purchase_img/png;base64, ${Purchase_Img.purchase_img_base64Image }" width = "100" height="100">
		</c:otherwise>
	</c:choose>


</body>
</html>
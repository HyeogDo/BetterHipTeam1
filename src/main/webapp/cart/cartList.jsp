<%@page import="javax.swing.RepaintManager"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxConnection.CapabilitiesGetOrBuilder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function cartOrder() {
		document.list.action ="../BetterHip/paymentList.do"
		document.list.submit()
		
	}
	
	function cartDelete() {
		document.list.action="cartDelete.do"
		document.list.submit()
		
	
	}
	
	function previousBack() {
		document.list.action=history.back(-1)
		document.list.submit()
		
	
	}
</script>

<body>
	<div align="center"><h1>장바구니</h1></div>
    <div style="position: absolute; left: 20%; right: 20%">
		<c:choose>
	    <c:when test="${empty CartList}">
			<h2>Cart(0)</h2>
			 <hr align="center"  size="3">
	    </c:when>
	    <c:otherwise>
			<h2>담은상품</h2>
			 <hr align="center"  size="3"><br>
			 	
			 <hr align="center"  size="2"><br>
	    </c:otherwise>
		</c:choose>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div align="center">	
		<table>			
		
			<c:forEach var="item" items="${CartList}">
				<tr>
					<td><input type="checkbox" name="chk" value="${item.purchase_id}">
				    <td><img src="data:cake_img/png;base64, ${item.purchase_cake_img }" width="200" height="200"></td>
				    <td><h3><c:out value = "${item.purchase_cake_name }"/></h3><br>
				    	옵션 : ${item.purchase_custom_size}&nbsp;${item.purchase_custom_taste}&nbsp;${item.purchase_custom_cream_type}
						&nbsp;${item.purchase_custom_cream_color}
				   </td>
					
				</tr>
					
					    
			 </c:forEach>
		</table>
	
		<input type="button" onclick="cartOrder()" value="구매">
		<input type="button" onclick="cartDelete()" value="삭제">
		<input type="button" onclick="previousBack" value="이전페이지">
			
	</div>


</body>
</html>
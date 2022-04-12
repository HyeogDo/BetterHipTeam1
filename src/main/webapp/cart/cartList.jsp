
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

		document.list.action ="../BetterHip/cartOrder.do"
		document.list.submit()
		
	}
	
	function cartDelete() {

		document.list.action="../BetterHip/cartDelete.do"
		document.list.submit()
		
	}
	
	function previousBack() {
		
		document.list.action=history.back(-1)
		window.history.go(-1)
	
	}
	
	 function fnImgPop(url){
		  var img=new Image();
		  img.src=url;
		  var img_width=img.width;
		  var win_width=img.width+25;
		  var img_height=img.height;
		  var win=img.height+30;
		  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
		  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
		 }
	
</script>

<body>
	<div align="center"><h1>장바구니</h1></div>
   	
    <div>
   		<table>
   			<tr>
   				<td width="250"></td>
   				<td>
					<c:choose>
				    <c:when test="${empty CartList}">
						<h2>Cart(0)</h2>
				    </c:when>
				    <c:otherwise>
						<h2>담은상품</h2>
				    </c:otherwise>
					</c:choose>   				
   				</td>
   			
   			</tr>
   		</table>
	</div>
	<hr align="center" width="1700"><br>
	 
	<div>
		<table>
			<tr>
				<td align="center" width="1000">상품정보</td>
				<td width="500"></td>
				<td align="center" width="100">수량</td>
				<td align="center" width="100">금액</td>				
			</tr>			
		</table>		
	</div>

	<hr align="center" width="1700"><br>
	
	<div align="center">	
		<c:choose>
			<c:when test="${empty CartList}">
			 <br><br><p align="center"><h1>꽝</h1></p><br><br>
			</c:when>
			<c:otherwise>
				<form name="list">
					<table>	
						<c:forEach var="item" items="${CartList}">
							<tr>
							   <td width="30"><input type="checkbox" name="chk" value="${item.purchase_id}">
							   <td width="200" align="center"><a href="cakeChoice.do?cake_id=${item.purchase_cake_id }">
							   <img src="data:cake_img/png;base64, ${item.purchase_cake_img }" width="150" height="150"></a></td>
							   <td width="600" align="left"><h3><c:out value = "${item.purchase_cake_name }"/></h3><br>
							    	옵션 : ${item.purchase_custom_size}&nbsp;${item.purchase_custom_taste}&nbsp;${item.purchase_custom_cream_type}
									&nbsp;${item.purchase_custom_cream_color}&nbsp;&nbsp;픽업일 : ${item.purchase_pickup_date}<br>
									문구 : ${item.purchase_text}<br><br>
						
									
								<c:set var="null_check" value="${item.purchase_custom_img}"/>	
								<c:choose>
									<c:when test="${null_check eq 'xxx' }">
									  <td align="center" width="350"></td>
									</c:when>
									<c:otherwise>
									   <td align="center" width="350">
									   <img id="imgControll" name="imgControll" src="data:cake_img/png;base64, ${null_check }" width="90" height="90"  onclick="fnImgPop(this.src)"></td>
									</c:otherwise>
								
								</c:choose>

				
								

							   <td align="center" width="100">${item.purchase_quantity }</td>
							   <td align="center" width="100">${item.purchase_price }</td>				   					
							</tr>   
						 </c:forEach>
					</table>	
				</form>
			</c:otherwise>
	   </c:choose> 
	
		
	</div>
	<br>
	<hr align="center" width="1700"><br>
	
	<div align="center">
		<table>
			<tr>
				<td width="150" align="center"><input type="button" onclick="cartOrder()" value="구매하기" style="WIDTH: 80pt; HEIGHT: 30pt"></td>
				<td width="150" align="center"><input type="button" onclick="cartDelete()" value="삭제하기" style="WIDTH: 80pt; HEIGHT: 30pt"></td>
				<td width="150" align="center"><input type="button" onclick="previousBack()" value="이전페이지" style="WIDTH: 80pt; HEIGHT: 30pt"></td>
			</tr>

		</table>
	
	</div>
			

</body>
</html>
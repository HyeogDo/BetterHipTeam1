 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소</title>
</head>


<style>

	h3 { text-align: center;}
	h4 { text-align: center;}

</style>



<body>

<div style="position: absolute; left: 25%;">
	
		<form action="#" name="purchaseCancel" method="post">
		
			<table>
				<tr>
					<td align="center" colspan="2">BETTER HIP</td>
				</tr>
				<tr>
					<td align="center" colspan="2">주문 취소</td>
				</tr>
				</table>
			<h3>주문이 취소되었습니다.</h3>
			<h4>취소 내역은 [마이페이지] - [나의 쇼핑 내역]- [취소 / 환불 조회] 에서 확인할 수 있습니다.</h4>
			<input type="button" name="purchaseCancel" value="확인" onclick="location.href = 'refundList.do'">
	
		</form>
	
	</div>
				
</body>
</html>
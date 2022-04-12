<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배러힙 결제 성공</title>
</head>

<script type="text/javascript">
function goShopping() {
	location.href="cakeListView.do";
}
function payView() {
	location.href="purchaseList.do";
}
</script>
<style type="text/css">
div#top{
width: 100%;
height: 200px;
background-color: gray;
float: left;
}
#side_left{
width: 10%;
height:800px;
background-color:white;
float:left;
}
#mid_area{
width:80%;
height:800px;
background-color:white;
float:left;
}
#mid_left{
width:10%;
height:800px;
background-color:white;
float:left;
}
#mid_content{
width:70%;
height:800px;
background-color:white;
float:left;
}
#mid_right{
width:10%;
height:800px;
background-color:white;
float:left;
}
}
#side_rigth{
width:10%;
height:800px;
background-color:white;
float:left;
}
#bottom{
width: 100%;
height: 200px;
background-color: gray;
float: left;
}

</style>
<body>
<div id="top" style="text-align: center;"></div>
	<div id="side_left"></div>
	<div id="mid_area">
		<div id="mid_left">
		</div>
		<div id="mid_content">
			<div style="text-align: center;">
				<h1>결제 성공</h1>
			</div>
			<div style="width: 100%; height:80%; text-align: center;">
				<h2>주문이 완료되었습니다.</h2>
			</div>
			<div style="text-align: center;">
				<input type="button" onclick="goShopping()" value="쇼핑하러가기">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="payView()" value="쇼핑 내역 확인">
			</div>
		</div>
		<div id="mid_right">

		</div>
	</div>
	<div id="side_right"></div>
	<div id="bottom"></div>
</body>
</html>
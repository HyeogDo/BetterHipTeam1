<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Hip 결제 성공</title>
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">


<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/templatemo.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../assets/css/fontawesome.min.css">
<link rel="stylesheet" href="../assets/css/signupForm.css">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>

<!-- 메인 -->
<body>
    <!-- Header -->
<div id="wrap">
	<header>
		<div class="top-header">
			<div class="container clearfix">
			<div class="member-area">
				<a href="#!">로그인</a>
				<span class="bar">|</span>
				<a href="../BetterHip/signup.do">회원가입</a>
				<span class="bar">|</span>
				<a href="#!">장바구니</a>
				<span class="bar">|</span>
				<a href="#!">My Page</a>
			</div>
			</div>
		</div>
		<div class="main-header">
			<div class="container clearfix">
			<h1 class="logo">
				<a href="#!">
				<img src="../assets/img/logo.png" alt="로고" width="120">
				</a>
			</h1>
			<h1 class="logo_text">
				<a href="main.do">Better Hip</a>
			</h1>
			<div class="gnb">
				<ul class="clearfix">
					<li class="nav-item info">
						<a href="#!" class="nav-link">이용안내</a>
						<div class="dropdown">
						<ul>
							<li>
							<a href="#!">케이크 안내</a>
							</li>
							<li>
							<a href="#!">픽업 방법</a>
							</li>
							<li>
							<a href="#!">이용 안내</a>
							</li>
						</ul>
						</div>
					</li>
					<li class="nav-item cake">
						<a href="#!" class="nav-link">케이크 주문</a>
					</li>
					<li class="nav-item intro">
						<a href="#!" class="nav-link">소개</a>
					</li>
					<li class="nav-item notice">
						<a href="#!" class="nav-link">공지사항</a>
					</li>
				</ul>
			</div>
			</div>
		</div>
	</header>
	</div>

<script type="text/javascript">
function goShopping() {
	location.href="cakeListView.do";
}
function payView() {
	location.href="purchaseList.do";
}
</script>

<body>
<div id="top" style="text-align: center;"></div>
	<div id="side_left"></div>
	<div id="mid_area">
		<div id="mid_left">
		</div>
		<div id="mid_content" style="display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    width: 100%;
	    padding: 200px;"">
			<div style="text-align: center;">
				<h1></h1>
				<img src="../assets/img/check-circle.png" style="width:50px;">
				<h1>결제성공</h1>
			</div>
			<div style="width: 100%; text-align: center;">
				<h2>결제가 완료되었습니다.</h2>
			</div>
			<div>
				<input type="button" onclick="goShopping()" value="쇼핑하러가기"
				style="width: 300px; height:60px;
				 background: #4F75D8;
				 color: #fff;
				 font-size: 20px;
				 font-weight:bold;
				 border: none;
				 border-radius: 5px;
				 cursor:pointer;
				 transition:.5s;margin-top: 30px;">
			</div>
				<input type="button" onclick="payView()" value="쇼핑 내역 확인"
				style="width: 300px; height:60px;
				 background: #fff;
				 color: #4F75D8;
				 font-size: 20px;
				 font-weight:bold;
				 border: 1px solid;
				 border-radius: 5px;
				 cursor:pointer;
				 transition:.5s;
				 margin-top: 30px;">
			</div>
		</div>

</body>
</html>
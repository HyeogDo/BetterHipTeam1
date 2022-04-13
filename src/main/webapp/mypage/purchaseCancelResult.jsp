<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Hip 주문 취소</title>
<link rel="shortcut icon" type="image/x-icon" href="../BetterHip/assets/img/favicon.ico">


<link rel="stylesheet" href="../BetterHip/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../BetterHip/assets/css/templatemo.css">
<link rel="stylesheet" href="../BetterHip/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../BetterHip/assets/css/fontawesome.min.css">
<link rel="stylesheet" href="../BetterHip/assets/css/signupForm.css">

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
				<a href="signupForm.do">회원가입</a>
				<span class="bar">|</span>
				<a href="cartList.do">장바구니</a>
				<span class="bar">|</span>
				<a href="#!">My Page</a>
			</div>
			</div>
		</div>
		<div class="main-header">
			<div class="container clearfix">
			<h1 class="logo">
				<a href="#!">
				<img src="../BetterHip/assets/img/logo.png" alt="로고" width="120">
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

<body>

		<form action="#" name="purchaseCancel" method="post">

		<div id="mid_content" style="display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    padding: 200px;"">
			<div style="text-align: center;">
				<h1></h1>
				<img src="../BetterHip/assets/img/check-circle.png" style="width:50px;">
				<h1>주문 취소 완료</h1>
			</div>
			<div style="width: 100%; text-align: center;">

				<h4>취소 내역은 [마이페이지] - [나의 쇼핑 내역]- [취소 / 환불 조회] 에서 확인할 수 있습니다.</h4>
			</div>
			<div>
				<input type="button"  onclick="location.href = 'refundList.do'" value="확인"
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
	
		</div>

		</form>
	
<!-- Start Footer -->
    <footer class="bg-dark" id="footer">
        <div class="footer_container">

            <div class="row_footer">                        
                <div class="w-100 bg-black py-3">
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><h5>Better Hip</h5></li>
                        <!-- <li><a class="text-decoration-none" href="#">이용약관      |      </a>
                        <a class="text-decoration-none" href="#">개인정보처리방침      |      </a>
                        <a class="text-decoration-none" href="#">이메일무단수집거부      |      </a></li> -->
                        <p class="text-center text-light">
                            <a class="text-decoration-none" href="#">이용약관      |      </a>
                            <a class="text-decoration-none" href="#">개인정보처리방침      |      </a>
                            <a class="text-decoration-none" href="#">이메일무단수집거부      |      </a>
                        </p>
                        <li><a>통신판매신고번호:2021-서울서초-0413</a></li>
                        <li><a>사업자등록번호: 000-00-00000 주식회사 배러힙</a></li>
                        <li><a>주소: 서울특별시 서초구 서초동 1305 서산빌딩</a></li>
                        <li><a>대표자: 원경호</a></li>
                        <li><a>전화번호: 02-000-0000</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="w-100 bg-black py-3">
            <div class="footer_2_container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 배러힙 2022 Better Hip
                            | Designed by <a rel="sponsored" href="https://betterhip.dothome.com" target="_blank">Betterhip</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="../BetterHip/assets/js/jquery-1.11.0.min.js"></script>
    <script src="../BetterHip/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../BetterHip/assets/js/bootstrap.bundle.min.js"></script>
    <script src="../BetterHip/assets/js/templatemo.js"></script>
    <script src="../BetterHip/assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Better Hip 결제리스트</title>
<link rel="stylesheet" href="../assets/css/login_find_pw.css">
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">


<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/templatemo.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../assets/css/fontawesome.min.css">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
	<script type="text/javascript">
	
	
function imagePopup(){
	var pop_title = "popupOpener" ; 
	window.open("", pop_title, "width=400, height=300, left=600, top=300") ; 
	var imageForm = document.imageForm ;
	imageForm.target = pop_title ;
	imageForm.action = "paymentListPopup.do" ; 
	imageForm.submit() ; 
	
	
}




function check_form(){

var form = document.regiform;
if(!form.agree_chk.checked){
form.agree_chk.focus();
alert("약관에 동의하셔야 다음단계로 이동합니다.");
return false;
  }

	location.href="payment.do";
}
</script>

</style>
<head>
<meta charset="UTF-8">
<title>배러힙 주문하기</title>
</head>
<body>
<!-- header -->
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
<!-- header -->


	<div id="top" style="text-align: center;"></div>
	<div id="side_left"></div>
	<div id="mid_area">
		<div id="mid_left">
		</div>
		<div id="mid_content" style="margin-left: 434px">
							<div style="text-align: center;">
				<h1 style="margin-left: 325px;">주문하기</h1>
			</div>
				<h3>주문상품</h3>
				
				<!-- 		첫번째 줄  시작     -->
				<div>
					<table border="1">
						<tr>
							<th width="800">상품정보</th>
							<th width="100">수량</th>
							<th width="100">주문금액</th>
							<th width="100">상태</th>
						</tr>
					
					
					
				
					    
					</table>
				</div>
					
			<!-- 		첫번째 줄  끝     -->
					
					
					<!-- 두번째 줄 -->
						<c:forEach items="${paymentList }" var="dto_purchase_list">

						
						
						<table border="1">
							<tr>
								<td width="150" height="200">
									<img src="data:cake_img/png;base64, ${dto_purchase_list.cake_img}" width = "150" height="200">
								</td>
								<td width="600" height="200" style="text-align: center;">
									<h3>${dto_purchase_list.cake_name}</h3>
									맛: ${dto_purchase_list.customize_taste}, 
									사이즈: ${dto_purchase_list.customize_size}, 
									크림 종류: ${dto_purchase_list.customize_cream_type}, 
									크림 색상: ${dto_purchase_list.customize_cream_color}<br>
									문구 : ${dto_purchase_list.purchase_text}<br>
 									픽업 날짜 : ${dto_purchase_list.purchase_pickup_date}
									<form name="imageForm" method="get">
 										<input type="hidden" name="purchase_id" value="${dto_purchase_list.purchase_id}">
 										<input type="button" value="이미지 보기" onclick="imagePopup()">
									</form>
 									
 									
								</td>
								<td width="100" height="200" style="text-align: center;">
									${dto_purchase_list.purchase_quantity}
								</td>
								<td width="100" height="200" style="text-align: center;">
									${dto_purchase_list.purchase_price}
								</td>
								<td width="100" height="200" style="text-align: center;">
									방문수령
								</td>
								
							</tr>
						</table>
						</c:forEach>
			
				
				<h3>주문자 정보</h3>
				-----------------------------------------------------------------------------
			<table>
				<tr>
					<td>주문자 명</td>
					<td>${paymentUserList.user_name }</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>${paymentUserList.user_phone }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${paymentUserList.user_email }</td>
				</tr>
				
			</table>
				-----------------------------------------------------------------------------
				
				
				<h3>총 주문금액</h3>
				<h3>${total_price } 원</h3>
				<br><br>
				
				
			
			<!-- -------- 약관 동의 ------------- -->
				<form name="regiform">
				<h3>약관 동의</h3>
					<input type="checkbox" name="agree_chk" value="1">이 케이크가 먹고싶다면 순순히 약관 동의를 누르시는 게 좋을 겁니다. 동의 안하면 안 팔아요.<br><br><br>
					<input type="button" onclick="check_form()" value="결제하기"
					style="width: 20%;width: 20%;
				    height: 60px;
				    background: #4F75D8;
				    color: #fff;
				    font-size: 20px;
				    font-weight: bold;
				    border: none;
				    border-radius: 5px;
				    cursor: pointer;
				    transition: .5s;margin-bottom: 30px;margin-left: 25%;">
					<!-- <img alt="kakaopay" src="./images/kakaopay.png" onclick="check_form()"/> -->
			
				</form>
		</div>
		<div id="mid_right">

		</div>
	</div>
	<div id="side_right"></div>
	<div id="bottom"></div>


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
        <div class="w-100 bg-black">
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
<script src="assets/js/jquery-1.11.0.min.js"></script>
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/templatemo.js"></script>
<script src="assets/js/custom.js"></script>
<!-- End Script -->

</body>
</html>
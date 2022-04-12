<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Better Hip 로그인</title>
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="../assets/css/login.css">
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


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('7c1aa88300eb4966019664a165594ea4'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			// response.kakao_account.email = 이메일
			  location.href='login.do?user_id='+response.kakao_account.email+'&loginMethod=kakao'
        	  
        	  if (response.kakao_account.email === 'undefined') {
        		  alert('이메일정보 동의좀')
        		  kakaoLogout()
        	  
        	  }else{
        		  
        	  }
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<script>
	let savedID = localStorage.getItem("userID");
	if(savedID.length > 0){
		$("#id").val(savedID);
		$("#info10_1").attr('checked', true)
	}

	var joinFormSubmitted = false;
	
	function fn_action(){
		if($("#info10_1").is(":checked") == true){
			localStorage.setItem('userID', $("#id").val());

		}else{
			localStorage.removeItem('userID');
		}
		if(joinFormSubmitted){
			alert("처리중입니다.")
			return false;
		}
		checkID();
		
		if(document.frm.pw.value == 0){
			alert("비밀번호를 입력해주세요.")
			return false;
		}
		var len= document.frm.id.value.length;
		if(len <4 || len>20){
			alert("아이디값의 길이는 4~20자 사이로 입력해주세요.")
			document.frm.id.focus();
			return false;
		}
		document.frm.submit();
		joinFormSubmitted =true;
	}
	
	$("#id").keyup(function(){
		$("#id-error").removeClass("block")
	})
	$("#id").blur(function(){
		checkID();
	})
	
	function checkID(){
		if(document.frm.id.value.indexOf(' ') != -1 ){
			$("#id-error").html("* 아이디를 영문자와 숫자의 조합으로 입력해주세요.").addClass("block")

			return false;
		}
		if(document.frm.id.value.length == 0){
			$("#id-error").html("* 아이디를 확인해주세요!").addClass("block")
			return false;
		
		}
	}
</script>

<script type="text/javascript">
	
	// DB 접속후 재진입시 메세지출력
	window.onload=function(){	
		if("${message}" != "" && "${message}" != "init") {
			
			alert("${message}")
			<%
			session.setAttribute("message", "init");
			%>
		}

	}
	
</script>

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
	</div>
</div>

<!-- 로그인 폼 -->
<div class="form-wrapper">
	<div class="login-form" >
		<div class="logo" style="text-align:center">
		</div>
		<h1>Login</h1>
		<form name="frm" method="post" action="" onsubmit="return false;">
			<div class ="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required>
				<label for ="id">아이디</label>
			<p class="error" id="id-error"></p>
			</div>
			<div class ="int-area">
				<input type="password" name="pw" id="pw"
				autocomplete="off" required>
				<label for ="pw">비밀번호</label>
			<p class="error" id="pw-error">* 비밀번호를 확인해주세요!</p>
			</div>
			<div class="btn-area">
				<div class="idsave-btn-area">
					<input type="checkbox" id="info10_1" name="idsave" value="saveOK">
					<span>아이디저장</span>
				</div>
				<button type="button" id="btn" value="로그인" onclick="checkOnclick()" name="loginMethod">로그인</button>
			</div>
		</form>
			<div class="kakao-btn-area">
				<button type="button" onclick="kakaoLogin()" value="카카오 로그인">카카오 로그인</button>
			</div>
			<div class="signupForm-btn-area">
				<div class="login__check--left mr-3">
				<a href="../BetterHip/signupForm.do" style="font-family: 'Nanum Gothic', sans-serif;">
				회원가입</a>
				</div>
				<div class="login__check--right">
				<a href="../findIdPage.do" style="font-family: 'Nanum Gothic', sans-serif;">
				아이디찾기</a>
				<span class="bar">|</span>
				<a href="../findPwPage.do" style="font-family: 'Nanum Gothic', sans-serif;">
				비밀번호 찾기</a>
				</div>
			</div>
			</div>				
						
		</div>

</div>

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
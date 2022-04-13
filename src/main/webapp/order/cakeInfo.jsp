<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.betterhip.dto.order.CakeInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%

SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String currentDate = format.format(date);
 

%>


<html>
   <style>
      #orderBox {
       	position: relative; top:5%; left:65%; 
 		width: 30%; height: 40px;  text-align: center; background: #3399ff;
      }
   
      body {
		padding: 0px;
		margin: 0px;
      }
      .jbMenu {
		display: flex;
		justify-content: space-evenly;
		background-color: rgba(52, 152, 219, 0.75);
        width: 60%;
      }
      .jbMenu a {
		color: #fff;
		font-size: 32px;
		padding: 20px 15px;
		text-decoration: none;
	  }
      .jbContent {
        height: 2000px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
      
      @media(max-width:480px) {
		  .Menu a {
		    font-size: 20px;
	  }
}
    </style>
    
    <!-- 변화 감지 후 가격 책정 -->
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      $( document ).ready( function() {
        $( '#purchase_quantity, #cake_saleprice' ).change( function() {
          var a = $( '#purchase_quantity' ).val();
          var b = $( '#cake_saleprice' ).val();
          var ab = a * b;
          $( '#ab' ).text( ab );
        } );
      } );
    </script>
    
    <!-- 네비게이션 플로팅 -->
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() >= jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    
    <!-- 네비게이션 바 이동 -->
    <script type="text/javascript">
    	function toMenu1() {
    		var location = document.querySelector("#Menu1").offsetTop;
			window.scrollTo({top:location, behavior:'smooth'})
		}
    	function toMenu2() {
    		var location = document.querySelector("#Menu2").offsetTop;
			window.scrollTo({top:location, behavior:'smooth'})
		}
    	function toMenu3() {
    		var location = document.querySelector("#Menu3").offsetTop;
			window.scrollTo({top:location, behavior:'smooth'})
		}
    	function toMenu4() {
    		var location = document.querySelector("#Menu4").offsetTop;
			window.scrollTo({top:location, behavior:'smooth'})
		}
    </script>
    
    <!-- 주문 박스 플로팅 -->
    <script type="text/javascript">
    $(window).scroll(function() {
    	if($(this).scrollTop() > 300) {
    		$("#orderBox").css('position','fixed');
    		$("#orderBox").css('background','#3399ff');
    	}
    	else {
    		$("#orderBox").css('position','relative');
    		$("#orderBox").css('background','#ff8000');
    	}
    });
    </script>
    
    <!-- 장바구니, 바로구매 이동 -->
    <script type="text/javascript">
		function cartSubmit(frm) {
			frm.action = 'cakeOrderCart.do'
			frm.submit()
			return true;
		}
		function paymentSubmit(frm) {
			frm.action = 'cakeOrderPayment.do'
			frm.submit()
			return true;
		}


    </script>
    
	<script type="text/javascript">
		function openReview() {
			window.open("cakeReview.do","","width=800, height=300, left=500, top=150")
		}
	</script>
	
    
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../BetterHip/assets/css/cakeInfo.css">
<link rel="shortcut icon" type="image/x-icon" href="../BetterHip/assets/img/favicon.ico">


<link rel="stylesheet" href="../BetterHip/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../BetterHip/assets/css/templatemo.css">
<link rel="stylesheet" href="../BetterHip/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../BetterHip/assets/css/fontawesome.min.css">
<title>Cake Info</title>
</head>
<body>

<!-- header -->
<c:set var="path" value="<%=request.getContextPath()%>"/>
<div id="wrap">
	<header>
		<div class="top-header">
			<div class="container clearfix">
			<div class="member-area">
				<a href="/BetterHip/loginForm.do">로그인</a>
				<span class="bar">|</span>
				<a href="/BetterHip/signupForm.do">회원가입</a>
				<span class="bar">|</span>
				<a href="../BetterHip/cart/cartList.do">장바구니</a>
				<span class="bar">|</span>
				<a href="/BetterHip/purchaseList.do">My Page</a>
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
						<a href="" class="nav-link">이용안내</a>
						<div class="dropdown">
						<ul>
							<li>
							<a href="/BetterHip/guideCake.do">케이크 안내</a>
							</li>
							<li>
							<a href="/BetterHip/guidePickup.do">픽업 방법</a>
							</li>
							<li>
							<a href="/BetterHip/guideUse.do">이용 안내</a>
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

<div>
	<c:forEach items="${LIST }" var="dto" varStatus="status" end="0">
		<img src="data:cake_img/png;base64, ${dto.base64Image }" width = "600" height="600"><br>
		${dto.cake_name }<br>
		${dto.cake_saleprice }<br>
		
	</c:forEach>
	
</div>
    <div class="jbMenu">
    <button style="height: 50px;" onclick="toMenu1()" >상품정보</button>
    <button onclick="toMenu2()" >취급 주의사항</button>
    <button onclick="toMenu3()" >취소 환불</button>
    <button onclick="toMenu4()" >리뷰(${COUNTREVIEW })</button>

    </div>
    <div class="jbContent">
	    <div id="Menu1">
		    <img alt="none" src="order/pic01.jpg" width="60%"><br>
		    <img alt="none" src="order/pic01_2.jpg" width="60%"><br>
		    <img alt="none" src="order/pic01_3.jpg" width="60%"><br>
	    </div>
	    <div id="Menu2">
		    <img alt="none" src="order/pic02.jpg" width="60%"><br>
		    <img alt="none" src="order/pic02_1.jpg" width="60%"><br>
	    </div>
	    <div id="Menu3">
		    <img alt="none" src="order/pic03.jpg" width="60%"><br>
		    <img alt="none" src="order/pic03_1.jpg" width="60%"><br>
	    </div>
	    <div id="Menu4">
	    <b>리뷰 조회</b><br>
	    	<c:forEach items="${REVIEWLIST }" var="dto" varStatus="status">
				구매자 ID : ${dto.purchase_user_id }<br>
				리뷰 날짜 : ${dto.review_date }<br>
				별점 : ${dto.review_star }<br>
				내용 : ${dto.review_content }<br>
	    	</c:forEach>
	    <b>리뷰 작성</b><br>
	    	<form action="#">
	    		<textarea rows="10" cols="100" name="review_content" onclick="openReview()" readonly="readonly" placeholder="리뷰를 작성해 주세요"></textarea>
	    		<input type="button" value="리뷰 입력" onclick="openReview()">
	    	</form>
	    </div>
    </div>
    
<div id="orderBox" style="height: 200px">
	<form action="#" enctype="multipart/form-data" method="post">
	<b>옵션 선택</b><br>
	<select name="customize_id" >
		<c:forEach items="${LIST }" var="dto" varStatus="status">
		<option value="${dto.customize_id }" >
			옵션 ${dto.customize_id }. 
			${dto.customize_taste } + ${dto.customize_size }
			 + ${dto.customize_cream_type } + ${dto.customize_cream_color }
			 , 추가금액 : ${dto.customize_saleprice }
		</option>
		</c:forEach>
	</select><br>
	<b>구매 수량</b><br>
	<input type="number" name="purchase_quantity" id="purchase_quantity" value="1" min="1"><br>
	<b>레터링 문구 입력</b><br>
	<input type="text" name="purchase_text" placeholder="레터링 문구 없을 시 '없음'이라고 적어주세요" width="80%"><br>
	<b>사진 첨부(선택)</b><br>

    <input type="hidden" value="${LIST[0].cake_saleprice }" id="cake_saleprice" name="cake_saleprice"><br>
    <input type="date" name="cake_pickupDate" min="<%=currentDate %>"><br>
	<input type="file"  name="purchase_img" placeholder="첨부하기" accept="image/png"><br>

    총 구매금액 = <span id="ab"></span>
	<br><input type="button" value="바로구매" onclick="paymentSubmit(this.form)"> <input type="button" value="장바구니" onclick="cartSubmit(this.form)"><br>
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
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Better hip</title>
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/templatemo.css">
    <link rel="stylesheet" href="../assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
</head>

<body>
<div class="body_wrap">
    <!-- Header -->
    <div id="wrap">
        <header>
            <div class="top-header">
                <div class="container clearfix">
                <div class="member-area">
                    <a href="#!">로그인</a>
                    <span class="bar">|</span>
                    <a href="#!">회원가입</a>
                    <span class="bar">|</span>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-relative top-20 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
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
                    <a href="#!">Better Hip</a>
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
                            <a href="noticeList.do?" class="nav-link">공지사항</a>
                        </li>
                        <li class="nav-item search">
                                <div class="flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                                    <div class="input-group">
                                        <input type="text" class="form-control border-0" id="inputSearch">
                                        <div class="input-group-text">
                                            <i class="fa fa-fw fa-search"></i>
                                        </div>
                                    </div>
                                </div>
                        </li>
                    </ul>
                </div>
                </div>
            </div>
        </header>
        </div>
        </div>
    </div>

    <!-- Close Header -->

    <!--banner-->
    <div class="wrap-banner">
        <div class="background">
            <img src="/BetterHip/assets/img/back.jpg" alt="배경" width="100%">
        </div>
        <div class="moving">
        </div>
    </div>

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>케이크큐레이션</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">레터링</li>
                            <li data-filter=".fresh-meat">캐릭터</li>
                            <li data-filter=".vegetables">어버이날</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 큐레이션 케이크 -->
            <div class="wrapitem">
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="item">
                        <img class="item_img" src="../assets/img/category_img_02.jpg" >
                        <div class="item_img_text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- Featured Section End -->    



    <!-- Start Categories of The Month -->
    <section class="container">
        <div class="popular_cake">

            <div class="row text-center pt-3">
                <div class="col-lg-6 m-auto">
                    <h2 class="h2">인기 추천 케이크</h2>
                    <h5>가장 맛있는 케이크를 추천해드립니다.</h5>
                </div>
            </div>

            <div class="wrap_container">
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
                <div class="pop_container">
                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="#"><img src="../assets/img/category_img_01.jpg" class="img-fluid"></a>
                        <h4 class="h5 text-center mt-3 mb-3">해피데이 곰돌이 케이크</h4>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- End Categories of The Month -->



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
    <script src="../assets/js/jquery-1.11.0.min.js"></script>
    <script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/templatemo.js"></script>
    <script src="../assets/js/custom.js"></script>
    <!-- End Script -->
<!-- Code injected by live-server -->
<script type="text/javascript">
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>
</body>

</html>
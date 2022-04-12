<%@page import="com.betterhip.dto.order.CakeListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.betterhip.dao.order.CakeListDao"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//String user_id = session.getAttribute("USER_ID").toString();
	String user_id = "peterhd";
	
	//페이지 나누기
	
	String tempPage = request.getParameter("page");
	int cPage;
	//현재 페이지 정하기
	if (tempPage == null || tempPage.length() == 0) {
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e) {
		cPage = 1;
	}
	
	// 페이지 묶음들 개수(3개면 [prev] 1 2 3 [next] 로 뜨고 next 클릭하면 [prev] 4 5 6 [next] 이런식으로 뜨게)
	int pageLength = 3;
	// 한 페이지에 담으려는 데이터 개수
	int len = 4;
	// 각 페이지의 데이터 시작점
	int start;
	// 현재 블록
	int currentBlock;
	// 시작 페이지 끝 페이지
	int startPage;
	int endPage;
	// 총 raw 수, 페이지 수
	int totalRows = Integer.parseInt(session.getAttribute("totalRows").toString());
	int totalPages = totalRows % len == 0 ? totalRows/len : (totalRows / len) + 1;
	// 총페이지수 예외처리
	if(totalPages == 0) {
		totalPages = 1;
	}
	if (cPage > totalPages) {
		cPage = 1;
	}
	// 각 페이지의 데이터 시작점
	start = (cPage - 1) * len;
	//현재 블록 설정
	currentBlock = cPage % pageLength == 0 ? cPage / pageLength : (cPage / pageLength) + 1;
	
	// 시작 페이지 끝 페이지 설정
	startPage = (currentBlock - 1) * pageLength + 1;
	endPage = startPage + pageLength - 1;
	
	// 총 페이지 숫자를 넘어가면 끝 페이지를 마지막 페이지 숫자로 지정
	if(endPage > totalPages) {
		endPage = totalPages;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<link rel="stylesheet" href="../BetterHip/assets/css/login_find.css">
<link rel="shortcut icon" type="image/x-icon" href="../BetterHip/assets/img/favicon.ico">


<link rel="stylesheet" href="../BetterHip/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../BetterHip/assets/css/templatemo.css">
<link rel="stylesheet" href="../BetterHip/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../BetterHip/assets/css/fontawesome.min.css">

<title>Better Hip 케이크 리스트</title>
<script type="text/javascript">
	function sorting() {
		var sort = document.getElementById('sorting').value
		
	}
</script>
</head>

	<body>
	
	<div id="wrap">
	<header>
		<div class="top-header">
			<div class="container clearfix">
			<div class="member-area">
				<a href="loginForm.do">로그인</a>
				<span class="bar">|</span>
				<a href="signup.do">회원가입</a>
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
	
<!-- 	레터링 케이크 리스트 -->
		<div align="center">
			<div align="center">
				<h1><b>레터링 케이크</b></h1>
				<h3>선물하고 싶은 메세지를 알려주세요. 다해줄게요.</h3>
			</div>
			<br>
			<div  style="position: absolute; left: 10%; right: 10%">
				<div align="left">
					<select onselect="sorting()" id="sorting">
						<option value="dec">높은 가격순</option>
						<option value="inc">낮은 가격순</option>
						<option>인기 상품순</option>
					</select>
					<select>
						<option>4개씩 보기</option>
						<option>8개씩 보기</option>
					</select>
				</div>
				<div align="right">
					<input type="text" size="15" placeholder="제품명 검색"> <input type="button" name="btn_search" value="검색">
				</div>
				<div>
						<table>
							<tr>
							<c:forEach items="${list}" var="dto" varStatus="status">
									
								<td><a href="cakeChoice.do?cake_id=${dto.cake_id }" ><img src="data:cake_img/png;base64, ${dto.base64Image }" width = "200" height="200"><br>
								${dto.cake_name }<br>
								${dto.cake_saleprice }</a></td>
								<c:if test="${status.index % 4 == 3 }">
									</tr><tr>
								</c:if>
							</c:forEach>
						</table>
				</div>
				<% for (int i = 0; i < totalPages; i++) {
						start = len*i;
					%><a href="../cakeListView.do?start=<%=start %>"><%=i + 1 %></a> <%
					}	
				%>
				
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
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>Better Hip 공지사항 리스트</title>
	<link rel="stylesheet" href="../assets/css/login_find_pw.css">
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">
	
	
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/templatemo.css">
	<link rel="stylesheet" href="../assets/css/custom.css">
	
	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
	<link rel="stylesheet" href="../assets/css/fontawesome.min.css">

</head>
<script type="text/javascript">
<% 
HttpSession session2 = request.getSession();
String USER_ID = (String) session2.getAttribute("USER_ID"); 
%>

function adminCheck() {
   switch("<%=USER_ID%>"){
   case "fk1119":
      location.href="noticeFormView.do"
      break;
   default:
      alert("어드민 아님")
      break;
   }
}

</script>
<body>
      <header>
            <div class="top-header">
                <div class="container clearfix">
                <div class="member-area">
                    <a href="loginForm.do">로그인</a>
                    <span class="bar">|</span>
                    <a href="signupForm.do">회원가입</a>
                    <span class="bar">|</span>
                    <a href="cartList.do">장바구니</a>
                    <span class="bar">|</span>
                    <a href="purchaseList.do">My Page</a>
                </div>
                </div>
            </div>
            <div class="main-header">
                <div class="container clearfix">
                <h1 class="logo">
                    <a href="main.do">
                    <img src="../assets/img/logo.png" alt="로고" width="120">
                    </a>
                </h1>
                <h1 class="logo_text">
                    <a href="main.do">Better Hip</a>
                </h1>
                <div class="gnb">
                    <ul class="clearfix">
                        <li class="nav-item info">
                            <a href="guideCake.do" class="nav-link">이용안내</a>
                            <div class="dropdown">
                            <ul>
                                <li>
                                <a href="guideCake.do">케이크 안내</a>
                                </li>
                                <li>
                                <a href="guidePickup.do">픽업 방법</a>
                                </li>
                                <li>
                                <a href="guideUse.do">이용 안내</a>
                                </li>
                            </ul>
                            </div>
                        </li>
                        <li class="nav-item cake">
                            <a href="cakeListView.do" class="nav-link">케이크 주문</a>
                        </li>
                        <li class="nav-item intro">
                            <a href="introduce.do" class="nav-link">소개</a>
                        </li>
                        <li class="nav-item notice">
                            <a href="noticeList.do" class="nav-link">공지사항</a>
                        </li>
                    </ul>
                </div>
                </div>
            </div>
        </header>
    <!-- Close Header -->
   <h1 style="text-align: center; margin-left: 782px;text-align: center;">공지사항</h1>
   <div style="margin-left: 510px; text-align: center; padding-bottom: 5%;">
   <table border="1">
      <tr>
         <th width="50">No.</th>
         <th width="200">제목</th>
         <th width="500">내용</th>
         <th width="150">작성일</th>
      </tr>
      <c:forEach items="${list}" var="dto">
         <tr>
            <td><a href="noticeContent.do?notice_id=${dto.notice_id}">${dto.notice_id }</a></td>
            <td>${dto.notice_title }</td>
            <td>${dto.notice_content }</td>
            <td>${dto.notice_date }</td>
         </tr>
      </c:forEach>
      
      <tr>
         <td colspan="5"><input type="button" onclick="adminCheck()" value="작성"></td>
      </tr>
      
   </table>
   
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
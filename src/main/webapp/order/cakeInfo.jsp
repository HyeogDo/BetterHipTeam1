<%@page import="com.betterhip.dto.order.CakeInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    

    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	    	<c:forEach items="${REVIEWLIST }" var="dto" varStatus="status">
				구매자 ID : ${dto.purchase_user_id }<br>
				리뷰 날짜 : ${dto.review_date }<br>
				별점 : ${dto.review_star }<br>
				내용 : ${dto.review_content }<br>
				
				 
	    	</c:forEach>
	    </div>
    </div>
    
<div id="orderBox" style="height: 200px">
	<form action="#">
	<b>옵션 선택</b><br>
	<select name="customize_id">
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
	<input type="text" name="puchase_text" placeholder="레터링 문구 없을 시 '없음'이라고 적어주세요" width="80%"><br>
	<b>사진 첨부(선택)</b><br>
	<input type="file" name="purchase_img" placeholder="첨부하기"><br>
    <input type="hidden" value="${LIST[0].cake_saleprice }" id="cake_saleprice" name="cake_saleprice">
    총 구매금액 = <span id="ab"></span>
	<br><input type="button" value="바로구매" onclick="paymentSubmit(this.form)"> <input type="button" value="장바구니" onclick="cartSubmit(this.form)"><br>
	</form>
</div>
</body>
</html>
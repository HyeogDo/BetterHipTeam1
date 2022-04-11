<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>주문 조회</title>

<!--날짜검색 Datepicker  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
            	 showOn: "both", //위젯 보이기 : 텍스트 필드, 버튼 둘다 선택 가능  
            	 buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
            	 buttonImageOnly: true, 
                 changeMonth: true, //월 바꾸는 셀렉트 박스 
                 changeYear: true,  //연도 바꾸는 셀렉트 박스 
                 numberOfMonths: [1,1], //한번에 얼마나 많은 월 표시 
                 stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
                 showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.  
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: '-2y',
                 maxDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
            	 showOn: "both", 
           		 buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
           	 	 buttonImageOnly: true, 
                 changeMonth: true, 
                 changeYear: true,
                 numberOfMonths: [1,1], 
                 stepMonths: 1, 
                 showMonthAfterYear: true , 
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: '-2y', 
                 maxDate: 0,     
                 onClose: function( selectedDate ) {    
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>

</head>



<!--주문조회 메인-->
<body>

<!--오늘 날짜 가져오는 자바 스크립트립-->
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String currentDate = format.format(date);
%>

<div style="position: absolute; left: 40%">

	<h2 align="center">나의 쇼핑 내역</h2>
	<h3 align="center">주문 조회</h3>

	<table border="2" class="puchase_state_count">
	
	
		<tr>
			<th>결제완료</th>
			<th>상품준비중</th>
			<th>픽업완료</th>
		</tr>
		<tr>
			<td>count_3 </td>
			<td>count_101</td>
			<td>count_103</td>
		</tr>
		
	</table>
	
	<form action=""></form>
	<table class="purchase_list_lookup">
		<tr>
			<td colspan="3">
			<input type="text" id="startDate" value="${userInfo.user_joindate }"> ~ <input type="text" id="endDate" value=<%=currentDate %>>
			<input type="button" value="조회">
			</td>
		</tr>
	
	</table>
</div>

</body>
</html>


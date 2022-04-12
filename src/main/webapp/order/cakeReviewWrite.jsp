<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<%
	try{
		if (request.getAttribute("RESULT").toString().equals("RESULT_NOT_OK")) {
			%> <script type="text/javascript">
			alert('구매 후 이용 가능합니다.')
			window.close()</script> <%
		}
		
	} catch (NullPointerException e) {
		
	}
%>
<title>Insert title here</title>
</head>
<body>
<form action="cakeReviewWrite.do">
	별점 : <div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="review_star" value="5" v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="review_star" value="4" v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="review_star" value="3" v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="review_star" value="2" v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="review_star" value="1" v-model="ratings" />
	<label for="1-star" class="star">★</label>
</div>
	<textarea rows="10" cols="100" name="review_content"   placeholder="리뷰를 작성해 주세요"></textarea>
	<input type="submit" value="리뷰 입력" >
</form>
</body>
</html>
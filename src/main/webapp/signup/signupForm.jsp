<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Hip 회원가입</title>
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="../BetterHip/assets/css/signupForm.css">
<link rel="shortcut icon" type="image/x-icon" href="../BetterHip/assets/img/favicon.ico">


<link rel="stylesheet" href="../BetterHip//assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../BetterHip//assets/css/templatemo.css">
<link rel="stylesheet" href="../BetterHip//assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../BetterHip//assets/css/fontawesome.min.css">

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
				<a href="loginForm.do">로그인</a>
				<span class="bar">|</span>
				<a href="#!">회원가입</a>
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
        </header>
        </div>
        
	<div style="position: absolute; left: 40%">
		<!-- 회원 가입 form -->
		<form action="signup.do" name="signupForm" method="get">
			<table>
				<tr>
					<td align="center" colspan="2"><b>BETTER HIP</b></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><b>회원 가입</b></td>
				</tr>
				<tr>
					<td>아이디</td>
				</tr>
				<tr>
					<td><input type="text" name="user_id" size="30"> 
					<input type="button" size="20" value="중복확인" onclick="checkId()"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
				</tr>
				<tr>
					<td colspan="2"><input placeholder="비밀번호는 숫자로 5~10자만 입력해주세요!!" 
					type="password" name="user_pw" size="41" id="pw" onkeyup="checkPw()" onchange="checkPwRe()" maxlength="10"></td>
					<td><span id="checking"></span></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="user_pw_re" size="41" id="pw2" onkeyup="checkPwRe()"></td>
					<td><span id="check"></span></td>
				</tr>
				<tr>
					<td>이름</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="user_name" size="41"></td>
				</tr>
				<tr>
					<td>이메일</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="user_email" size="41"></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
				</tr>
				<tr>
					<td><input type="text" name="user_phone" oninput="autoHyphen2(this)" maxlength="13"placeholder="ex) 010-6603-0058"> 
					<input type="button" size="20" value="중복확인" onclick="checkPhone()"></td>
				</tr>
				<tr>
					<td>주소</td>
				</tr>
				<tr>
					<td><input type="text" onclick="sample6_execDaumPostcode()" readonly="readonly" id="sample6_postcode" name="postcode">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
						<input type="text" onclick="sample6_execDaumPostcode()" readonly="readonly" id="sample6_address" size="41" placeholder="기본주소" name="address1"><br>
						<input type="text" id="sample6_detailAddress" size="41" placeholder="상세주소 입력" name="address2"></td>
				</tr>

			</table>
			<br>
			<!-- 약관 동의 -->
			<table>
				<tr>
					<td colspan="2" align="left">서비스 약관 동의</td>
					<td><input type="checkbox" name="selectall" value="selectall"
						onclick="selectAll(this)"><b>모두 동의합니다.</b><br></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td colspan="2" align="left">이용약관(필수)</td>
					<td align="right"><input type="checkbox" name="check"
						value="option_1" onclick="checkSelectAll(this)">동의<br></td>
				</tr>
				<tr>
					<td colspan="2" align="left">개인 정보 동의(필수)</td>
					<td align="right"><input type="checkbox" name="check"
						value="option_2" onclick="checkSelectAll(this)">동의<br></td>
				</tr>
				<tr>
					<td colspan="2" align="left">마케팅 안내 동의(선택)</td>
					<td align="right"><input type="checkbox" name="check"
						value="option_3" onclick="checkSelectAll(this)">동의<br></td>
				</tr>
				<tr>
					<!-- 이동하는 버튼  -->
					<td align="center" colspan="2">

						<input type="button" value="회원 가입" name="btnSubmit" onclick="signup()" class="buttonsignup">

					</td>
				</tr>
			</table>
			<br>
		</form>
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
	
	
</body>


<!-- 전화번호 자동 하이픈 -->
<script type="text/javascript">
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>

<!-- 비밀번호 재확인용 -->
<script type="text/javascript">
	function checkPw() {
		var regExpPasswd = /[0-9]{5,10}$/
		if(!regExpPasswd.test(document.getElementById('pw').value)) {
			document.getElementById('checking').innerHTML='사용할 수 없는 비밀번호 입니다.'
			document.getElementById('checking').style.color='red'
		} else {
			document.getElementById('checking').innerHTML='사용가능한 비밀번호 입니다.'
			document.getElementById('checking').style.color='blue'
		}
	}
	function checkPwRe() {
		if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
	}
</script>


<!-- 아이디&전화번호 중복확인 -->
<script type="text/javascript">
	var isCheckedId = false
	var isCheckedPhone = false
</script>
<!-- 아이디 중복확인 -->
<script type="text/javascript">
	function checkId() {
		//영문자로 시작하는 영문자 또는 숫자 6~20자
		var regExpId = /^[a-z]+[a-z0-9]{5,19}$/g
		var form = document.signupForm
		
		var user_id = form.user_id.value
		if(!regExpId.test(user_id)) {
			alert("아이디는 영문자로 시작하는 영문자 혹은 숫자 6~20자로 입력해주세요")
			form.user_id.select()
			return
		} else {
			isCheckedId = true
			window.name = "parentform"
			window.open("signupCheckId.do?user_id=" + user_id,"childform","width=500, height=300, left=500, top=150");
		}
		

	}
</script>

<!-- 전화번호 중복 확인 -->
<script type="text/javascript">
	function checkPhone() {
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/
		var form = document.signupForm
		
		// 핸드폰 번호 확인
		var user_phone = form.user_phone.value
		if(user_phone == "") {
			alert("휴대폰 번호를 입력해주세요")
			return
		} else {
			if (!regExpPhone.test(user_phone)) {
				alert("연락처 입력을 확인해 주세요")
				form.user_phone.select()
				return
			} else {
				isCheckedPhone = true
				window.open("signupCheckPhone.do?user_phone=" + user_phone,"","width=500, height=300, left=500, top=150");
			}
		} 
		
		
		
	}
</script>
<!-- 유효성 검사 -->
<script type="text/javascript">
	function signup() {

		//숫자만 5~10자
		var regExpPasswd = /[0-9]{5,10}$/
		var regExpName = /^[가-힣]*$/
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		
		var form = document.signupForm

		// 비밀번호 확인
		var user_pw = form.user_pw.value
		var user_pw_re = form.user_pw_re.value
		if(user_pw == "") {
			alert("비밀번호를 입력해주세요")
			return
		}else {
			if (!regExpPasswd.test(user_pw)) {
				alert("사용할 수 없는 비밀번호 입니다.")
				form.user_pw.select()
				return
			}
			
		}
		if(user_pw != user_pw_re) {
			alert("비밀번호 재확인이 잘못되었습니다.")
			return
		}
		
		// 이름 확인
		var user_name = form.user_name.value
		if(user_name == "") {
			alert("이름을 입력해주세요")
			return
		}else {
			if (!regExpName.test(user_name)) {
				alert("이름은 한글만 입력해주세요")
				form.user_name.select()
				return
			}
		}
		
		
		
		//이메일 확인
		var user_email = form.user_email.value
		if(user_email == "") {
			alert("이메일을 입력해주세요")
			return
		}else {
			if (!regExpEmail.test(user_email)) {
				alert("이메일 입력을 확인해 주세요")
				form.user_email.select()
				return
			}
		}
		
		// 주소 확인
		var user_address = form.address1.value
		var user_address_detail = form.address2.value
		if(user_address == "") {
			alert("주소를 입력해주세요")
			return
		}
		if(user_address_detail = "") {
			alert("상세주소를 입력해주세요")
			form.address2.select()
			return
		}
		
		//약관 동의 여부 확인
		var values = document.getElementsByName("check")
		if(!values[0].checked || !values[1].checked) {
			alert("필수 약관에 동의해주세요!")
			return
		}
		
		// 아이디 중복체크 확인 여부
		if(isCheckedId == false) {
			alert("아이디 중복체크를 해주세요")
			return
		}
		// 핸드폰 번호 중복체크 확인 여부
		if(isCheckedPhone == false) {
			alert("핸드폰 번호 중복체크를 해주세요")
			return
		}
		
		
		document.signupForm.submit();
	}
</script>
<!-- 약관 동의 체크박스 설정 -->
<script type="text/javascript">
	
	function checkSelectAll() {
		// 체크박스 전체 선택
		const checkboxes = document.querySelectorAll('input[name="check"]')
		// 선택된 체크박스
		const checked = document.querySelectorAll('input[name="check"]:checked')
		// selectall 체크박스
		const selectAll = document.querySelector('input[name="selectall"]')
		
		if (checkboxes.length === checked.length) {
			selectAll.checked = true
		}else {
			selectAll.checked = false
		}
		
		if(checkbox.checked === false) {
			selectall.checked = false
		}
	}
	
	// select all 누를시 전체 선택하기
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('check');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
	}
	
	
	
</script>
<!-- 주소 api 불러오기 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr+extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>
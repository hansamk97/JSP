/**
 * 
 */
//회원가입 폼 value 확인하는 자바 스크립트
function sendit() {

	// 변수 선언
	let fr = document.joinForm;
	let id = fr.userid;
	let pw = fr.userpw;
	let pw_re = fr.userpw_re;
	let name = fr.username;
	let phone = fr.userphone;


	// 아이디 "" 체크, alert(), focus()
	if (id.value == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}

	// 아이디 5자 이상, 16자 미만
	if (id.value.length <= 4 || id.value.length >= 16) {
		alert("아이디는 5자 이상, 16자 미만으로 입력해주세요.");
		id.focus();
		return false;
	}

	// 비밀번호 "" 체크, alert(), focus()
	if (pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	}

	// 비밀번호 8자 이상
	if (pw.value.length < 8) {
		alert("비밀번호는 8자 이상으로 입력해주세요.");
		pw.focus();
		return false;
	}

	// 비밀번호 == 비밀번호 확인
	if (pw_re.value != pw.value) {
		alert("비밀번호를 확인해주세요.");
		pw_re.focus();
		return false;
	}

	if (name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}

	// 휴대폰 번호 "" 체크, alert(), focus()
	if (phone.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		phone.focus();
		return false;
	}
	// 중복 시 회원가입 안되도록
	/*	if( checkId != "ok" ){
			alert("아이디가 중복 되었습니다.");
			id.focus();
			return false;
		}*/

	// submit() 전송
	fr.submit();
}

// 로그인 시 validation check
function logincheck() {
	let fr = document.frm;
	let id = frm.userid;
	let pw = frm.userpw;

	if (id.value == "") {
		alert("아이디를 입력하세요.")
		id.focus();
		return false;
	}

	if (pw.value == "") {
		alert("비밀번호를 입력하세요.")
		pw.focus();
		return false;

	}
	fr.submit();
}

// 아이디 중복 체크
function checkId(userid) {
	//alert(userid);
	if (userid == "") {
		alert("아이디를 입력해주세요");
		userid.focus();
		return false;
	} else {
		// ajax 통신
		let xhr = new XMLHttpRequest();
		// 요청
		xhr.open("GET", "idcheck.jsp?userid=" + userid, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			// 응답, 성공한 경우
			if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				if (xhr.responseText.trim() == "ok") {
					// ok
					document.getElementById("text").innerHTML = "사용할 수 있는 아이디 입니다.";
				} else {
					// not-ok
					document.getElementById("text").innerHTML = "사용할 수 없는 아이디 입니다.";
				}

			}
		}
	}
}

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
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}


















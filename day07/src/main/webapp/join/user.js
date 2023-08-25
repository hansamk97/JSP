/**
 * 
 */
//회원가입 폼 value 확인하는 자바 스크립트
function sendit(){
	
	// 변수 선언
	let fr = document.joinForm;
	let id = fr.userid;
	let pw = fr.userpw;
	let pw_re = fr.userpw_re;
	let name = fr.username;
	let phone = fr.userphone;
	
	
	// 아이디 "" 체크, alert(), focus()
	if( id.value == "" ){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	
	// 아이디 5자 이상, 16자 미만
	if( id.value.length <= 4 || id.value.length >= 16 ){
		alert("아이디는 5자 이상, 16자 미만으로 입력해주세요.");
		id.focus();
		return false;
	}
	
	// 비밀번호 "" 체크, alert(), focus()
	if( pw.value == "" ){
		alert("비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	}
	
	// 비밀번호 8자 이상
	if( pw.value.length < 8 ){
		alert("비밀번호는 8자 이상으로 입력해주세요.");
		pw.focus();
		return false;
	}
	
	// 비밀번호 == 비밀번호 확인
	if( pw_re.value != pw.value ){
		alert("비밀번호를 확인해주세요.");
		pw_re.focus();
		return false;
	}

	if( name.value == "" ){
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	
	// 휴대폰 번호 "" 체크, alert(), focus()
	if( phone.value == "" ){
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
function logincheck(){
	let fr = document.frm;
	let id = frm.userid;
	let pw = frm.userpw;
	
	if( id.value == "" ){
		alert("아이디를 입력하세요.")
		id.focus();
		return false;
	}

	if( pw.value == "" ){
		alert("비밀번호를 입력하세요.")
		pw.focus();
		return false;
		
	}
	fr.submit();
}

// 아이디 중복 체크
function checkId(userid){
	//alert(userid);
	if( userid == "" )	{
		alert( "아이디를 입력해주세요" );
		userid.focus();
		return false;
	}else{
		// ajax 통신
		let xhr = new XMLHttpRequest();
		// 요청
		xhr.open("GET", "idcheck.jsp?userid="+userid, true);
		xhr.send();
		xhr.onreadystatechange = function(){
	   		// 응답, 성공한 경우
	   		if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				if( xhr.responseText.trim() == "ok" ){
					// ok
					document.getElementById("text").innerHTML = "사용할 수 있는 아이디 입니다.";
				}else{
					// not-ok
					document.getElementById("text").innerHTML = "사용할 수 없는 아이디 입니다.";
				}
				
			}
		}		
	}
}


















 	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Join</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/nav.jsp" />
	<h1>Member Join</h1>

	<form action="./memberJoin" method="post" id="frm" enctype="multipart/form-data">

		<div class="container">
			<div class="form-group">
				<label for="id">ID :</label> <input type="text" class="form-control"
					id="id" placeholder="Enter id" name="id"> <span
					id="idResult"></span>
			</div>
			<div class="form-group">
				<label for="pw">PASSWORD :</label> <input type="password"
					class="form-control" id="pw" placeholder="Enter password" name="pw">
				<br> <input type="password" class="form-control" id="pwChk"
					placeholder="Enter password check" name="pwChk">
					<span
					id="pwResult"></span>
			</div>
			<div class="form-group">
				<label for="name">NAME :</label> <input type="text"
					class="form-control" id="name" placeholder="Enter name" name="name">
				<span id="nameResult"></span>
			</div>
			<div class="form-group">
				<label for="email">E-MAIL :</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email">
					<span id="emailResult"></span>
			</div>
			<div class="form-group">
				<label for="birth">BIRTH :</label> <input type="text"
					class="form-control" id="birth" placeholder="Enter yyyy-mm-dd"
					name="birth">
					<span id="birthResult"></span>
			</div>
			<div class="gender">
				<label> 남자 : <input type="radio" id="M" name="gender"
					value="M"> 여자 : <input type="radio" id="F" name="gender"
					value="F">
					<span id="genderResult"></span>
				</label>
			</div>
			<div class="form-group">
				<label for="file">FILE :</label> <input type="file"
					class="form-control" id="file"
					name="file">
					<span id="fileResult"></span>
			</div>
			<input type="button" id="join" class="btn btn-default" value="Join">
		</div>
	</form>
<script type="text/javascript">
	var idCheck = false; //false: 중복된 아이디 또는 중복 검사를 하지 않은 경우
						//true	: 중복되지 않은 아이디
	var emailCheck = false; //false: 중복된 아이디 또는 중복 검사를 하지 않은 경우
						//true	: 중복되지 않은 아이디
	var id = $("#id").val();
	var pw = $("#pw").val();
	var name = $("#name").val();
	var email = $("#id").val();
	var birth = $("#birth").val();
	var gender = $("#gender").val();
	
	$("#join").click(function() {
		if (idCheck) {
			$("#frm").submit();
		}
		
		
		
		
		/* if (data=='pass') {
			$("#idResult").html('사용 가능한 아이디');
			$("#idResult").attr("class", "text-success");
			idCheck = true;
		}
		else if (data=='pass') {
			$("#emailResult").html('사용 가능한 이메일');
			$("#emailResult").attr("class", "text-success");
			idCheck = true;
		}
		else if ($("#id").val() == "") {
			$("#idResult").html('아이디를 입력하세요.');
             $("#id").focus();
				return false;	 
		}
		else if (pw == "") {
			$("#pwResult").html('비밀번호를 입력하세요.');
			 $("#pw").focus();
				return false;	 
		}
		else if (name == "") {
			$("#nameResult").html('이름을 입력하세요.');
			 $("#name").focus();
				return false;	 
		}
		else if (email == "") {
			$("#emailResult").html('이메일을 입력하세요.');
			 $("#email").focus();
				return false;	 
		}
		else if (birth == "") {
			$("#birthResult").html('생일을 입력하세요.');
			 $("#birth").focus();
				return false;	 
		}
		else if (gender != "F" && gender != "M") {
			$("#genderlResult").html('성별을 선택하세요.');
		} */
	});


	/* ajax
	$("#id").blur(function(){
	var id = $(this).val();
    $.ajax({url: "./memberCheckId?id="+id, success: function(data){
    	data = data.trim();
    	$("#idResult").html(data); 
      }
    });
  }); */
	
	$("#id").blur(function(){
		var id = $(this).val();
		$.post("./memberCheckId", {id:id}, function(data) {
			data = data.trim();
			
			if (data=='pass') {
				$("#idResult").html('사용 가능한 아이디');
				$("#idResult").attr("class", "text-success");
				idCheck = true;
			}else{
				$("#idResult").html('중복된 아이디');
				$("#idResult").attr("class", "text-danger");
				idCheck = false;
			/* 	$("#id").val("");
				$("#id").focus(); */
			}
			
		});
	});
  
  $("#email").blur(function(){
		var email = $(this).val();
		$.post("./memberCheckEmail", {email:email}, function(data) {
			data = data.trim();
			
			if (data=='pass') {
				$("#emailResult").html('사용 가능한 email');
				$("#emailResult").attr("class", "text-success");
				idCheck = true;
			}else{
				$("#emailResult").html('중복된 email');
				$("#emailResult").attr("class", "text-danger");
				idCheck = false;
				$("#email").val("");
				$("#email").focus();
			}
			
		});
	});
  
  $('#pwChk').keyup(function() {
		if ($('#pw').val() != $('#pwChk').val()) {
			$("#pwResult").html('암호가 맞지 않습니다.');
		} else {
			$("#pwResult").html('암호가 일치합니다.');
		}
	});
</script>
</body>
</html>
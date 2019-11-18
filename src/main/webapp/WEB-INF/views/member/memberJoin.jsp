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

	<form action="./memberJoin" method="post">

		<div class="container">
			<div class="form-group">
				<label for="id">ID :</label>
				<input type="text" class="form-control" 
				id="id" placeholder="Enter id" name="id">
				<br>
				<input type="button" value="Check" class="btn btn-success" id="checkId">
			</div>
			<div class="form-group">
				<label for="pw">PASSWORD :</label> 
				<input type="password" class="form-control" 
				id="pw" placeholder="Enter password" name="pw"> 
 			<br>
				<input type="password" class="form-control" 
				id="pwChk" placeholder="Enter password check" name="pwChk">
			</div>
			<div class="form-group">
				<label for="name">NAME :</label>
				<input type="text" class="form-control" 
				id="name" placeholder="Enter name" name="name">
			</div>
			<div class="form-group">
				<label for="email">E-MAIL :</label>
				<input type="email" class="form-control" 
				id="email" placeholder="Enter email" name="email">
			</div>
			<div class="form-group">
				<label for="birth">BIRTH :</label>
				<input type="text" class="form-control" 
				id="birth" placeholder="Enter birth" name="birth">
			</div>
			<div class="gender">
				<label> 남자 : <input type="radio" id="M" name="gender" value="M">
					여자 : <input type="radio" id="F" name="gender" value="F">
				</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</div>
	</form>
	<script type="text/javascript">
	$("#checkId").click(function() { //callback함수
		var id = $("#id").val();
		window.open("./memberCheckId?id="+id, "", "width=600, height=300, top=200, left=600");
	});
	
</script>
</body>
</html>
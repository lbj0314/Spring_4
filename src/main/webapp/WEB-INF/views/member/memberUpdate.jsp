<%@page import="com.iu.s4.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Join</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
<c:import url="../layout/nav.jsp" />

	<div class="container" style="padding-bottom: 30px;">
		<h2>Member Update</h2>

		<form action="./memberUpdate" method="post">

			<div class="form-group">
				<label for="id">Id:</label> 
				<input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${member.id}">
				
			</div>

			<div class="form-group">
				<label for="pw">Password:</label> 
				<input type="password" class="form-control" id="pw" name="pw" value="${member.pw}">
			</div>


			<div class="form-group">
				<label for="name">Name:</label> 
				<input type="text" class="form-control" id="name" name="name" value="${member.name}">
			</div>
			
			<div class="form-group">
				<label for="phone">Phone:</label> 
				<input type="number" class="form-control" id="phone" name="phone" value="${member.phone}">
			</div>

			<div class="form-group">
				<label for="email">Email:</label> 
				<input type="email" class="form-control" id="email" name="email" value="${member.email}">
			</div>

	 		<div class="form-group">
				<label for="birth">Birth:</label> 
				<input type="date" class="form-control" id="birth" name="birth" value="${member.birth}">
				
				
			</div> 

			<div class="form-group">
				<label for="gender">Gender: </label> 
					<label class="radio-inline"><input type="radio" name="gender" value="F" id="gender1">F</label> 
					<label class="radio-inline"><input type="radio" name="gender" value="M" id="gender2">M</label>
			</div>

			<button class="btn btn-default">Update</button>

		</form>
	</div>
	
	<script type="text/javascript">
	
	
	if (${member.gender} = 'F') {
		$("#gender1").prop("checked",true);
	} else {
		$("#gender2").prop("checked",true);
	}
	
	
	
	</script>

</body>
</html>
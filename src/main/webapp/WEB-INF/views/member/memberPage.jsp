<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Member Page</h1>
		
		<h1>ID : ${member.id }</h1>
		<h1>email : ${member.email }</h1>
		<h1>birth : ${member.birth }</h1>
		<div>
			<img alt="" src="../resources/upload/member/${member.filename }">
		</div>
		
		<a href="memberDelete">회원 탈퇴</a>
	</div>
</body>
</html>
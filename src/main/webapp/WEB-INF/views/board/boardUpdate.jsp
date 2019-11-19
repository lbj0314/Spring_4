
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board} Update</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/nav.jsp" />

	<h1>${board} Update</h1>

	<form action="./${board}Update" method="post">
			<input type="hidden" id="num" name="num" value="${vo.num }">
		<div class="form-group">
			<label for="title">Title : </label> 
			<input type="text" name="title"
				class="form-control" id="title" placeholder="Enter title" value="${vo.title}">
		</div>
		<div class="form-group">
			<label for="title">Writer : </label> 
			<input type="text" name="writer"
				class="form-control" id="writer" value="${vo.writer}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="contents">Contents : </label>
			<textarea rows="20" cols="" name="contents" class="form-control"
				id="contents" placeholder="Enter contents">${vo.contents}</textarea>
		</div>
		<div class="form-group">
					<label for="file">File : </label>
					<input type="file" name="file" class="form-control" id="file">
				</div>
		<button type="submit" class="btn btn-default">Update</button>
	</form>

</body>
</html>
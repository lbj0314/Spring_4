
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${fn:toUpperCase(board)} UPDATE</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/nav.jsp" />
	<h1>${fn:toUpperCase(board)} UPDATE</h1>
	<form action="./${board}Update" method="post" enctype="multipart/form-data">
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
		
		<div id="files">
					<div class="form-group" >
						<label for="file">File : </label>
						<input type="file" name="file" class="form-control" id="file">
						<input type="button" class="btn btn-danger del" value="Del">
					</div>
				</div>
		<div>
			<c:forEach items="${vo.files}" var="file">
				<div class="form-group" id="f${file.fnum}">
					<label for="file">File : </label>
					<p>${file.oname}</p>
					<input type="button" id="${file.fnum}" class="btn btn-danger del_file" value="Del">
				</div>
			</c:forEach>
		</div>
		
		<input type="button" class="btn btn-success" value="Add File" id="add">
		<button type="submit" class="btn btn-default">Update</button>
	
		<div>
			${vo.contents }
		</div>
		<div>
			<textarea rows="" cols="">${vo.contents }</textarea>
		</div>
	
	</form>
<script type="text/javascript">
	var files = $("#files").html();
	var num = ${fn:length(vo.files)};
	$("#files").empty();
	
	$(".del_file").click(function() {
		var fnum = $(this).attr("id");

		$.post("./fileDelete", {fnum : fnum}, function(data) {
			data = data.trim();
			if(data == '1'){
				$("#f"+fnum).remove();
				num--;
			}
			alert(data);
			
		});
	});
	
	$("#add").click(function() {
		if (num > 4) {
			alert("파일의 갯수는 5개까지 올릴 수 있습니다.");
			return false;
		}
		$("#files").append(files);
		num++
	});
	
	$("#files").on("click", ".del", function() {
		
		$(this).parents(".form-group").remove();
		num--;
	});
	
</script>
</body>
</html>
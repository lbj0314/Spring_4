<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board} Write</title>
<c:import url="../layout/bootStrap.jsp" />
<c:import url="../layout/summernote.jsp"/>
</head>
<body>
<c:import url="../layout/nav.jsp" />
	<h1>${board} Write</h1>
	
	<form action="./${board}Write" method="post" id="frm" enctype="multipart/form-data">
		
				<div class="form-group">
					<label for="title">Title : </label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
				</div>

				<div class="form-group">
					<label for="writer">Writer : </label>
					<input type="text" name="writer" class="form-control" id="writer" placeholder="Enter writer">
				</div>

				<div class="form-group">
					<label for="contents">Contents : </label>
					<textarea name="contents" class="form-control" id="contents" placeholder="Enter contents"></textarea>
				</div>
				<div id="files">
					<div class="form-group" title="parent">
						<label for="file">File : </label>
						<input type="file" name="file" class="form-control" id="file">
						<input type="button" class="btn btn-danger del" value="Del">
					</div>
				</div>
				
				<input type="button" class="btn btn-success" value="Add File" id="add">
				<button type="submit" class="btn btn-default">Write</button>
				

	</form>
<script type="text/javascript">
	$("#contents").summernote({
			 height: 500,
		  minHeight: null,
		  maxHeight: null,
		  callbacks :{
			  onImageUpload: function(files, editor){
				  uploadFile(files[0], this);
			  }, //upload 끝
			  onMediaDelete: function(files, editor) {
				deleteFile(files[0], this);
			} //delete 끝
		  } // callback 끝
	});
	
	function uploadFile(file, editor) {
		//form tag 생성
		var formData = new FormData();
		formData.append('file', file);
		$.ajax({
			data : formData,
			type : "POST",
			url : "./summerFile",
			enctype : "multipart/form-data",
			contentType : false,
			cache : false,
			processData: false,
			success : function(data) {
				data = data.trim();
				data = '../resources/upload/summerFile/'+data;
				$(editor).summernote('insertImage', data);
			}
		});
	}
	
	function deleteFile(file, editor) {
		var filename = $(file).attr("src");
		filename = filename.substring(filename.lastIndexOf("/")+1);
		
		$.ajax({   
			type : "POST",
			url : "summerFileDelete",
			data : {
				file : filename
			},	
			success : function(data) {
				console.log(data);
			}
		});
		
	}
	
	var files = $("#files").html();
	var num = 0;
	//var index = 1;
	
	$("#files").empty();
	
		$("#files").on("click", ".del", function() {
			
			//$(this).parent().remove();
			$(this).parents(".form-group").remove();
			//var i = $(this).attr('title');
			//$("#"+i).remove();
			num--;
		});
		
		
	$("#add").click( function() {
		//var files='<div id="f'+index+'"><input type="file"><input type="button" title="f'+index+'" class="del" value="del">';
		if (num > 4) {
			alert("파일의 갯수는 5개까지 올릴 수 있습니다.");
		}
		$("#files").append(files);
		num++;
	});
	

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<title>Home</title>
<c:import url="./layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="./layout/nav.jsp" />
<div class="container">
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<div id="noticeResult">
	
	
	</div>
	<div>
		<select id="select">
			<option value="dog">dog</option>
			<option value="cat">cat</option>
			<option vaule="bird">bird</option>
		</select>
		<div id="kind">
			<select>
				<option>시바</option>
				<option>골든 리트리버</option>
				<option>웰시코기</option>
			</select>
		</div>
	</div>

	<input type="text" id="num">
	<button id="btn">Number</button>

	<div id="result">
	
	</div>
</div>


	<script type="text/javascript">
	$(document).ready(function() {
		var xmlhttp;
		
		if (XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp = new ActiveObject("Microsoft.XMLHTTP");
		}
		
		//요청 정보
		xmlhttp.open("GET", "./notice/noticeResult");
		
		//전송방식 GET
		xmlhttp.send();
	
		//결과 처리
		xmlhttp.onreadystatechange = function() {
			if (this.readyState ==4 && this.status == 200) {
				$("#noticeResult").html(this.responseText);
			
				}
			};
		});	
	
	
	$("#btn").click(function() {

	var xmlhttp;
	
	if (window.XMLHttpRequest) {
	   // code for modern browsers
	   xmlhttp = new XMLHttpRequest();
	 } else {
	   // code for old IE browsers
	   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	var num = $("#num").val();
	//request 정보
	xmlhttp.open("POST", "./testAjax");
	//Get
	//xmlhttp.send();
	//POST
	//xmlhttp.send("파라미터");
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("num="+num);
	
	xmlhttp.onreadystatechange = function() {
		if (this.readyState ==4 && this.status == 200) {
			//document.getElementById("result").innerHTML = this.responseText;
			$("#result").html(this.responseText);
		
			}
		};
	});
	
	$("#select").change(function() {
		var xmlhttp;	
		//1. XMLHttpRequest 객체 생성
		if (window.XMLHttpRequest) {
		   xmlhttp = new XMLHttpRequest();
		 } else {
		   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		//2. request 정보 생성
		//GET
		xmlhttp.open("GET", "./selectAnimal?kind="+$("#select").val());
		//POST
		//xmlhttp.open("POST", "./selectAnimal);
		//3. 전송 방식
		//GET
		xmlhttp.send();
		//POST
		//xmlhttp.send("파라미터");
		//xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		//4. 결과 처리
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				$("#kind").html(this.responseText);
				}
			};
		});
</script>
</body>
</html>

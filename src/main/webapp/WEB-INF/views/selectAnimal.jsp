<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<select>
	<c:forEach items="${animal}" var ="a">
		<option>${a}</option>
	</c:forEach>
	</select>
	

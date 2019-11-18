<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<c:forEach items="${list}" var="vo">
		<ul>
				
					<li>${ vo.num }</li>	
					<li>
					<a href="./notice/noticeSelect?num=${ vo.num }">${ vo.title }</a>
					</li>
					<li>${ vo.writer }</li>
					<li>${ vo.reg_date }</li>
					<li>${ vo.hit }</li>
				
		</ul>
			</c:forEach>
<%@page import="com.company.domain.fBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
    <div class="container">
            <div class="row">
             <div class="col-2 col-md-10" >
             <h1>FAQ 게시판</h1>
<table class="table">
			<thead>
				<tr class="text-center" style="background: #E6E6F2;">
					<th style="width: 10%">글번호</th>
					<th style="width: 55%">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test='${list.isEmpty()}'>
					<tr>
						<td colspan="4"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>
					</tr>
				</c:if>
		
					<c:forEach var="vo" items="${list}">
						<tr>
							<td style="text-align: center;">${vo.fbno}</td>
							<td><a href="/fBoard/fread?fbno=${vo.fbno}" class="move">${vo.ftitle}</a></td>
							<td style="text-align: center;">${vo.fwriter}</td>
							<td style="text-align: center;"><fmt:formatDate	value="${vo.fregdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
			
			</tbody>
		</table>
		<div><button><a href="/fBoard/fBoardWriter">글작성</a></button>
		</div>
		</div>
		</div>
		</div>
		
</body>
</html>
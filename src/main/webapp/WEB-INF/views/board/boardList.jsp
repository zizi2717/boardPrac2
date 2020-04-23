<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
</style>
<body>
	<h2>게시판</h2>
	<br><br><br>
	<div id="outter">
		<table border="1">
			<tr align="center">
				<td>No.</td>
				<td width="50%">제목</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>조회수</td>		
			</tr>
			<c:forEach items="${viewAll }" var="list">
				<tr>
					<td>${list.seq }</td>
					<td><a href='detail?seq=${list.seq }'>${list.title }</a></td>
					<td>${list.writer }</td>
					<td><fmt:formatDate value="${list.regdate }" pattern="yyyy.MM.dd"/> </td>
					<td>${list.cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'">
	</div>
</body>
</html>
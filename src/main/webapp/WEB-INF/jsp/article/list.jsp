<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Article List</title>
</head>
<body>
	<h1>Article List</h1>
<p><a href="/usr/article/write">새 글 작성</a></p>
	<table border="1" cellpadding="6">
		<tr>
			<th>Thumb</th>
			<th>ID</th>
			<th>RegDate</th>
			<th>Title</th>
			<th>Member</th>
			<th>Action</th>
		</tr>
		<c:forEach var="a" items="${articles}">
			<tr>
				<!-- 썸네일 -->
				<td>
					<c:if test="${not empty a.thumbImg}">
						<img src="/upload/${a.thumbImg}" style="height:40px"/>
					</c:if>
				</td>
				<td>${a.id}</td>
				<td>${a.regDate}</td>
				<td><a href="/usr/article/detail?id=${a.id }">${a.title}</a></td>
				<td>${a.memberId}</td>
				<td>
					<a href="/usr/article/modify?id=${a.id }">수정</a>|
					<a href="/usr/article/delete?id=${a.id }" onclick="return confirm('삭제할까요?');">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
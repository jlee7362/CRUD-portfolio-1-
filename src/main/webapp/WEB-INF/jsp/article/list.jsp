<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Article List</title>
</head>
<body>
	<h1>Article List</h1>

	<table border="1" cellpadding="6">
		<tr>
			<th>ThumbN</th>
			<th>ID</th>
			<th>Registration Date</th>
			<th>Title</th>
			<th>Member ID</th>
		</tr>
		<c:forEach var="article" items="${articles}">
			<tr>
				<!-- 썸네일 -->
				<td>
					<c:if test="${not empty article.thumbImg}">
						<img src="/upload/${article.thumbImg}" width="80" height="60" style="object-fit:cover;">
					</c:if>
				</td>
				<td>${article.id}</td>

				<td>${article.regDate}</td>
				<td>
					<a href="detail?id=${article.id }">${article.title}</a>
				</td>
				<td>${article.memberId}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="write">글 작성</a>
	</div>

</body>
</html>
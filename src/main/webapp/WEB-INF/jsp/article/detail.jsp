<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Article Detail</title>
</head>
<body>
	<h1>Article #${article.id }번</h1>
	<p>RegDate: ${article.regDate }</p>
	<p>Title: ${article.title }</p>
	<p>Member: ${article.memberId }</p>
	<c:if test="${not empty article.thumbImg }">
		<p><img src="/upload/${article.thumbImg }"style="max-width: 360px"/></p>
	</c:if>

	<p>
		<a href="/usr/article/list">목록</a>
		<a href="/usr/article/modify?id=${article.id }">수정</a>|
		<a href="/usr/article/delete?id=${article.id }" onclick="return confirm('삭제할까요?');">삭제</a>
	</p>
</body>
</html>
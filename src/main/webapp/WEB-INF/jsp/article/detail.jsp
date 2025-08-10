<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
	<h1>글 상세보기</h1>
	
	<c:if test="${not empty article.thumbImg }">
		<img src="/upload/${article.thumbImg }" width="100" />
	</c:if>

	<p>ID: ${article.id }</p>
	<p>등록일: ${article.regDate }</p>
	<p>제목: ${article.title }</p>
	<p>작성자 ID: ${article.memberId }</p>

	<div>
		<a href="/usr/article/modify?id=${article.id }">수정</a>
		<a href="/usr/article/delete?id=${article.id }">삭제</a>
		<a href="/usr/article/list">목록</a>

	</div>
</body>
</html>
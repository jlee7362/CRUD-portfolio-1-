<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Modify</title>
</head>
<body>
	<h1>글 수정</h1>

	<form action="/usr/article/modify" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${article.id}" />
		<p>
			<label>제목</label>
			<br />
			<input type="text" name="title" value="${article.title }" required />
		</p>
		<p>
			<label>썸네일(선택: 업로드 시 교체)</label>
			<br />
			<input type="file" name="file" accept=".png,.jpg,.jpeg,.webp" />
		</p>
		<c:if test="${not empty article.thumbImg }">
			<p>현재 이미지:</p>
			<img src="/upload/${article.thumbImg }" style="max-width: 80px" />
		</c:if>
		<p>
		<button type="submit">수정하기</button>
		</p>
	</form>
	<p><a href="/usr/article/detail?id=${article.id }">← 상세</a></p>
</body>
</html>
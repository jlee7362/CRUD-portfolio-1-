<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 수정하기</title>
</head>
<body>
	<h1>글 수정하기</h1>

	<form action="/usr/article/modify" method="POST">
		<input type="hidden" name="id" value="${article.id}"/>
		<div>
			제목: <input type="text" name="title" value="${article.title }" required/>
		</div>
		<div>
			<button type="submit">저장</button>
		</div>
	</form>
</body>
</html>
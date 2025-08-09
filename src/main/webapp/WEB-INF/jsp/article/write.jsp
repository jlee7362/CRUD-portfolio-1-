<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 작성</title>
</head>
<body>
	<h1>글 작성</h1>

	<form action="/usr/article/write" method="POST">
		<div>
			제목: <input type="text" name="title" required>
		</div>
		<div>
			작성자: <input type="number" name="memberId" required>
		</div>
		<div>
			<button type="submit">저장</button>
		</div>

	</form>
</body>
</html>
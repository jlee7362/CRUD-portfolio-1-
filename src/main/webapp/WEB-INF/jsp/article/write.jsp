<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 작성</title>
</head>
<body>
	<h1>글 작성</h1>

	<form action="/usr/article/write" method="POST" enctype="multipart/form-data">
		<p>
			<label>제목</label><br/>
			<input type="text" name="title" required/>
		</p>
		<p>
			<label>작성자 ID</label><br/>
			<input type="number" name="memberId" required>
		</p>
		<p>
			<label>썸네일 이미지(선택)</label><br/>
			<input type="file" name="file" accept=".png,.jpg,.jpeg,.webp"/>
		</p>
			<button type="submit">저장</button>
	</form>
	<p><a href="/usr/article/list">← 목록</a></p>
</body>
</html>
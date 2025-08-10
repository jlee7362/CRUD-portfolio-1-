<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 작성</title>
</head>
<body>
	<h1>글 작성</h1>

	<form action="/usr/article/write" method="POST" enctype="multipart/form-data">
		<div>
			제목: <input type="text" name="title" required>
		</div>
		<div>
			작성자 ID: <input type="number" name="memberId" required>
		</div>
		<div>
			썸네일: <input type="file" name="thumbImgFile" accept="image/*">
		</div>
		<div>
			<button type="submit">저장</button>
		</div>

	</form>
</body>
</html>
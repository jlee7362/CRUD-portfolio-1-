<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<% request.setAttribute("pageTitle", "Modify Article"); %>
<%@ include file="/WEB-INF/jsp/common/head.jspf" %>
<body class="bg-gray-50 text-gray-800">
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<main class="page-wrap">
  <div class="flex items-center justify-between">
    <h1>글 수정</h1>
    <a class="btn-basic" href="/usr/article/detail?id=${article.id}">← 상세</a>
  </div>

  <form action="/usr/article/modify" method="post" enctype="multipart/form-data"
        class="mt-4 bg-white rounded-lg shadow-sm p-4 grid gap-4">
    <input type="hidden" name="id" value="${article.id}"/>

    <label class="grid gap-1">
      <span class="text-sm">제목</span>
      <input class="border rounded px-3 py-2" type="text" name="title" value="${article.title}" required/>
    </label>

    <label class="grid gap-1">
      <span class="text-sm">썸네일(선택: 업로드 시 교체)</span>
      <input class="border rounded px-3 py-2" type="file" name="file" accept=".png,.jpg,.jpeg,.webp"/>
    </label>

    <c:if test="${not empty article.thumbImg}">
      <div>
        <p class="text-sm text-gray-500 mb-2">현재 이미지</p>
        <img src="/upload/${article.thumbImg}" class="h-20 rounded"/>
      </div>
    </c:if>

    <div class="flex gap-2">
      <button type="submit" class="btn-dark">수정하기</button>
      <a class="btn-basic" href="/usr/article/list">취소</a>
    </div>
  </form>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
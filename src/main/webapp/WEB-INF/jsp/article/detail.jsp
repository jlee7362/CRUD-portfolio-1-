<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<% request.setAttribute("pageTitle", "Article Detail"); %>
<%@ include file="/WEB-INF/jsp/common/head.jspf" %>
<body class="bg-gray-50 text-gray-800">
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<main class="page-wrap">
  <div class="flex items-center justify-between">
    <h1>Article #${article.id}</h1>
    <div class="flex gap-2">
      <a class="btn-basic" href="/usr/article/list">← 목록</a>
      <a class="btn-basic" href="/usr/article/modify?id=${article.id}">수정</a>
      <a class="btn-danger" href="/usr/article/delete?id=${article.id}" onclick="return confirm('삭제할까요?');">삭제</a>
    </div>
  </div>

  <div class="mt-4 grid gap-4 sm:grid-cols-2">
    <div class="bg-white rounded-lg shadow-sm p-4">
      <p><strong>RegDate:</strong> ${article.regDate}</p>
      <p><strong>Title:</strong> ${article.title}</p>
      <p><strong>Member:</strong> ${article.memberId}</p>
    </div>
    <div class="bg-white rounded-lg shadow-sm p-4">
      <c:if test="${not empty article.thumbImg}">
        <img src="/upload/${article.thumbImg}" class="max-w-full rounded"/>
      </c:if>
      <c:if test="${empty article.thumbImg}">
        <p class="text-gray-500">썸네일 없음</p>
      </c:if>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<% request.setAttribute("pageTitle", "Home"); %>
<%@ include file="/WEB-INF/jsp/common/head.jspf" %>
<body class="bg-gray-50 text-gray-800">
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<main class="page-wrap">
  <h1>Spring Boot + JSP 정상 작동!</h1>
  <p class="text-gray-600">route:/usr/home/main</p>

  <div class="mt-6 grid gap-4 sm:grid-cols-2">
    <a class="btn-basic text-xl" href="/usr/article/list">→ Article List</a>
    <a class="btn-dark text-xl" href="/usr/article/write">+ 새 글 작성</a>
  </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
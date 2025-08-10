<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<% request.setAttribute("pageTitle", "Articles"); %>
<%@ include file="/WEB-INF/jsp/common/head.jspf" %>
<body class="bg-gray-50 text-gray-800">
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<main class="page-wrap">
  <div class="flex items-center justify-between">
    <h1 class="text-2xl">Article List</h1>
    <a href="/usr/article/write" class="btn-basic">+ 새 글</a>
  </div>

  <table class="table mt-4 bg-white rounded-lg shadow-sm">
    <thead>
      <tr>
        <th>Thumb</th>
        <th>ID</th>
        <th>RegDate</th>
        <th>Title</th>
        <th>Member</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="a" items="${articles}">
        <tr>
          <td>
            <c:if test="${not empty a.thumbImg}">
              <img src="/upload/${a.thumbImg}" class="h-10 rounded"/>
            </c:if>
          </td>
          <td>${a.id}</td>
          <td>${a.regDate}</td>
          <td>
            <a class="underline" href="/usr/article/detail?id=${a.id}">
              ${a.title}
            </a>
          </td>
          <td>${a.memberId}</td>
          <td class="whitespace-nowrap">
            <a class="btn-basic" href="/usr/article/modify?id=${a.id}">수정</a>
            <a class="btn-danger" href="/usr/article/delete?id=${a.id}" onclick="return confirm('삭제할까요?');">삭제</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
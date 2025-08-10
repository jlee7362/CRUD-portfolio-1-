<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Write Article"); %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="/WEB-INF/jsp/common/head.jspf" %>
<body class="bg-gray-50 text-gray-800">
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<main class="page-wrap">
  <div class="flex items-center justify-between">
    <h1>새 글 작성</h1>
    <a class="btn-basic" href="/usr/article/list">← 목록</a>
  </div>

  <form action="/usr/article/write" method="post" enctype="multipart/form-data"
        class="mt-4 bg-white rounded-xl shadow-sm p-5 grid gap-5">

    <!-- 제목 -->
    <label class="grid gap-1">
      <span class="text-sm text-gray-700">제목</span>
      <input type="text" name="title" required
             class="border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900"/>
    </label>

    <!-- 작성자 ID -->
    <label class="grid gap-1">
      <span class="text-sm text-gray-700">작성자 ID</span>
      <input type="number" name="memberId" value="1" min="1" required
             class="border rounded-lg px-3 py-2 w-32 focus:outline-none focus:ring-2 focus:ring-gray-900"/>
    </label>

    <!-- 썸네일 업로드 -->
    <div class="grid gap-3">
      <span class="text-sm text-gray-700">썸네일 (선택)</span>

      <!-- 드롭존 스타일 -->
      <label for="file" id="dropzone"
             class="border-2 border-dashed rounded-xl p-6 text-center cursor-pointer
                    hover:bg-gray-50 transition-colors duration-200">
        <div class="flex flex-col items-center gap-2">
          <div class="text-3xl">📷</div>
          <div class="text-gray-600">
            이미지를 <strong>클릭</strong>하거나 <strong>드래그&드롭</strong> 해주세요
          </div>
          <div class="text-xs text-gray-400">PNG / JPG / JPEG / WEBP · 최대 20MB</div>
        </div>
        <input id="file" name="file" type="file" accept=".png,.jpg,.jpeg,.webp" class="hidden"/>
      </label>

      <!-- 미리보기 -->
      <div id="previewWrap" class="hidden">
        <p class="text-sm text-gray-500 mb-2">미리보기</p>
        <img id="previewImg" class="max-h-48 rounded-lg shadow"/>
      </div>
    </div>

    <!-- 액션 -->
    <div class="flex items-center gap-2">
      <button type="submit" class="btn-dark">작성</button>
      <a class="btn-basic" href="/usr/article/list">취소</a>
    </div>
  </form>
</main>

<!-- 간단 프리뷰 스크립트 -->
<script>
  (function () {
    const dz = document.getElementById('dropzone');
    const input = document.getElementById('file');
    const previewWrap = document.getElementById('previewWrap');
    const previewImg = document.getElementById('previewImg');

    // 클릭으로도 파일 선택
    dz.addEventListener('click', () => input.click());

    // 드래그&드롭
    ['dragenter', 'dragover'].forEach(evt =>
      dz.addEventListener(evt, e => { e.preventDefault(); dz.classList.add('bg-gray-50'); })
    );
    ['dragleave', 'drop'].forEach(evt =>
      dz.addEventListener(evt, e => { e.preventDefault(); dz.classList.remove('bg-gray-50'); })
    );
    dz.addEventListener('drop', e => {
      if (e.dataTransfer?.files?.length) {
        input.files = e.dataTransfer.files;
        handleFile(input.files[0]);
      }
    });

    // 파일 선택 시 미리보기
    input.addEventListener('change', () => {
      if (input.files?.length) handleFile(input.files[0]);
    });

    function handleFile(file) {
      if (!file) return;
      const ok = ['image/png','image/jpeg','image/jpg','image/webp'].includes(file.type);
      const max = 20 * 1024 * 1024;
      if (!ok) { alert('PNG/JPG/JPEG/WEBP만 가능합니다.'); input.value=''; return; }
      if (file.size > max) { alert('최대 20MB까지 업로드 가능합니다.'); input.value=''; return; }

      const reader = new FileReader();
      reader.onload = (e) => {
        previewImg.src = e.target.result;
        previewWrap.classList.remove('hidden');
      };
      reader.readAsDataURL(file);
    }
  })();
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
// 현재 연도
document.addEventListener('DOMContentLoaded', () => {
  const y = document.getElementById('year');
  if (y) y.textContent = new Date().getFullYear();

  // 간단 active 처리
  const path = location.pathname;
  const homeLink = document.querySelector('[data-nav="home"]');
  const articleLink = document.querySelector('[data-nav="article"]');

  if (path.startsWith('/usr/article/')) {
    articleLink?.classList.add('active');
  } else {
    homeLink?.classList.add('active');
  }
});
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--<%@ page contentType="text/html; charset=UTF-8" %>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ハンバーガーメニュー</title>

<style>
/* ===== 共通 ===== */
body {
    margin: 100px;
    font-family: serif;
}

/* ハンバーガーアイコン */
.hamburger {
    width: 30px;
    height: 24px;
    cursor: pointer;
    position: fixed;
    top: 15px;
    left: 15px;
    z-index: 100;
}

.hamburger span {
    display: block;
    height: 4px;
    background: #f33;
    margin: 5px 0;
}

/* メニュー */
.menu {
    position: fixed;
    top: 0;
    left: -200px;   /* 初期は非表示 */
    width: 200px;
    height: 100%;
    background: #f0f0f0;
    transition: left 0.3s;
    padding-top: 60px;
}

/* 表示状態 */
.menu.active {
    left: 0;
}

.menu a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #33f;
}
</style>
</head>

<body>
<h1>asdf</h1>
<!-- ハンバーガーボタン -->
<div class="hamburger" onclick="toggleMenu()">
    <span></span>
    <span></span>
    <span></span>
</div>

<!-- メニュー -->
<div class="menu" id="menu">
    <a href="index.jsp">ホーム</a>
    <a href="list.jsp">一覧</a>
    <a href="logout.jsp">ログアウト</a>
</div>
<script>
function toggleMenu() {
    const menu = document.getElementById("menu");
    menu.classList.toggle("active");
}
</script>
</body>
</html>


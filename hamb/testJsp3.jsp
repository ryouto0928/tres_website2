<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hamburger Menu Vanilla JS</title>
<style>
/* ハンバーガーアイコンのスタイル */
.menu-trigger {
	display: inline-block;
	width: 40px;
	height: 32px;
	cursor: pointer;
	position: fixed; /* 画面に固定 */
	top: 20px;
	left: 20px;
	z-index: 100;
}

.menu-trigger span {
	display: inline-block;
	width: 100%;
	height: 4px;
	background-color: #333;
	position: absolute;
	transition: all .4s;
	border-radius: 2px;
}

.menu-trigger span:nth-of-type(1) {
	top: 0;
}

.menu-trigger span:nth-of-type(2) {
	top: 14px;
}

.menu-trigger span:nth-of-type(3) {
	bottom: 0;
}

/* アクティブ時（×印）のスタイル */
.menu-trigger.active span {
	background-color: #fff;
} /* 背景が暗くなるので白に変更 */
.menu-trigger.active span:nth-of-type(1) {
	transform: translateY(14px) rotate(-45deg);
}

.menu-trigger.active span:nth-of-type(2) {
	opacity: 0;
}

.menu-trigger.active span:nth-of-type(3) {
	transform: translateY(-14px) rotate(45deg);
}

/* 全画面メニュー（初期状態は非表示） */
#overlay-menu {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.9);
	z-index: 50;
	/* 中央揃えの設定 */
	display: flex;
	justify-content: center;
	align-items: center;
	/* アニメーション用の初期設定 */
	opacity: 0;
	visibility: hidden;
	transition: opacity 0.3s, visibility 0.3s;
}

/* メニュー表示中の設定 */
#overlay-menu.open {
	opacity: 1;
	visibility: visible;
}

/* 中央のボタン */
.center-btn {
	padding: 15px 40px;
	font-size: 1.2rem;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<!-- ハンバーガーボタン -->
	<div class="menu-trigger" id="js-hamburger">
		<span></span> <span></span> <span></span>
	</div>

	<!-- 全画面オーバーレイ -->
	<nav id="overlay-menu">
		<!-- ボタン部分の書き換え -->
		<button class="center-btn" onclick="location.href='next.jsp'">
			注文</button>
		<button class="center-btn" onclick="location.href='next.jsp'">
			注文確認</button>
		<button class="center-btn" onclick="location.href='next.jsp'">
			メニュー登録</button>
		<button class="center-btn" onclick="location.href='next.jsp'">
			通知先確認</button>
	</nav>


	<script>
        // DOMの読み込み完了後に実行
        document.addEventListener('DOMContentLoaded', () => {
            const hamburger = document.getElementById('js-hamburger');
            const menu = document.getElementById('overlay-menu');

            hamburger.addEventListener('click', () => {
                // クラスの付け外し
                hamburger.classList.toggle('active');
                menu.classList.toggle('open');
            });

            // メニュー背景をクリックしたときも閉じるようにする場合
            menu.addEventListener('click', (e) => {
                if (e.target === menu) { // ボタンそのものではなく背景をクリックしたか判定
                    hamburger.classList.remove('active');
                    menu.classList.remove('open');
                }
            });
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- スマホで正しく表示させるための必須設定 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Smartphone Menu</title>
<style>
/* --- 全体設定 --- */
body {
	margin: 0;
	font-family: sans-serif;
}

/* --- ハンバーガーアイコン（サイズと位置を画面幅に連動） --- */
.menu-trigger {
	display: inline-block;
	/* 画面横幅の18%のサイズにする（画面サイズに応じて自動で拡大縮小） */
	width: 18vw;
	height: 15vw;
	cursor: pointer;
	position: fixed;
	/* 配置位置をパーセントで指定 */
	top: 6%;
	right: 5%;
	z-index: 100;
}

.menu-trigger span {
	display: inline-block;
	width: 100%;
	/* 線の太さも画面幅に連動させるとバランスが良い */
	height: 2.4vw;
	background-color: #333;
	position: absolute;
	transition: all .4s;
	border-radius: 1vw;
}

/* 線の位置調整（ここはアイコン内での割合なので%が最適） */
.menu-trigger span:nth-of-type(1) {
	top: 0;
}

.menu-trigger span:nth-of-type(2) {
	top: calc(50% - 1.2vw);
}

.menu-trigger span:nth-of-type(3) {
	bottom: 0;
}

/* アクティブ時（×印）の調整 */
.menu-trigger.active span:nth-of-type(1) {
	transform: translateY(6.3vw) rotate(-45deg);
}

.menu-trigger.active span:nth-of-type(2) {
	opacity: 0;
}

.menu-trigger.active span:nth-of-type(3) {
	transform: translateY(-6.3vw) rotate(45deg);
}

/* --- 全画面メニュー（オーバーレイ） --- */
#overlay-menu {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.9);
	z-index: 50;
	display: flex; /* display: justify-content: align-items: この３つの指定で画面中央配置できる */
	justify-content: center;
	align-items: center;
	opacity: 0;
	visibility: hidden;
	transition: opacity 0.3s, visibility 0.3s;
}

#overlay-menu.open {
	opacity: 1;
	visibility: visible;
}

/* ボタンをまとめるコンテナ */
.menu-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
	width: 100%; /* コンテナを横幅いっぱいに */
	padding: 0 30px; /* 左右に少しだけ余白を作る（画面端にベタ付かないよう） */
	box-sizing: border-box;
}

/* --- ボタンのデザイン（スマホ横幅いっぱい） --- */
.center-link-btn {
	display: block; /* block要素にして横に広げる */
	width: 100%; /* 横幅いっぱい */
	height: 100%;
	text-align: center;
	padding: 20px 0; /* 高さを出して押しやすく */
	font-size: 1.2rem;
	font-weight: bold;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 10px; /* 少し角を丸く */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	transition: all 0.2s;
	box-sizing: border-box;
}

.center-link-btn.clicked {
	background-color: #ffc107 !important;
	color: #333 !important;
	transform: scale(0.95);
}
</style>
</head>
<body>

	<div class="menu-trigger" id="js-hamburger">
		<span></span> <span></span> <span></span>
	</div>

	<nav id="overlay-menu">
		<div class="menu-container" id="js-menu-container">
			<a href="page1.jsp" class="center-link-btn">マイページ</a> <a
				href="page2.jsp" class="center-link-btn">お知らせ</a> <a
				href="page3.jsp" class="center-link-btn">設定</a> <a href="page4.jsp"
				class="center-link-btn">ログアウト</a>
		</div>
	</nav>

	<script>
        document.addEventListener('DOMContentLoaded', () => {
            const hamburger = document.getElementById('js-hamburger');
            const menu = document.getElementById('overlay-menu');
            const container = document.getElementById('js-menu-container');
            const links = document.querySelectorAll('.center-link-btn');

            hamburger.addEventListener('click', (e) => {
                e.stopPropagation();
                hamburger.classList.toggle('active');
                menu.classList.toggle('open');
            });

            links.forEach(link => {
                link.addEventListener('click', function(e) {
                    this.classList.add('clicked');
                    e.preventDefault();
                    const targetUrl = this.getAttribute('href');
                    setTimeout(() => {
                        window.location.href = targetUrl;
                    }, 300); 
                });
            });

            menu.addEventListener('click', (e) => {
                if (e.target === menu) {
                    hamburger.classList.remove('active');
                    menu.classList.remove('open');
                }
            });

            container.addEventListener('click', (e) => {
                e.stopPropagation();
            });
        });

        // 2026年時点のブラウザでも有効な戻るボタン対策
        window.addEventListener('pageshow', (event) => {
            if (event.persisted) {
                const links = document.querySelectorAll('.center-link-btn');
                links.forEach(link => link.classList.remove('clicked'));
<!--                document.getElementById('js-hamburger').classList.remove('active');-->
<!--                document.getElementById('overlay-menu').classList.remove('open');-->
            }
        });
    </script>
</body>
</html>

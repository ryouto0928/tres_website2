<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Smartphone Menu - Final</title>
<style>
/* --- 全体設定 --- */
body {
	margin: 0;
	font-family: sans-serif;
	overflow-x: hidden;
	background-color: #f4f4f4;
}

/* --- ハンバーガーアイコン（サイズ・位置：相対指定） --- */
.menu-trigger {
	display: inline-block;
	width: 18vw; /* 幅 W = 18vw */
	height: 15vw; /* 高さ H = 15vw */
	cursor: pointer;
	position: fixed;
	top: 6%; /* 画面上端から3% */
	right: 10%; /* 画面右端から5% */
	z-index: 100;
}

.menu-trigger span {
	display: inline-block;
	width: 100%;
	height: 2.4vw; /* 太さ T = 2.4vw */
	background-color: #333;
	position: absolute;
	transition: all .4s;
	border-radius: 1vw;
}

/* 理論値計算に基づいた三本線の配置 */
.menu-trigger span:nth-of-type(1) {
	top: 0;
}
/* 2本目：50%の位置から太さ(2.4vw)の半分である1.2vwを引いて中央配置 */
.menu-trigger span:nth-of-type(2) {
	top: calc(50% - 1.2vw);
}

.menu-trigger span:nth-of-type(3) {
	bottom: 0;
}

/* アクティブ時（×印）：計算式 (H - T) / 2 = (15 - 2.4) / 2 = 6.3vw */
.menu-trigger.active span {
	background-color: #fff;
}

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
	display: flex;
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

/* ボタンをまとめるコンテナ（隙間クリック対策） */
.menu-container {
	display: flex;
	flex-direction: column;
	gap: 4vw; /* ボタン間の隙間（相対指定） */
	width: 100%;
	padding: 0 8%; /* 左右に8%の余白 */
	box-sizing: border-box;
}

/* --- ボタンのデザイン（スマホ横幅いっぱい・大型化） --- */
.center-link-btn {
	display: block;
	width: 100%;
	text-align: center;
	padding: 6vw 0; /* 縦方向の幅を大きく */
	font-size: 5vw; /* 文字サイズを画面幅に連動 */
	font-weight: bold;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 2vw;
	box-shadow: 0 1vw 2.5vw rgba(0, 0, 0, 0.3);
	transition: all 0.2s;
	box-sizing: border-box;
}

/* クリック時のフィードバック */
.center-link-btn.clicked {
	background-color: #ffc107 !important; /* オレンジに変更 */
	color: #333 !important;
	transform: scale(0.95);
}

/* ホバー演出（スマホでは主にタップ時） */
.center-link-btn:active {
	opacity: 0.8;
}
</style>
</head>
<body>

	<!-- ハンバーガーアイコン -->
	<div class="menu-trigger" id="js-hamburger">
		<span></span> <span></span> <span></span>
	</div>

	<!-- 全画面オーバーレイ -->
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

            // メニュー開閉
            hamburger.addEventListener('click', (e) => {
                e.stopPropagation();
                hamburger.classList.toggle('active');
                menu.classList.toggle('open');
            });

            // ボタンクリック時の色変更と遷移処理
            links.forEach(link => {
                link.addEventListener('click', function(e) {
                    this.classList.add('clicked');
                    //ブラウザの標準動作（リンクをクリックしたら即座に移動する動作）を一時停止させます。
                    e.preventDefault();
                    const targetUrl = this.getAttribute('href');
                    // 色が変わったのを見せるため少し遅延させて遷移
                    setTimeout(() => {
                        window.location.href = targetUrl;
                    }, 300); 
                });
            });

            // 背景（黒い部分）クリックで閉じる
            menu.addEventListener('click', (e) => {
                if (e.target === menu) {
                    hamburger.classList.remove('active');
                    menu.classList.remove('open');
                }
            });

            // ボタン同士の隙間（コンテナ内）クリックでは閉じないように設定
            container.addEventListener('click', (e) => {
                e.stopPropagation();
            });
        });

        // ブラウザの「戻る」ボタン対策（キャッシュ復元時にリセット）
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

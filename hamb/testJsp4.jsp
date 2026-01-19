<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hamburger Menu 4 Buttons</title>
    <style>
        /* --- ハンバーガーアイコンのスタイル --- */
        .menu-trigger {
            display: inline-block;
            width: 40px;
            height: 32px;
            cursor: pointer;
            position: fixed;
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
        .menu-trigger span:nth-of-type(1) { top: 0; }
        .menu-trigger span:nth-of-type(2) { top: 14px; }
        .menu-trigger span:nth-of-type(3) { bottom: 0; }

        /* アクティブ時（×印） */
        .menu-trigger.active span { background-color: #fff; }
        .menu-trigger.active span:nth-of-type(1) { transform: translateY(14px) rotate(-45deg); }
        .menu-trigger.active span:nth-of-type(2) { opacity: 0; }
        .menu-trigger.active span:nth-of-type(3) { transform: translateY(-14px) rotate(45deg); }

        /* --- 全画面メニュー（オーバーレイ） --- */
        #overlay-menu {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            z-index: 50;
            
            /* 中央揃え & 縦並びの設定 */
            display: flex;
            flex-direction: column; /* 縦に並べる */
            justify-content: center; /* 垂直方向の中央 */
            align-items: center;     /* 水平方向の中央 */
            gap: 20px;               /* ボタン同士の間隔 */

            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s, visibility 0.3s;
        }

        #overlay-menu.open {
            opacity: 1;
            visibility: visible;
        }

        /* --- ボタンのデザイン --- */
        .center-link-btn {
            display: inline-block;
            width: 250px;           /* ボタンの幅を統一 */
            text-align: center;      /* 文字を中央に */
            padding: 15px 0;
            font-size: 1.1rem;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            transition: background-color 0.2s, transform 0.2s;
        }

        .center-link-btn:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* 少し大きくする演出 */
        }
    </style>
</head>
<body>

    <!-- ハンバーガーボタン -->
    <div class="menu-trigger" id="js-hamburger">
        <span></span>
        <span></span>
        <span></span>
    </div>

    <!-- 全画面オーバーレイ -->
    <nav id="overlay-menu">
        <a href="page1.jsp" class="center-link-btn">メニュー1：マイページ</a>
        <a href="page2.jsp" class="center-link-btn">メニュー2：お知らせ</a>
        <a href="page3.jsp" class="center-link-btn">メニュー3：設定</a>
        <a href="page4.jsp" class="center-link-btn">メニュー4：ログアウト</a>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const hamburger = document.getElementById('js-hamburger');
            const menu = document.getElementById('overlay-menu');

            hamburger.addEventListener('click', () => {
                hamburger.classList.toggle('active');
                menu.classList.toggle('open');
            });
            
            // リンクをクリックしたらメニューを閉じる
            const links = document.querySelectorAll('.center-link-btn');
            links.forEach(link => {
                link.addEventListener('click', () => {
                    hamburger.classList.remove('active');
                    menu.classList.remove('open');
                });
            });
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hamburger Menu - Improved</title>
    <style>
        /* --- ハンバーガーアイコン --- */
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

        /* 【追加】ボタンをまとめるコンテナ（ここをクリックしても閉じない） */
        .menu-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 20px; /* 遊びを持たせる */
        }

        /* --- ボタンのデザイン --- */
        .center-link-btn {
            display: inline-block;
            width: 250px;
            text-align: center;
            padding: 15px 0;
            font-size: 1.1rem;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            transition: all 0.2s;
        }

        .center-link-btn.clicked {
            background-color: #ffc107 !important;
            color: #333 !important;
            transform: scale(0.95);
        }

        .center-link-btn:hover:not(.clicked) {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="menu-trigger" id="js-hamburger">
        <span></span>
        <span></span>
        <span></span>
    </div>

    <nav id="overlay-menu">
        <!-- 【修正】ボタンをコンテナで囲む -->
        <div class="menu-container" id="js-menu-container">
            <a href="page1.jsp" class="center-link-btn">メニュー1：マイページ</a>
            <a href="page2.jsp" class="center-link-btn">メニュー2：お知らせ</a>
            <a href="page3.jsp" class="center-link-btn">メニュー3：設定</a>
            <a href="page4.jsp" class="center-link-btn">メニュー4：ログアウト</a>
        </div>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const hamburger = document.getElementById('js-hamburger');
            const menu = document.getElementById('overlay-menu');
            const container = document.getElementById('js-menu-container');
            const links = document.querySelectorAll('.center-link-btn');

            // ハンバーガーボタンのクリック
            hamburger.addEventListener('click', (e) => {
                e.stopPropagation();
                hamburger.classList.toggle('active');
                menu.classList.toggle('open');
            });

            // ボタンクリック時の処理
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

            // 背景クリックで閉じる（ただしコンテナ内は除外）
            menu.addEventListener('click', (e) => {
                if (e.target === menu) {
                    hamburger.classList.remove('active');
                    menu.classList.remove('open');
                }
            });

            // 【追加】コンテナ内のクリックが背景(menu)に伝わらないようにする
            // これによりボタンの隙間をクリックしても閉じなくなります
            container.addEventListener('click', (e) => {
                e.stopPropagation();
            });
        });

        // 戻るボタン対策（2026年時点でも有効な方法）
        window.addEventListener('pageshow', (event) => {
            if (event.persisted) {
                const links = document.querySelectorAll('.center-link-btn');
                links.forEach(link => link.classList.remove('clicked'));
                document.getElementById('js-hamburger').classList.remove('active');
<!--                document.getElementById('overlay-menu').classList.remove('open');-->
            }
        });
    </script>
</body>
</html>

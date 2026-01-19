<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smartphone Menu - Relative Design</title>
    <style>
        /* --- 全体設定 --- */
        body {
            margin: 0;
            font-family: sans-serif;
            overflow-x: hidden;
        }

        /* --- ハンバーガーアイコン（サイズ・位置：相対指定） --- */
        .menu-trigger {
            display: inline-block;
            width: 18vw;  /* H = 12vw */
            height: 15vw; /* H = 10vw */
            cursor: pointer;
            position: fixed;
            top: 3%;      /* 画面上端から3% */
            right: 5%;    /* 画面右端から5% */
            z-index: 100;
        }
        .menu-trigger span {
            display: inline-block;
            width: 100%;
            height: 2.4vw; /* T = 1.2vw */
            background-color: #333;
            position: absolute;
            transition: all .4s;
            border-radius: 1vw;
        }
        
        /* 理論値計算に基づいた配置 */
        .menu-trigger span:nth-of-type(1) { top: 0; }
        .menu-trigger span:nth-of-type(2) { top: calc(50% - 1.2vw); } /* 50% - (1.2/10*100)/2 */
        .menu-trigger span:nth-of-type(3) { bottom: 0; }

        /* アクティブ時（×印）：計算式 (H - T) / 2 = (10 - 1.2) / 2 = 4.4vw */
        .menu-trigger.active span { background-color: #fff; }
        .menu-trigger.active span:nth-of-type(1) { transform: translateY(4.4vw) rotate(-45deg); }
        .menu-trigger.active span:nth-of-type(2) { opacity: 0; }
        .menu-trigger.active span:nth-of-type(3) { transform: translateY(-4.4vw) rotate(45deg); }

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

        /* ボタンをまとめるコンテナ */
        .menu-container {
            display: flex;
            flex-direction: column;
            gap: 4vw;         /* ボタン間の隙間を画面幅基準に */
            width: 100%;
            padding: 0 8%;    /* 左右に8%の余白 */
            box-sizing: border-box;
        }

        /* --- ボタンのデザイン（相対指定で大型化） --- */
        .center-link-btn {
            display: block;
            width: 100%;
            text-align: center;
            /* 縦方向の幅を大きく（paddingをvwで指定） */
            padding: 6vw 0;    
            /* フォントサイズも画面幅に連動 */
            font-size: 5vw;    
            font-weight: bold;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 2vw; /* 角丸も相対指定 */
            box-shadow: 0 1vw 2.5vw rgba(0,0,0,0.3);
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
        <span></span>
        <span></span>
        <span></span>
    </div>

    <nav id="overlay-menu">
        <div class="menu-container" id="js-menu-container">
            <a href="page1.jsp" class="center-link-btn">マイページ</a>
            <a href="page2.jsp" class="center-link-btn">お知らせ</a>
            <a href="page3.jsp" class="center-link-btn">設定</a>
            <a href="page4.jsp" class="center-link-btn">ログアウト</a>
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

        // ブラウザ戻る対策
        window.addEventListener('pageshow', (event) => {
            if (event.persisted) {
                const links = document.querySelectorAll('.center-link-btn');
                links.forEach(link => link.classList.remove('clicked'));
                document.getElementById('js-hamburger').classList.remove('active');
                document.getElementById('overlay-menu').classList.remove('open');
            }
        });
    </script>
</body>
</html>

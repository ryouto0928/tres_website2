<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="theme-color" content="#0000FF">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${applicationScope.appProperties['app.title']}</title>
<style type="text/css">
/* スマートフォン向けのスタイル (例: 画面幅が600px以下の場合) */
@media screen and (max-width: 600px) {
    .container {
        /* スタイルを調整 */
        width: 100%;
        /* ... */
    }
    /* 横並びの要素を縦積みに変更するなど */
    .sidebar {
        display: none; /* 例: サイドバーを非表示にする */
    }
}
</style>
</head>
<body>
<table>
<tr>
<td style="background-color: blue;">
<!-- メニュー  -->
<%@ include file="/WEB-INF/views/menu.jsp" %>
</td>
</tr>
</table>
</body>
</html>
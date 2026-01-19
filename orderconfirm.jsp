<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

　　#table1 {
    border-collapse: collapse;
    border: 1px solid #ccc;
  }
  
  #table1 td.center-cell {
    text-align: center;
  }
  
  td, th {
  	padding: 0px 5px;
  }
</style>
<script type="text/javascript">
// 送信確認を行うJavaScript関数
function confirmAndUpdSubmit() {
    // confirm()メソッドは、OKがクリックされると true、キャンセルなら false を返す
    var isConfirmed = confirm("選択された注文を変更するための画面に移ります、よろしいですか？");

    if (isConfirmed) {
    	document.getElementById('action').value = "変更";
        // OKがクリックされた場合、フォームを送信する
        // document.getElementById('myForm') でフォーム要素を取得し、submit() を実行
        document.getElementById('myForm').submit();
    } else {
        // キャンセルがクリックされた場合、何もしない（フォーム送信は行われない）
        //alert("キャンセルされました");
    }
}
//送信確認を行うJavaScript関数
function confirmAndDelSubmit() {
    // confirm()メソッドは、OKがクリックされると true、キャンセルなら false を返す
    var isConfirmed = confirm("選択された注文をキャンセルします、よろしいですか？");

    if (isConfirmed) {
    	document.getElementById('action').value = "削除";
        // OKがクリックされた場合、フォームを送信する
        // document.getElementById('myForm') でフォーム要素を取得し、submit() を実行
        document.getElementById('myForm').submit();
    } else {
        // キャンセルがクリックされた場合、何もしない（フォーム送信は行われない）
        //alert("キャンセルされました");
    }
}
// 指定された年月日の注文されたメニューを検索後に選択コンボBOXに表示するJavaScript関数
function submitForSearch() {
    	document.getElementById('action').value = "検索";
        // document.getElementById('myForm') でフォーム要素を取得し、submit() を実行
        document.getElementById('myForm').submit();
}
</script>
</head>
<body>
<!-- 処理結果表示  -->
<c:if test="${not empty orderConfirm.message}">
  <ul>
    <c:forEach var="message" items="${orderConfirm.message}">
      <li style="color: red;">${message}</li>
    </c:forEach>
  </ul>
</c:if>

<table>
<tr>
<td style="background-color: blue;white-space: nowrap;vertical-align: top;">
<!-- メニュー  -->
<%@ include file="/WEB-INF/views/menu.jsp" %>
</td>
<td>
&nbsp;&nbsp;
</td>
<td style="background-color: white;">
<!-- 対応画面詳細  -->
&nbsp;&nbsp;&nbsp;注文確認
<br>
<img style="width: 400px; height: 8px;" src="images/Que.jpg" alt="Billiards Cafe Tres">
<form id="myForm" action="orderconfirm" method="post">
  日付:&nbsp;<input size="4" type="text" name="year" value="${orderConfirm.year}">年&nbsp;
           <input size="2" type="text" name="month" value="${orderConfirm.month}">月&nbsp;
           <input size="2" type="text" name="day" value="${orderConfirm.day}">日<br>
  <br>
  <input type="button" name="action" value="検索" onclick="submitForSearch()">
  <input type="button" name="action" value="変更" onclick="confirmAndUpdSubmit(); return false;">
  <input type="button" name="action" value="削除" onclick="confirmAndDelSubmit(); return false;">
  <input id="action" type="hidden" name="action" value="">
  <%-- hidden --%>
  <%-- 一覧表示した年月日 --%>
  <input type="hidden" name="yearDisp" value="${orderConfirm.year}">
  <input type="hidden" name="monthDisp" value="${orderConfirm.month}">
  <input type="hidden" name="dayDisp" value="${orderConfirm.day}">
  <br><br>
  検索結果
<c:if test="${not empty orderConfirm.orderList}">
　　<table id="table1" style="border-collapse: collapse;border: 1px solid #000;">
　　　　<thead>
    　　<tr>
      　　<th style="border: 1px solid #000;">選択</th>
      　　<th style="border: 1px solid #000;">日付</th>
      　　<th style="border: 1px solid #000;">名前</th>
      　　<th style="border: 1px solid #000;">メニュー</th>
    　　</tr>
    </thead>
    <tbody style="border: 1px solid #000;">
  　　<c:forEach var="item" items="${orderConfirm.orderList}">
     <%-- 日付と注文IDとメニューIDと注文者氏名を結合しておくことで、同じメニューでも注文IDで識別する --%>
     <c:set var="menuAndPersonNamePerOrder" value="${item.orderDateStr}-${item.id}-${item.menukanriId}-${item.custmerName}" />
     <tr>
       <td class="center-cell" style="text-align: center;border: 1px solid #000;">
         <input type="checkbox" name="selectedItems" value="${menuAndPersonNamePerOrder}" style="text-align: center;">
       </td>
       <td style="border: 1px solid #000;">
         ${item.orderDateStr}         
       </td>
       <td style="border: 1px solid #000;">
         ${item.custmerName}         
       </td>
       <td style="border: 1px solid #000;">
         ${item.menuName}         
       </td>
     </tr>
  　　</c:forEach>
    </tbody>
  </table>
</c:if>
</form>
</td>
</tr>
</table>
</body>
</html>
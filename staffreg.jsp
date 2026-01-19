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

.test-table-container {
  width: 500px;
  height: 250px; /* コンテナの高さを設定 */
  overflow: none; /* スクロールバーを表示 */
}

.test-table {
  width: 100%;
  border-collapse: collapse; /* セルの境界線を重ねる */
}

.test-table-header {
  display: block; /* ヘッダーをブロック表示 */
  position: sticky;
  top: 0; /* ヘッダーを上部に固定 */
  background-color: #FFF; /* ヘッダーの背景色 */
  z-index: 1; /* スクロールしてもヘッダーが上に表示されるように */
}

.test-table-body {
  display: block; /* ボディをブロック表示 */
  overflow: auto; /* スクロールバーを表示 */
  height: 200px; /* ボディの高さを設定 */
}

.test-table .test-column,
.test-table .test-cell {
  padding: 0px 5px; /* セルの内側にスペースを追加 */
  text-align: center; /* テキストを左揃え */
  border: 1px solid #ddd; /* セルの境界線 */
}

.test-table .test-cell {
  display: table-cell; /* セルをテーブルセルとして表示 */
}
</style>
<script type="text/javascript">
//送信確認を行うJavaScript関数
function confirmAndInsSubmit() {
    // confirm()メソッドは、OKがクリックされると true、キャンセルなら false を返す
    var isConfirmed = confirm("通知先を登録します、よろしいですか？");

    if (isConfirmed) {
    	document.getElementById('action').value = "新規";
        // OKがクリックされた場合、フォームを送信する
        // document.getElementById('myForm') でフォーム要素を取得し、submit() を実行
        document.getElementById('myForm').submit();
    } else {
        // キャンセルがクリックされた場合、何もしない（フォーム送信は行われない）
        //alert("キャンセルされました");
    }
}// 送信確認を行うJavaScript関数
function confirmAndUpdSubmit() {
    // confirm()メソッドは、OKがクリックされると true、キャンセルなら false を返す
    var isConfirmed = confirm("選択された通知先を変更します、よろしいですか？");

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
    var isConfirmed = confirm("選択された通知先を削除します、よろしいですか？");

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
</script>
</head>
<body>
<!-- 処理結果表示  -->
<c:if test="${not empty staffReg.message}">
  <ul>
    <c:forEach var="message" items="${staffReg.message}">
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
&nbsp;&nbsp;&nbsp;通知先登録
<br>
<img style="width: 400px; height: 8px;" src="images/Que.jpg" alt="Billiards Cafe Tres">
<form id="myForm" action="staffreg" method="post">
  通知先：&nbsp;<input type="text" name="staffName" value="${staffReg.staffName}"><br>
  メールアドレス：&nbsp;<input style="width: 250px;" type="text" name="mailAddress" value="${staffReg.mailAddress}">
  <br><br>  
  <input type="submit" name="action" value="新規" onclick="confirmAndInsSubmit(); return false;">
  <input type="submit" name="action" value="変更" onclick="confirmAndUpdSubmit(); return false;">
  <input type="submit" name="action" value="削除" onclick="confirmAndDelSubmit(); return false;">
  <input id="action" type="hidden" name="action" value="">
  <br>
  <div class="test-table-container">
　　<table class="test-table" style="border-collapse: collapse;border: 1px solid #ddd;">
　　　　<thead class="test-table-header">
    　　<tr>
      　　<th class="test-column" style="width: 30px;white-space: nowrap;">選択</th>
      　　<th class="test-column" style="width: 170px;word-break: break-all;">通知先</th>
      　　<th class="test-column" style="width: 300px;word-break: break-all;">メールアドレス</th>
    　　</tr>
    </thead>
    <tbody class="test-table-body" style="border: 1px solid #ddd;">
  　　<c:forEach var="item" items="${staffReg.staffInfoList}">
      <%-- 「通知先ID」と「通知先名」と「メールアドレス」を結合しておくことで、変更時に利用する --%>
      <c:set var="idAndStaffNameAndmailAddress" value="${item.id}/${item.staffName}/${item.mailAddress}" />  
     　<tr>
        <td class="test-cell" style="width: 30px;white-space: nowrap;"><input type="checkbox" name="selectedItems" value="${idAndStaffNameAndmailAddress}"></td>
       　<td class="test-cell" style="width: 170px;word-break: break-all;text-align: left;">${item.staffName}</td>
       　<td class="test-cell" style="width: 300px;word-break: break-all;text-align: left;">${item.mailAddress}</td>
     　</tr>
  　　</c:forEach>
    </tbody>
  </table>
  </div>
</form>
</td>
</tr>
</table>
</body>
</html>
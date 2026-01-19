<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="  display: flex; justify-content: space-around;  align-items: center;">
<form action="/AcsTresOrder/orderaccept" method="POST" style="display: inline;">
    <button type="submit" style="background:none; border:none; color:white; text-decoration:underline; cursor:pointer; padding:0;">
        注文&nbsp;
    </button>
</form>
<!--<br> -->
<form action="/AcsTresOrder/orderconfirm" method="POST" style="display: inline;">
    <button type="submit" style="background:none; border:none; color:white; text-decoration:underline; cursor:pointer; padding:0;">
        注文確認&nbsp;
    </button>
</form>    
<!--<br>-->
<form action="/AcsTresOrder/menureg" method="POST" style="display: inline;">
    <button type="submit" style="background:none; border:none; color:white; text-decoration:underline; cursor:pointer; padding:0;">
        メニュー登録&nbsp;
    </button>
</form>   
<!--<br>-->
<form action="/AcsTresOrder/staffreg" method="POST" style="display: inline;">
    <button type="submit" style="background:none; border:none; color:white; text-decoration:underline; cursor:pointer; padding:0;">
        通知先登録&nbsp;
    </button>
</form>
<!--<br><br>-->
<!--<img style="width: 150px; height: auto;" src="images/Tres.jpg" alt="Billiards Cafe Tres">-->
</div>   
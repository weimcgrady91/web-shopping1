<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<!doctype html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link REL=stylesheet HREF="script/toc.css" TYPE="text/css">
    <script LANGUAGE="JavaScript" src="script/AdminTree.js"></script>
    <style type='text/css'>
        .level1 {
            margin-left: 30px;
        }

        .level2 {
            margin-left: 38px;
        }
        ul {
            margin: 0px;
            color: black;
        }
    </style>
</head>
<body onload="">
<div class="level1" id="head2Parent">
    <span class="outdent">
        <img border="0" name="imEx" src="images/arrowUp.gif"/>用户管理
    </span>
</div>

<div class="level2" id='head2Child'>
    <ul>
        <li><a href="userList.jsp?pageNum=1" target="main">用户列表</a></li>
    </ul>
</div>

<div class="level1" id='head3Parent'>
    <a class="outdent" href="" onclick="return expandIt('head3');">
        <img border="0" name="imEx" src="images/arrowUp.gif"/>产品类别管理
    </a>
</div>

<div class="level2" id='head3Child' style="color: black">
    <ul>
        <li><a href="categoryList.jsp" target="main">类别列表</a></li>
    </ul>
</div>
<div class="level1" id='head4Parent'>
    <a class="outdent" href="" onclick="return expandIt('head3');">
        <img border="0" name="imEx" src="images/arrowUp.gif"/>产品管理
    </a>
</div>

<div class="level2" id='head4Child' style="color: black">
    <ul>
        <li><a href="productList.jsp?pageNum=1" target="main">产品列表</a></li>
        <li><a href="productSearch.jsp?" target="detail">搜索产品</a></li>
    </ul>
</div>

<div class="level1" id='head5Parent'>
    <a class="outdent" href="" onclick="return expandIt('head3');">
        <img border="0" name="imEx" src="images/arrowUp.gif"/>=订单管理
    </a>
</div>

<div class="level2" id='head5Child' style="color: black">
    <ul>
        <li><a href="orderList.jsp?pageNum=1" target="main">产品列表</a></li>
        <li><a href="productSearch.jsp?" target="detail">搜索产品</a></li>
    </ul>
</div>
</body>
</html>

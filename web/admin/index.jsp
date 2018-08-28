<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>

<html>
<head>
    <title>E_Shop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>


<frameset rows="10%,*" >
    <frame src="top.html" scrolling="no">
    <frameset cols="25%,*">
        <frame src="menu.jsp" noresize="noresize">
        <frameset rows="65%,35%">
            <frame src="" name="main" scrolling="yes">
            <frame src="" name="detail" scrolling="no">
        </frameset>
    </frameset>
</frameset>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    session.setAttribute("isUserLogin","false");
    response.sendRedirect("index.jsp");
    session.setAttribute("username", "");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

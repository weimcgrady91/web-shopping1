<%@ page import="java.sql.Connection" %>
<%@ page import="com.weiqun.shopping.util.DBUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.weiqun.shopping.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-24
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    boolean result = false;
    String idStr = request.getParameter("id");
    if (idStr != null && !idStr.equals("")) {
        try {
            int id = Integer.parseInt(idStr);
            User user = new User();
            user.setId(id);
            user.remove();
            out.println("删除成功!");
            result = true;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("删除失败!");
            result = false;
        }

    }
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        window.onload = function(){
            window.parent.main.location.reload();
        }
    </script>
</head>
<body>
</body>
</html>

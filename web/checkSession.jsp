<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String isLogin = (String) session.getAttribute("isUserLogin");
    if (isLogin == null || !isLogin.equals("true")) {
        out.println("请先登录!");
        out.println("<a href='login.jsp'>登录</a>");
        return;
    }
%>

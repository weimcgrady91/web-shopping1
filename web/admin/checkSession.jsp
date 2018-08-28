<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-24
  Time: 下午9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String isLogin = (String) session.getAttribute("adminLogin");
    if (isLogin == null || !isLogin.equals("true")) {
        out.println("权限不足!");
        System.out.println("权限不足!");
        return;
    }
%>

<%@ page import="com.weiqun.shopping.bean.User" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-24
  Time: 上午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");
    if (action != null && action.trim().equals("register")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");

        User user = new User(username, password, phone, addr, new Date());
        if(user.save()){
            session.setAttribute("isUserLogin", "true");
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            out.println("注册失败,请重试!");
        }

    }

%>
<html>
<head>
    <title>Register User</title>
</head>
<body>
<form action="registerUser.jsp" method="post">
    <input type="hidden" name="action" value="register">
    <table border="1">
        <tr>
            <td colspan="2" align="center">用户注册</td>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="username" placeholder="请输入用户名"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" name="password" placeholder="请输入密码"></td>
        </tr>
        <tr>
            <td>电话号码:</td>
            <td><input type="text" name="phone" placeholder="请输入电话号码"></td>
        </tr>
        <tr>
            <td>地址:</td>
            <td><textarea name="addr" cols="60" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交"></td>
        </tr>
    </table>

</form>
</body>
</html>

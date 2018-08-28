<%@ page import="com.weiqun.shopping.util.DBUtils" %>
<%@ page import="com.weiqun.shopping.bean.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-24
  Time: 下午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String username = (String) session.getAttribute("username");
    User user = new User();
    user.setUsername(username);
    if (!user.checkUser()) {
        out.println("用户名不存在!");
        return;
    }

    user = user.findUser();
    if (user == null) {
        out.println("用户名不存在2!");
        return;
    }

    String action = request.getParameter("action");
    if (action != null && action.equals("modify")) {
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        String id = request.getParameter("id");
        User newUser = new User();
        newUser.setId(Integer.parseInt(id));
        newUser.setPassword(password);
        newUser.setPhone(phone);
        newUser.setAddr(addr);
        if(newUser.modify()){
            out.println("修改个人信息成功!");
            out.println("<a href='index.jsp'>首页</a>");
        }
        return;
    }

%>
<!doctype html>
<html>
<head>
    <title>修改个人信息</title>
</head>
<body>
<form action="modifyUser.jsp" method="post">
    <input type="hidden" name="action" value="modify">
    <input type="hidden" name="id" value="<%=user.getId()%>">
    <table border="1">
        <tr>
            <td colspan="2" align="center">用户注册</td>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="username" placeholder="请输入用户名" value="<%=user.getUsername()%>" readonly></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" name="password" placeholder="请输入密码" value="<%=user.getPassword()%>"></td>
        </tr>
        <tr>
            <td>电话号码:</td>
            <td><input type="text" name="phone" placeholder="请输入电话号码" value="<%=user.getPhone()%>"></td>
        </tr>
        <tr>
            <td>地址:</td>
            <td><textarea name="addr" cols="60" rows="10"><%=user.getAddr()%></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交"></td>
        </tr>
    </table>

</form>
</body>
</html>

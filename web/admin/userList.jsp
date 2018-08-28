<%@ page import="com.weiqun.shopping.bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-24
  Time: 下午3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    int pageNum = 1;
    String pageNumStr = request.getParameter("pageNum");
    if (pageNumStr != null && !pageNumStr.equals("")) {
        try {
            pageNum = Integer.parseInt(pageNumStr);
            if (pageNum <= 1) {
                pageNum = 1;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("userList.jsp error pageNumStr");
        }
    }


    List<User> users = new ArrayList<>();
    User user = new User();
    int totalPage = user.getTotalPage();
    user.findUsers(users, pageNum);
%>
<html>
<head>
    <title>用户列表</title>
    <script type="text/javascript">
        function onPageSelected(select) {
            window.location.href = "userList.jsp?pageNum=" + select.value;
            // window.main.location.reload();
        }
    </script>
    <style type="text/css">

    </style>
</head>
<body>
<table align="center" border="1">
    <caption>用户列表</caption>
    <tr>
        <th>id</th>
        <th>用户名</th>
        <th>密码</th>
        <th>电话</th>
        <th>地址</th>
        <th>注册日期</th>
        <th>操作</th>
    </tr>
    <%
        for (int i = 0; i < users.size(); i++) {
    %>
    <tr>
        <td><%=users.get(i).getId()%>
        </td>
        <td><%=users.get(i).getUsername()%>
        </td>
        <td><%=users.get(i).getPassword()%>
        </td>
        <td><%=users.get(i).getPhone()%>
        </td>
        <td><%=users.get(i).getAddr()%>
        </td>
        <td><%=users.get(i).getRdateStr()%>
        </td>
        <td><a href="userDelete.jsp?id=<%=users.get(i).getId() %>" target="detail">删除</a></td>
    </tr>
    <%
        }
    %>
</table>
<div id="pageLimit" style="text-align: center">
    <select name="pageNum" onchange="onPageSelected(this)">
        <%
            for (int i = 1; i <= totalPage; i++) {
        %>
        <option value="<%= i %>" <%= pageNum == i ? "selected" : ""%>>第<%= i %>页</option>
        <%
            }
        %>
    </select>
</div>

</body>
</html>

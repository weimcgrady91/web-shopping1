<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-25
  Time: 下午1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>
<%
    List<Category> categories = new ArrayList<>();
    Category category = new Category();
    category.findAll(categories);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="addCategory.jsp?pid=0&level=1" target="detail">添加类别</a>
<table align="center" border="1">
    <caption>产品类别</caption>
    <tr>
        <th>id</th>
        <th>pid</th>
        <th>名称</th>
        <th>描述</th>
        <th>叶子节点</th>
        <th>层级</th>
        <th colspan="3">操作</th>
    </tr>
    <%
        for (int i = 0; i < categories.size(); i++) {
    %>
    <tr>
        <td><%=categories.get(i).getId()%>
        </td>
        <td><%=categories.get(i).getPid()%>
        </td>
        <td><span
                style="color: #0066FF"><%=categories.get(i).getLevel() > 1 ? categories.get(i).getLevel() == 2 ? "----" : "--------" : ""%></span><%=categories.get(i).getName()%>
        </td>
        <td><%=categories.get(i).getDersc()%>
        </td>
        <td><%=categories.get(i).isIsleaf()%>
        </td>
        <td><%=categories.get(i).getLevel()%>
        </td>
        <td><a href="deleteCategory.jsp?id=<%=categories.get(i).getId()%>" target="detail">删除</a></td>
        <td><a href="modifyCategory.jsp?id=<%=categories.get(i).getId()%>" target="detail">编辑</a></td>
        <td>
            <a href="addCategory.jsp?pid=<%=categories.get(i).getId()%>&level=<%=categories.get(i).getLevel()+1%>" target="detail">添加子类别</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>

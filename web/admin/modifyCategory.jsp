<%@ page import="com.weiqun.shopping.bean.Category" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 18-7-26
  Time: 下午2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.equals("")) {
        out.println("编辑失败");
        return;
    }
    int id = -1;
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("编辑失败id错误!");
        return;
    }

    String action = request.getParameter("action");
    if (action != null && action.equals("modify")) {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        Category category = new Category();
        category.setId(id);
        category.setName(name);
        category.setDersc(desc);
        if (category.modify()) {
            out.println("修改成功!");
            %>
            <script type="text/javascript">
                window.parent.main.location.reload();
            </script>
            <%
            return;
        } else {
            out.println("编辑失败id错误!");
        }
    }

    Category category = new Category();
    category.setId(id);
    category= category.findCategoryById(id);
    if(category==null){
        out.println("编辑失败");
        return;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body style="text-align: center">
<form action="modifyCategory.jsp" method="post">
    <input type="hidden" name="action" value="modify">
    <input type="hidden" name="id" value="<%= id%>">
    名称:<input type="text" name="name" placeholder="填入名称" value="<%=category.getName()%>"><br/>
    描述:<input type="text" name="desc" placeholder="填入描述" value="<%=category.getDersc()%>"><br/>
    <input type="submit" value="提交">
</form>
</body>
</body>
</html>

<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String pidStr = request.getParameter("pid");
    if (pidStr == null || pidStr.equals("")) {
        out.println("添加失败!");
        return;
    }
    int pid = -1;
    try {
        pid = Integer.parseInt(pidStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("添加失败!");
        return;
    }

    String levelStr = request.getParameter("level");
    if (levelStr == null || levelStr.equals("")) {
        out.println("添加失败!");
        return;
    }
    int level = -1;
    try {
        level = Integer.parseInt(levelStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("添加失败!");
        return;
    }
    String action = request.getParameter("action");
    if (action != null && action.equals("add")) {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        Category category = new Category(pid, name, desc);
        if (category.addCategory(pid, level)) {
            out.println("添加成功!");
%>
<script type="text/javascript">
    window.parent.main.location.reload();
</script>
<%
            return;
        } else {
            out.println("添加失败!");
        }

    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<form action="addCategory.jsp" method="post">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="pid" value="<%= pid%>">
    <input type="hidden" name="level" value="<%= level%>">
    名称:<input type="text" name="name" placeholder="填入名称"><br/>
    描述:<input type="text" name="desc" placeholder="填入描述"><br/>
    <input type="submit" value="提交">
</form>
</body>
</html>

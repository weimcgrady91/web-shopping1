<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String idStr = request.getParameter("id");
    int id = -1;
    if (idStr == null || idStr.equals("")) {
        out.println("删除失败");
        return;
    }
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("删除失败!");
        return;
    }
    Category category = new Category();
    category.setId(id);
    if(category.removeCategory(id)){
        out.println("删除成功!");
        %>
<script type="text/javascript">
    window.parent.main.location.reload();
</script>
<%
    } else {
        out.println("删除失败!");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String idStr = request.getParameter("id");
    if (idStr == null) {
        out.println("删除产品失败!");
    }
    int id=-1;
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }
    if(ProductManager.getInstance().removeProduct(id)){
        out.println("删除产品成功!");
        %>
    <script type="text/javascript">
        window.parent.main.location.reload();
    </script>
<%
    } else {
        out.println("删除产品失败!");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

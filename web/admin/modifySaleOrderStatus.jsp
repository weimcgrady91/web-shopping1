<%@ page import="com.weiqun.shopping.manager.SaleOrderManager" %>
<%@ page import="com.weiqun.shopping.bean.SaleOrder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String idStr = request.getParameter("id");
    if (idStr == null) {
        out.println("订单id错误!");
        return;
    }
    int id = -1;
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("订单id错误!");
        return;
    }
    SaleOrder saleOrder = SaleOrderManager.newInstance().findSaleOrder(id);
    if (saleOrder == null) {
        out.println("查找订单失败!");
        return;
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="#" method="post">
    订单状态:
    <select name="status">
        <%
            for (int i = 0; i < 3; i++) {
        %>
        <option value="i" <%=saleOrder.getStatus() == i ? "selected" : ""%>><%=i%>
        </option>
        <%
            }
        %>
    </select>
</form>
</body>
</html>

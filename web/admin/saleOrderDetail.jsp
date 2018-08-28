<%@ page import="com.weiqun.shopping.bean.SaleItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.weiqun.shopping.manager.SaleOrderManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String idStr = request.getParameter("id");
    int id = -1;
    List<SaleItem> saleItems = new ArrayList<>();
    if (idStr != null) {
        id = Integer.parseInt(idStr);
        SaleOrderManager.newInstance().findSaleItems(saleItems, id);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="text-align: center" border="1">
    <caption>订单详情</caption>
    <tr>
        <th>ID</th>
        <th>产品id</th>
        <th>产品单价</th>
        <th>数量</th>
        <th>订单id</th>
    </tr>
    <%
        for (int i = 0; i < saleItems.size(); i++) {
    %>
        <tr>
            <td><%=saleItems.get(i).getId()%></td>
            <td><%=saleItems.get(i).getProductid()%></td>
            <td><%=saleItems.get(i).getUnitprice()%></td>
            <td><%=saleItems.get(i).getPcount()%></td>
            <td><%=saleItems.get(i).getProductid()%></td>
        </tr>
    <%
        }
    %>
</table>
</body>
</html>

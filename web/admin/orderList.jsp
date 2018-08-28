<%@ page import="com.weiqun.shopping.manager.SaleOrderManager" %>
<%@ page import="com.weiqun.shopping.bean.SaleOrder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String pageNumStr = request.getParameter("pageNum");
    int pageNum = 1;
    if (pageNumStr != null) {
        pageNum = Integer.parseInt(pageNumStr);
        if (pageNum <= 0) {
            pageNum = 1;
        }
    }
    List<SaleOrder> saleOrders = new ArrayList<>();
    int pageCount = SaleOrderManager.newInstance().findSaleOrders(saleOrders, pageNum);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="text-align: center" border="1">
    <caption>订单管理</caption>
    <tr>
        <td>UserId</td>
        <td>收货地址</td>
        <td>订单日期</td>
        <td>订单状态</td>
        <td>操作</td>
    </tr>
    <%
        for (int i = 0; i < saleOrders.size(); i++) {

    %>
            <tr>
                <td><%=saleOrders.get(i).getUserid()%></td>
                <td><%=saleOrders.get(i).getAddr()%></td>
                <td><%=saleOrders.get(i).getOdate()%></td>
                <td><%=saleOrders.get(i).getStatus()%></td>
                <td><a href="saleOrderDetail.jsp?id=<%=saleOrders.get(i).getId()%>" target="detail">订单详情</a>
                    &nbsp;&nbsp;
                    <a href="modifySaleOrderStatus.jsp?id=<%=saleOrders.get(i).getId()%>" target="detail">修改状态</a></td>
            </tr>
    <%
        }
    %>
    <tr>
        <td colspan="5">
            <a href="#">上一页</a>&nbsp;&nbsp;
            共<%=pageCount%>页&nbsp;&nbsp;
            <a href="#">下一页</a>
        </td>
    </tr>
</table>
</body>
</html>

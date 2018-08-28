<%@ page import="com.weiqun.shopping.bean.Cart" %>
<%@ page import="com.weiqun.shopping.bean.SaleOrder" %>
<%@ page import="com.weiqun.shopping.manager.SaleOrderManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        out.println("购物车中无商品!");
        return;
    }
    String addr = request.getParameter("addr");

    SaleOrder saleOrder = new SaleOrder();
    saleOrder.setAddr(addr);
    Object useridObj = session.getAttribute("userid");
    if (useridObj == null) {
        saleOrder.setUserid(-1);
    } else {
        saleOrder.setUserid((int) useridObj);
    }
    if (SaleOrderManager.newInstance().saveOrder(saleOrder,cart)) {
        out.println("下单成功!");
        session.removeAttribute("cart");
    } else {
        out.println("下单失败!");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

<%@ page import="com.weiqun.shopping.bean.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String pageNumStr = request.getParameter("pageNum");
    int pageNum = 1;
    try {
        pageNum = Integer.parseInt(pageNumStr);
        if (pageNum <= 0) {
            pageNum = 1;
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("pageNum错误请重试!");
        return;
    }
    List<Product> products = new ArrayList<>();
    int pageTotal = 0;
    String key = "";
    String minnormalprice = "";
    String maxnormalprice = "";
    String minmemberprice = "";
    String maxmemberprice = "";
    String categoryid = "";
    String action = request.getParameter("action");
    if (action != null && action.equals("search")) {
        key = request.getParameter("key");
        minnormalprice = request.getParameter("minnormalprice");
        maxnormalprice = request.getParameter("maxnormalprice");
        minmemberprice = request.getParameter("minmemberprice");
        maxmemberprice = request.getParameter("maxmemberprice");
        categoryid = request.getParameter("categoryid");

        pageTotal = ProductManager.getInstance().findProducts(
                products, key, minnormalprice, maxnormalprice, minmemberprice
                , maxmemberprice, categoryid, pageNum);
    }
%>
<!doctype html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center" border="1">
    <caption>产品列表</caption>
    <tr>
        <th>id</th>
        <th>名称</th>
        <th>描述</th>
        <th>普通价格</th>
        <th>会员价格</th>
        <th>注册日期</th>
        <th>产品类别</th>
        <th colspan="2">操作</th>
    </tr>
    <%
        for (int i = 0; i < products.size(); i++) {
    %>
    <tr>
        <td><%=products.get(i).getId()%>
        </td>
        <td><%=products.get(i).getName()%>
        </td>
        <td><%=products.get(i).getDescr()%>
        </td>
        <td><%=products.get(i).getNormalprice()%>
        </td>
        <td><%=products.get(i).getMemberprice()%>
        </td>
        <td><%=products.get(i).getPdateStr()%>
        </td>
        <td><%=products.get(i).getCategory().getName()%>
        </td>
        <td><a href="deleteProduct.jsp?id=<%=products.get(i).getId()%>" target="detail">删除</a></td>
        <td><a href="modifyProduct.jsp?id=<%=products.get(i).getId()%>" target="detail">编辑</a></td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="3" style="text-align: center">
            <%
                if (action != null && action.equals("search")) {
            %>
            <a href="productSearchList.jsp?pageNum=
<%=pageNum-1%>&action=search&key=<%=key%>&minnormalprice=
<%=minnormalprice%>&maxnormalprice=<%=maxnormalprice%>&minmemberprice=<%=minmemberprice%>&maxmemberprice=
<%=maxmemberprice%>&categoryid=<%=categoryid%>">上一页</a>
            <%
                }
            %>
        </td>
        <td colspan="3" style="text-align: center">共<%=pageTotal%>页,当前第<%=pageNum%>页</td>
        <td colspan="3" style="text-align: center">
            <%
                if (action != null && action.equals("search")) {
            %>
            <a href="productSearchList.jsp?pageNum=
<%=pageNum+1%>&action=search&key=<%=key%>&minnormalprice=
<%=minnormalprice%>&maxnormalprice=<%=maxnormalprice%>&minmemberprice=<%=minmemberprice%>&maxmemberprice=
<%=maxmemberprice%>&categoryid=<%=categoryid%>">下一页</a>
            <%
                }
            %>
        </td>
    </tr>
</table>
</body>
</html>

<%@ page import="com.weiqun.shopping.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    String route = request.getParameter("route");
    if (action != null && action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        if (user.login()) {
            session.setAttribute("isUserLogin", "true");
            session.setAttribute("username", username);
            session.setAttribute("userid",user.getId());
            if (route != null && route.equals("cart")) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            out.println("账号或密码不正确!");
        }
    }
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function validateUserName() {
            alert("aa11");
            var xmlhttp;
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                alert(xmlhttp.readyState);
                if (xmlhttp.readyState==4 )
                {
                    alert(xmlhttp.responseText);
                }
            }
            xmlhttp.open("GET","result.jsp",true);
            xmlhttp.send();
            alert("bb11");
        }
    </script>
</head>
<body style="text-align: center">
<form action="login.jsp" method="post">
    <input type="hidden" name="route" value="<%=route%>">
    <input type="hidden" name="action" value="login"><br/>
    用户名:<input type="text" name="username" onblur="validateUserName();"><br/>
    密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="text" name="password"><br/>
    <input type="submit" value="提交">
</form>
</body>
</html>

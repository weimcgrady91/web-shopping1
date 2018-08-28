<%@ page import="com.weiqun.shopping.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String username = null;
	boolean isLogin = false;
	String isUserLogin = (String) session.getAttribute("isUserLogin");
	if (isUserLogin != null && isUserLogin.equals("true")) {
		isLogin = true;
		username = (String) session.getAttribute("username");
	}

	List<Product> products = new ArrayList<>();
	ProductManager.getInstance().findNewProducts(products, 10);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="style/style.css">
</head>
<body>
	<header>
		<nav>
			<!--logo-->
			<div class="logo">
				<img src="images/logo_03.png" alt="" width="100px" height="42px">
			</div>
			<!--导航栏-->
			<div class="navbar">
				<ul>
					<li><a href="#">首页</a></li>
					<li><a href="#">课程</a></li>
					<li><a href="#">职业规划</a></li>
				</ul>
			</div> 
			<!--个人中心-->
			<div class="personal">
				<%
					if (isLogin) {
				%>欢迎您,<%=username%>!
				<a href="modifyUser.jsp">修改个人信息</a>&nbsp;&nbsp;&nbsp;<a href="loginOut.jsp">退出</a>
				<%
				} else {
				%>
				<a href="login.jsp">登录</a>&nbsp;&nbsp;
				<a href="registerUser.jsp">注册</a>
				<%
					}
				%>
			</div>
			<!--搜索栏-->
			<div class="search">
				<form action="#">
					<input type="text" name="search_content" value="" placeholder="请输入关键词">
					<input type="submit" value="">
				</form>	
			</div>

		</nav>
	</header>
	<div class="banner">
		<div class="banner-in container">
			<div class="sliderbar">
				<ul>
					<li><a href="#">前端开发<span>></span></a></li>
					<li><a href="#">后端开发<span>></span></a></li>
					<li><a href="#">移动开发<span>></span></a></li>
					<li><a href="#">人工智能<span>></span></a></li>
					<li><a href="#">商业预测<span>></span></a></li>
					<li><a href="#">云计算&大数据<span>></span></a></li>
					<li><a href="#">运维&测试<span>></span></a></li>
					<li><a href="#">UI设计<span>></span></a></li>
					<li><a href="#">产品<span>></span></a></li>
				</ul>
			</div>
			<dl class="timetable">
				<dt>我的课程表</dt>
				<dd>
					<h4>继续学习 程序设计语言</h4>
					<p>正在学习-使用对象</p>
				</dd>
				<dd>
					<h4>继续学习 程序设计语言</h4>
				</dd>
				<dd>
					<h4>继续学习 程序设计语言</h4>
				</dd>
				<dd>
					<a href="#">全部课程</a>
				</dd>
			</dl>
			<div class="circle">
				<ul>
					<li class="current"><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="recommend container">
			<a href="#">精品推荐</a>
			<a href="#">Jquery</a>
			<a href="#">Spart</a>
			<a href="#">MySql</a>
			<a href="#">javaWeb</a>
			<a href="#">MySql</a>
			<a href="#">javaWeb</a>
			<a href="#">修改兴趣</a>
	</div>
	<div class="recom-products container">
		<div class="recom-hd">
			<h4>精品推荐</h4>
			<a href="#">查看全部</a>
		</div>
		<div class="recom-bd clearfix">
			<ul>


				<%
					for (int i = 0; i < products.size(); i++) {
				%>
				<li>
					<img src="images/banner.jpg" height="155" width="233" alt="">
					<h5><%=products.get(i).getName()%></h5>
					<p><span>价格<%=products.get(i).getNormalprice()%></span> . <%=products.get(i).getDescr()%>&nbsp;&nbsp;
					<a href="cart.jsp?productid=<%=products.get(i).getId()%>&action=add">购买</a></p>
				</li>
				<%
					}
				%>
				<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
								<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
								<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
								<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
								<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
												<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
												<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
												<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
												<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
												<%--<li>--%>
					<%--<img src="images/banner.jpg" height="155" width="233" alt="">--%>
					<%--<h5>Think PHP 5.0博客系统实战项目练习</h5>--%>
					<%--<p><span>高级</span> . 1125人正在学习</p>--%>
				<%--</li>--%>
			</ul>
		</div>
	</div>
	<footer>
		<div class="container footer-in">
			<div class="footer-l">
				<img src="images/logo_03.png" height="43" width="197" alt="">
				<p>学成在线致力于普及中国最好的教育它与中国一流大学和机构合作提供在线课程.</p>
				<p>@ 2017年XTCG Inc. 保留所有权利.-沪ICP备案15025210号</p>
				<a herf="#">下载App</a>
			</div>
			<div class="footer-r">
				<dl>
						<dt>关于学成网</dt>
						<dd><a href="#">关于</a></dd>
						<dd><a href="#">管理团队</a></dd>
						<dd><a href="#">工作机会</a></dd>
						<dd><a href="#">客户服务</a></dd>
						<dd><a href="#">帮助</a></dd>
				</dl>
								<dl>
						<dt>关于学成网</dt>
						<dd><a href="#">关于</a></dd>
						<dd><a href="#">管理团队</a></dd>
						<dd><a href="#">工作机会</a></dd>
						<dd><a href="#">客户服务</a></dd>
						<dd><a href="#">帮助</a></dd>
				</dl>
								<dl>
						<dt>关于学成网</dt>
						<dd><a href="#">关于</a></dd>
						<dd><a href="#">管理团队</a></dd>
						<dd><a href="#">工作机会</a></dd>
						<dd><a href="#">客户服务</a></dd>
						<dd><a href="#">帮助</a></dd>
				</dl>
			</div>
		</div>
	</footer>
</body>
</html>
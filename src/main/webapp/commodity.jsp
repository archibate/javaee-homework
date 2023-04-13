<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="pyb.Commodity" %>
<%@ page import="pyb.CommodityDao" %>
<%@ page import="pyb.ServiceImpl" %>
<%
	int itemsPerPage = 10;
	int pageNum = 1;
	if (request.getParameter("page") != null) {
		pageNum = Integer.parseInt(request.getParameter("page"));
    }
	CommodityDao dao = new ServiceImpl().newCommodityDao();
	List<Commodity> commodities = dao.listCommodityPage(pageNum, itemsPerPage);
	int totalPages = dao.countCommodityPages(itemsPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表</title>
<style>
.commodity {
	width: 20%;
	float: left;
	text-align: center;
}
</style>
</head>
<body>
<h1>a商品列表</h1>
<div class="commodities">
<% for (Commodity commodity: commodities) { %>
<div class="commodity">
<img src="<% out.print(commodity.getImgpath()); %>" alt="<% out.print(commodity.getInfo()); %>">
<p><% out.print(commodity.getInfo()); %></p>
<p><% out.print(commodity.getPrice()); %> 元</p>
<p><% out.print(commodity.getStorage()); %> 件</p>
<a href="addToCart.jsp?commodity=<% out.print(commodity.getNo()); %>"><button>加入购物车</button></a>
</div>
<% } %>
</div>

<div class="page-selector">
  <a href="commodity.jsp?page=<% out.print(pageNum-1); %>">上一页</a>
  <% for (int i = 1; i <= totalPages; i++) { %>
  <a href="commodity.jsp?page=<% out.print(i); %>"><% out.print(i); %></a>
  <% } %>
  <a href="commodity.jsp?page=<% out.print(pageNum+1); %>">下一页</a>
</div>

</body>
</html>

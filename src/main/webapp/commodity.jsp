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
body {
  margin-left: 10%;
  margin-right: 10%;
}
.commodities {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
}
.page-selector {
  position: absolute;
  right: 5%;
  bottom: 5%;
}
.info-span {
  display: inline-block;
  padding: 3px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  background-color: #f0f0f0;
  color: #333333;
  font-size: 13px;
  width: 67px;
  height: 20px;
}
.info-span:hover {
    background-color: #dfdfdf;
}
a.info-span {
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    margin: 5px;
    padding: 3px;
    cursor: pointer;
    text-decoration: none;
    width: 68px;
    transition: all 0.3s;
}

a.info-span:hover {
    background-color: #3e8e41;
    transform: scale(1.08);
}

.card {
  display: inline-block;
  width: 220px;
  border: 1px solid #cccccc;
  border-radius: 5px;
  transition: all 0.5s;
	width: 19%;
	float: left;
	text-align: center;
}

.card:hover {
  transform: scale(1.04);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.commodity-image {
  display: block;
  width: 200px;
  height: 200px;
  margin: 10px auto;
  border: none;
}

.commodity-info {
    border-radius: 5px;
    height: 50px;
  display: block;
  padding: 10px;
  margin: 5px;
  border: none;
  background-color: #e3efff;
  color: #333333;
  font-size: 18px;
  text-align: center;
}
.commodity-info:hover {
  background-color: #b3d9ff;
}

.page-selector {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}

.prev-page, .next-page, .page-num, .page-num-curr, .empty-page {
  display: inline-block;
  width: 40px;
  height: 40px;
  line-height: 40px;
  margin: 5px;
  border-radius: 5px;
  border: 2px solid transparent;
}

.prev-page, .next-page, .page-num, .page-num-curr {
  background-color: #f0f0f0;
  color: #333333;
  font-size: 18px;
  text-align: center;
  text-decoration: none;
}

.prev-page:hover, .next-page:hover, .page-num:hover, .page-num-curr:hover {
    border: 2px solid #cccccc;
}

.page-num-curr {
    background-color: #66b3ff;
}

body h1 {
  display: block;
  margin: 20px auto;
  padding: 10px;
  border: none;
  border-radius: 5px;
  background-color: #b3d9ff; /* dark blue */
  color: #ffffff; /* white */
  font-size: 36px;
  font-weight: bold;
  text-align: center;
}
</style>
</head>
<body>
<h1>商品列表</h1>

<div class="commodities">
    <% for (Commodity commodity: commodities) { %>
        <div class="commodity card">
            <img src="<% out.print(commodity.getImgpath()); %>" alt="<% out.print(commodity.getInfo()); %>" class="commodity-image">
            <p><span class="commodity-info"><% out.print(commodity.getInfo()); %></span></p>
            <p>
                <span class="info-span"><% out.print(commodity.getPrice()); %> 元</span>
                <span class="info-span"><% out.print(commodity.getStorage()); %> 件</span>
                <a class="info-span" href="addToCart.jsp?commodity=<% out.print(commodity.getNo()); %>">加入购物车</a>
            </p>
        </div>
    <% } %>
</div>

<div class="page-selector">
  <% if (pageNum - 1 >= 1) { %>
    <a class="prev-page" href="commodity.jsp?page=<% out.print(pageNum-1); %>">&lt;</a>
  <% } else { %>
    <span class="empty-page"></span>
  <% } %>
  <% for (int i = 1; i <= totalPages; i++) { %>
    <a class="<% out.print(i == pageNum ? "page-num-curr" : "page-num"); %>" href="commodity.jsp?page=<% out.print(i); %>"><% out.print(i); %></a>
  <% } %>
  <% if (pageNum + 1 <= totalPages) { %>
    <a class="next-page" href="commodity.jsp?page=<% out.print(pageNum+1); %>">&gt;</a>
  <% } else { %>
    <span class="empty-page"></span>
  <% } %>
</div>

</body>
</html>

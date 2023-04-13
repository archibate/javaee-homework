<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<form action="api/login">
<table>
	<tr>
	<td>
		<label for="username">用户名：</label>
	</td>
	<td>
		<input name="username"/>
	</td>
	</tr>
	<tr>
	<td>
	<label for="password">密码：</label>
	</td>
	<td>
	<input name="password"/>
	</td>
	</tr>
</table>
<input type="submit" value="登录"/>
<a href="register.jsp">没有账号？注册</a>
</form>
</body>
</html>

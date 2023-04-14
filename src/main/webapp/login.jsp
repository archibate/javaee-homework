<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
<style>
body {
  align-items: center;
  margin-left: 36%;
  margin-right: 36%;
}
{
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  width: 400px;
  margin: 0 auto;
}

label {
  display: inline-block;
  width: 100px;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"],
select {
  width: 350px;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 16px;
}

select {
    width: 150px;
}

input[type="tel"] {
    width: 195px;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 20px;
  cursor: pointer;
  display: block;
  margin: 10px auto;
  padding: 10px;
  font-weight: bold;
  text-align: center;
  width: 200px;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
}

button {
  background-color: #f0f0f0;
  color: #808080;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 20px;
  cursor: pointer;
  display: block;
  margin: 10px auto;
  padding: 10px;
  font-weight: bold;
  text-align: center;
  width: 200px;
}

button:hover {
  background-color: #e0e0e0;
  color: #404040;
}
</style>
</head>
<body>
	<h1>登&nbsp;&nbsp;录</h1>

<form action="api/login">
    <label for="username">用户名：</label>
    <input type="text" name="username" required/>
    <br/>
	<label for="password">密码：</label>
	<input type="password" name="password" required/>
    <br/>
    <input type="submit" value="登录"/>
</form>
    <button onclick="window.location.href = 'register.jsp'">没有账号？注册</button>
</body>
</html>

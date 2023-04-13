<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
<script>
function validateForm() {
    var password = document.getElementById("password");
    var confirm_password = document.getElementById("confirm_password");

    if (password.value != confirm_password.value) {
        alert("The two password fields must match.");
        return false;
    }
}
</script>
<style>
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
    width: 200px;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>
	<h1>注&nbsp;&nbsp;册</h1>

	<form action="api/register" onsubmit="return validateForm()">
		<label for="tel">电话号码:</label>
		<select id="region" name="region">
			<option value="+86">中国大陆 (+86)</option>
			<option value="+1">美国 (+1)</option>
			<option value="+44">英国 (+44)</option>
			<option value="+81">日本 (+81)</option>
		</select>
		<input type="tel" id="tel" name="tel" required pattern="[0-9]{11}"><br>

		<label for="username">用户名:</label>
		<input type="text" id="username" name="username" required><br>

		<label for="email">电子邮件:</label>
		<input type="email" id="email" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"><br>

		<label for="password">输入密码:</label>
		<input type="password" id="password" name="password" required><br>

		<label for="confirm_password">确认密码:</label>
		<input type="password" id="confirm_password" name="confirm_password" required><br>

		<label for="sex">性别:</label>
    <input type="radio" id="sex" name="sex" value="M">男
		<input type="radio" id="sex" name="sex" value="F">女
		<br><br>

		<input type="submit" value="Submit">
	</form>
</body>
</html>

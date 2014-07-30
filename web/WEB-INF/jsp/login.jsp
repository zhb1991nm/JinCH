<%--
  Created by IntelliJ IDEA.
  User: 敏华
  Date: 2014/7/29
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>


</head>
<body>
<table>
    <tr>
        <form action="/JinCH/login.do" method="post">
            账号：<input type="text" name="username" id="username">
            密码：<input type="text" name="password" id="password">
            <input type="submit" value="登录">

        </form>
    </tr>
    <tr>
        <form action="/JinCH/testParam.do" method="post">
            账号：<input type="text" name="param1" id="param1">
            <input type="submit" value="参数传递测试">

        </form>
    </tr>
</table>
</body>
</html>

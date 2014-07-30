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
        <td>
            <form action="/JinCH/login.do" method="post">
                <tr>
                    <th>
                        用户名&nbsp;
                    </th>
                    <td>
                        <input type="text" name="username" id="username">
                    </td>
                </tr>
                <tr>
                    <th>
                        密码&nbsp;
                    </th>
                    <td>
                        <input type="text" name="password" id="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="登录">
                    </td>
                </tr>


            </form>
        </td>
    </tr>
    <tr>
        <td>
            <form action="/JinCH/testParam.do" method="post">
                参数：<input type="text" name="param1" id="param1">
                <input type="submit" value="参数传递测试">

            </form>
        </td>
    </tr>
</table>
testd
</body>
</html>

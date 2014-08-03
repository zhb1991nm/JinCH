<%--
  Created by IntelliJ IDEA.
  User: 敏华
  Date: 2014/7/29
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <style type="text/css">

        .selector{
            background-color: lightgrey;
            height: 40px;
        }

        .productlist {
        }

        .list {
            padding: 10px 10px 10px 10px;
            border-bottom: 1px solid #CCC;
            position: relative;
            min-height: 50px;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }

        .title {
            font-size: 14px;
            float: left;
        }

        .subtitle {
            font-size: 10px;
            color: #09F;
            margin-left: 5px;
        }

        .gray {
            font-size: 10px;
            color: #666;
        }

        .test {
            margin-top: 10px;
        }

        .hot {
            border: 1px solid #ff3c00;
            border-radius: 2px;
            width: 80px;
            height: 50px;
        }

        .img {
            width: 20px;
            height: 20px;
        }

        .num {
            color: #ff3c00;
            font-size: 14px;
            margin-left: 25px;
            height: 8px;
        }

        .topback {
            margin-left: 10px;
            height: 8px;
        }
    </style>
    <script type="text/javascript">
        function listOnClick(id){

        }
    </script>
</head>
<body>
<div class="main">
    <div class="selector">

    </div>
    <div class="productlist">
        <div class="list" onclick="listOnClick(this)">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>

        <div class="list">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="/img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>

        <div class="list">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="/img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>

        <div class="list">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="/img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>

        <div class="list">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="/img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>

        <div class="list">
            <div class="title">中江国际189号<span class="subtitle">24个月&nbsp;&nbsp;10.0%～10.5%</span>

                <p class="test gray">
                    <span>基础设施类</span>
                    <span style="margin-left:20px">到期付息</span>
                    <span style="margin-left:20px">其他地区</span>
                </p>
            </div>
            <div class="right hot">
                <img class="right img" src="/img/hot.png">

                <p class="num">3.2%</p>

                <p class="gray topback">最高返佣率</p>
            </div>
        </div>


    </div>
</div>
</body>
</html>

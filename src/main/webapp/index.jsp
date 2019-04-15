<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>教主的糖尿病预测系统</title>
    <!-- Bootstrap -->
    <%--CSS--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="/css/first.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <style>
        #middle{
            text-align: center;
            margin:0 auto;
            width:500px;}
        .form-group{
            margin:0 auto;
            text-align: center;
            width:300px;
        }
       .label-left{
           text-align: left;
           width:280px;
       }
    </style>

</head>
<body >
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
           <h3>&emsp;&emsp;&emsp;教主的糖尿病预测大法</h3>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/MoDiabetes_war_exploded/index.jsp">预测</a></li>
                <li><a href="https://baike.baidu.com/item/%E7%B3%96%E5%B0%BF%E7%97%85/100969?fr=aladdin">百科</a></li>
                <li><a href="http://www.cyberpolice.cn/wfjb/">反馈</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron" id="middle">
    <form id="T" action="/MoDiabetes_war_exploded/T" method="post">
        <div class="form-group">
            <label class="label-left">壬辰：</label>
            <input type="text" class="form-control" name="pregnancies" placeholder="壬辰" >
        </div>
        <div class="form-group">
            <label class="label-left">血糖：</label>
            <input type="text" class="form-control" name="glucose" placeholder="血糖">
        </div>
        <div class="form-group">
            <label class="label-left">血压：</label>
            <input type="text" class="form-control" name="bloodpressure" placeholder="血压">
        </div>
        <div class="form-group">
            <label class="label-left">皮脂：</label>
            <input type="text" class="form-control" name="skinthickness" placeholder="皮脂">
        </div>
        <div class="form-group">
            <label class="label-left">胰岛素：</label>
            <input type="text" class="form-control" name="insulin" placeholder="胰岛素">
        </div>
        <div class="form-group">
            <label class="label-left">BMI：</label>
            <input type="text" class="form-control" name="bmi" placeholder="BMI">
        </div>
        <div class="form-group">
            <label class="label-left">糖尿病家庭指数：</label>
            <input type="text" class="form-control" name="diabetespedigreefunction" placeholder="糖尿病家庭指数">
        </div>
        <div class="form-group">
            <label class="label-left">年龄：</label>
            <input type="text" class="form-control" name="age" placeholder="年龄">
        </div>
        <br>
        <button type="submit" class="btn btn-default">LBFGS梯度法预测</button>
    </form>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>

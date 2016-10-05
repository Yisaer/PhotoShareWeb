<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/20
  Time: 上午8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>伊莉萨白</title>

    <!-- Bootstrap -->
    <link href="./lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="./lib/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="./lib/js/html5shiv.js"></script>
    <script src="./lib/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/css">
        body{
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }


        /* 简介 */

        .summary {
            padding-right: 15px;
            padding-left: 15px;
        }

        .summary .col-md-4 {
            margin-bottom: 20px;
            text-align: center;
        }
    </script>

</head>
<body>
<%@include file="../common/menu.jsp"%>
<%@include file="../common/JoinUs.jsp"%>
<div class="container summary">

    <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-md-4">
            <img class="img-circle" src="lib/images/kedaya.jpg" alt="chrome">

            <h2>前端工程师</h2>

            <p>主要负责网页的布局与编写。虽然写出来的页面很漂亮,但通常都比较猥琐</p>

            <p><a class="btn btn-default" href="#" role="button">###</a></p>
        </div>
        <div class="col-md-4">
            <img class="img-circle" src="lib/images/houduan.jpg" alt="firefox">

            <h2>后端工程师</h2>

            <p>主要负责服务器端与数据库端的交互处理,为人正直,心思单纯。是Web不可或缺的力量</p>
            <p><a class="btn btn-default" href="#" role="button">###</a></p>
        </div>
        <div class="col-md-4">
            <img class="img-circle" src="lib/images/heibaixiong.jpg" alt="safari">

            <h2>产品经理</h2>

            <p>总是脑袋一拍就瞎想出一个idear,给前端和后端的工程师们带来绝望。最终成为了希望的垫脚石</p>

            <p><a class="btn btn-default" href="#" role="button">###</a></p>
        </div>
    </div>


   <%@include file="../common/footer.jsp"%>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./lib/js/jquery-1.11.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./lib/js/bootstrap.min.js"></script>
<script type="text/javascript">
    <%@ include file="./lib/js/script.js"%>
</script>

</body>
</html>


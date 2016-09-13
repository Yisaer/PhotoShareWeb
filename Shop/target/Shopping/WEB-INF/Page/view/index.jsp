<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 2016/9/7
  Time: 12:40
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
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="./lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="./lib/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="./lib/js/html5shiv.js"></script>
    <script src="./lib/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%@include file="../common/menu.jsp"%>
<%@include file="../common/Carousel.jsp"%>
<div class="container">
    <footer><%@include file="../common/footer.jsp"%></footer>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./lib/js/jquery-1.11.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./lib/js/bootstrap.min.js"></script>
<script type="text/javascript">
    <%@ include file="./lib/js/script.js"%>
    $('#Share').click(function(){
        $.get('${pageContext.request.contextPath}' + '/ImageAction?type=3',function(data, status) {
            location.href="/share.jsp";
        });
    });
</script>

</body>
</html>

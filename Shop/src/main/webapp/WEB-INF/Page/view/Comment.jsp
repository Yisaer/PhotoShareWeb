<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 2016/9/7
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.shucs.shop.domain.Image"
         import="java.util.ArrayList"
         import="com.shucs.shop.domain.Comment"
%>
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
</head>
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
    .img-circle{
        width: 60px;
        height: 60px;
    }

</script>

<body>
<%@include file="../common/menu.jsp"%>
<%@include file="../common/FriendShare.jsp"%>

<%
    ArrayList<Comment> list = (ArrayList<Comment>)session.getAttribute("CommentList");

%>
<div class="container">

    <hr class="feature-divider">
    <c:forEach items="${CommentList}" varStatus="status" var="comment">
    <div class="Commenter">
            <div class="media">
                <div class="media-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-2">
                            <h4 class="media-heading">${comment.username}</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <a class="media-left" href="#">
                                <img  class="img-circle img-thumbnail" src="http:///od0xwraj0.bkt.clouddn.com/${comment.url}" alt="...">
                            </a>
                        </div>
                        <br>
                        <div class="col-md-6" style="font-size: 20px"> ${comment.comment} </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-md-offset-10 "  style="font-size: 12px;color: darkgrey;" > ${comment.date}</div>
            </div>
        <hr class="feature-divider">
    </div>
    </c:forEach>




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

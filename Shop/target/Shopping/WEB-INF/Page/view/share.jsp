<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/8
  Time: 下午6:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.shucs.shop.domain.Image"
         import="java.util.*"
%>
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
    <link href="http://fineui.com/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://fineui.com/res/css/docs.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://fineui.com/lib/html5shim/html5.js"></script>
    <![endif]-->

    <link href="http://fineui.com/res/lightbox/css/lightbox.css" rel="stylesheet">
    <style>
        #masonry
        {
            padding: 0;
            min-height: 450px;
            margin: 0 auto;
        }
        #masonry .thumbnail
        {
            width: 330px;
            margin: 20px;
            padding: 0;
            border-width: 1px;
            -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
        }
        #masonry .thumbnail .imgs
        {
            padding: 10px;
        }
        #masonry .thumbnail .imgs img
        {
            margin-bottom: 5px;
        }
        #masonry .thumbnail .caption
        {
            background-color: #fff;
            padding-top: 0;
            font-size: 13px;
        }
        #masonry .thumbnail .caption .title
        {
            font-size: 13px;
            font-weight: bold;
            margin: 5px 0;
            text-align: left;
        }
        #masonry .thumbnail .caption .author
        {
            font-size: 11px;
            text-align: right;
        }


        .lightbox .lb-image
        {
            max-width: none;
        }

        
    </style>
</head>

<body >



<%@include file="../common/menu.jsp"%>
<div class="container">



    <div id="masonry" class="container-fluid"></div>
    <div id="masonry_ghost" class="hide">
        <c:forEach items="${ShareList}" varStatus="status" var="image">
            <div class="thumbnail">
                <div class="imgs">
                    <input type="hidden" value="${image.url}">
                </div>
                <div class="caption">
                    <div class="title" id="PicTitle">${image.name}</div>
                    <div class="content" id="PicContent">
                    </div>
                    <div class="author">
                        by <a target="_blank" id = "#PicUser">${image.user.getUsername()}</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    <!-- here -->
    </div>
    <%@include file="../common/footer.jsp"%>
</div>



<script src="http://fineui.com/lib/jquery/jquery-1.8.2.min.js"></script>
<script src="http://fineui.com/bootstrap/js/bootstrap.min.js"></script>
<script src="http://fineui.com/res/js/main.js"></script>

<script src="http://fineui.com/lib/masonry.pkgd.min.js"></script>
<script src="http://fineui.com/lib/imagesloaded.pkgd.min.js"></script>
<script src="http://fineui.com/lib/lightbox-2.6.min.js"></script>
<script >
    <%@include file="./lib/js/script.js"%>
</script>

<script>

    $(function() {
        var ghostNode = $('#masonry_ghost').find('.thumbnail'), i, ghostIndexArray = [];
        var ghostCount = ghostNode.length;
        for(i=0; i<ghostCount; i++){
            ghostIndexArray[i] = i;
        }
        ghostIndexArray.sort(function(a, b) {
            if(Math.random() > 0.5) {
                return a - b;
            } else {
                return b - a;
            }
        });

        var currentIndex = 0;
        var masNode = $('#masonry');
        var imagesLoading = false;


        function getNewItems() {
            var newItemContainer = $('<div/>');
            for(var i=0; i<6; i++) {
                if(currentIndex < ghostCount) {
                    newItemContainer.append(ghostNode.get(ghostIndexArray[currentIndex]));
                    currentIndex++;
                }
            }
            return newItemContainer.find('.thumbnail');
        }

        function processNewItems(items) {
            items.each(function() {
                var $this = $(this);
                var imgsNode = $this.find('.imgs');
                var title = $this.find('.title').text();
                var author = $this.find('.author').text();
                title += '&nbsp;&nbsp;(' + author + ')';
                var lightboxName = 'lightbox_'; // + imgNames[0];

                var imgNames = imgsNode.find('input[type=hidden]').val().split(',');
                $.each(imgNames, function(index, item) {
                    imgsNode.append('<a href="http:///od0xwraj0.bkt.clouddn.com/'+item+'"' +'" data-lightbox="'+ lightboxName +'" title="'+ title +'"><img src="http:///od0xwraj0.bkt.clouddn.com/'+ item +'" /></a>');
                });
            });
        }

        function initMasonry() {
            var items = getNewItems().css('opacity', 0);
            processNewItems(items);
            masNode.append(items);

            imagesLoading = true;
            items.imagesLoaded(function(){
                imagesLoading = false;
                items.css('opacity', 1);
                masNode.masonry({
                    itemSelector: '.thumbnail',
                    isFitWidth: true
                });
            });
        }


        function appendToMasonry() {
            var items = getNewItems().css('opacity', 0);
            processNewItems(items);
            masNode.append(items);

            imagesLoading = true;
            items.imagesLoaded(function(){
                imagesLoading = false;
                items.css('opacity', 1);
                masNode.masonry('appended',  items);
            });
        }
        initMasonry();
        $(window).scroll(function() {
            if($(document).height() - $(window).height() - $(document).scrollTop() < 10) {
                if(!imagesLoading) {
                    appendToMasonry();
                }
            }
        });

        function randomColor() {
            var rand = Math.floor(Math.random() * 0xFFFFFF).toString(16);
            for (; rand.length < 6;) {
                rand = '0' + rand;
            }
            return '#' + rand;
        }

    });
</script>
</body>
</html>
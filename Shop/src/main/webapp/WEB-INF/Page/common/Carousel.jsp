<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/8
  Time: 上午12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 轮播组件 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="lib/images/Share.jpg" alt="1 slide">

            <div class="container">
                <div class="carousel-caption">

                    <h1> 与世界 共享美丽瞬间</h1>
                    <p><a class="btn btn-lg btn-primary"
                     id="Share"  role="button" >热门分享</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="lib/images/Friend.jpg" alt="2 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1> 与好友 共度水木年华</h1>

                    <p><a class="btn btn-lg btn-primary" href="#"
                          role="button">好友分享</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="lib/images/Join.jpg" alt="3 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>与我们 共创旖旎未来</h1>

                    <p><a class="btn btn-lg btn-primary" href="#" target="_blank"
                          role="button">加入我们</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

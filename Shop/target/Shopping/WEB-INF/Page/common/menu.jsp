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

<!-- 导航条 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" id="demo-nav">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">伊莉萨白</a>
        </div>
        <div class="navbar-collapse collapse" id="demo-nav">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">首页</a></li>
                <li><a href="#summary-container">简述</a></li>

                <!-- 下拉菜单 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">特点 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">标题名称</li>
                        <li><a href="#feature-tab" data-tab="tab-chrome">Chrome</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">Firefox</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">Safari</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">Opera</a></li>
                        <!-- 分割线 -->
                        <li class="divider"> </li>
                        <li ><a href="#feature-tab" data-tab="tab-ie" >IE</a></li>
                    </ul>
                </li>
                <!-- 菜单结束 -->
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
            <div class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="search" style="margin-right:10px;">
                </div>


                <c:if test="${sessionScope.user != null}">
                    <button type="button" class="btn btn-primary" id="home">
                    ${sessionScope.user.username}
                    </button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModa4">
                        退出
                    </button>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        登录
                    </button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myReg">注册</button>
                </c:if>
            </div>

        </div>
    </div>
</div>
<!-- 导航条结束 -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Login Pannel</h4>
            </div>
            <div class="modal-body">
                <!-- 登录表单 -->
                <form id="form" class="form-horizontal" role="form" style="margin-top: 73px;">
                    <div class="form-group"  >
                        <label for="username" class="col-xs-2 control-label col-sm-offset-3" >Username</label>
                        <div class="col-xs-5">
                            <input type="text" class="form-control" id="username" rel="tooltip"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-xs-2 control-label col-sm-offset-3">Password</label>
                        <div class="col-xs-5">
                            <input type="password" class="form-control" id="password"/>
                        </div>
                    </div>
                </form>
                <!-- 登录表单end -->

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="login">Login</button>
            </div>
        </div>
    </div>
</div>


<!-- 注册对话框 begin -->
<div class="modal fade" id="myReg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">UserRegister</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group"  >
                        <label for="reg_username" class="col-xs-2 control-label" >Username</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="reg_username"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="reg_password" class="col-xs-2 control-label">Password</label>
                        <div class="col-xs-4">
                            <input type="password" class="form-control" id="reg_password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="reg_repassword" class="col-xs-2 control-label">Reinput</label>
                        <div class="col-xs-4">
                            <input type="password" class="form-control" id="reg_repassword"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="register">Register</button>
            </div>
        </div>
    </div>
</div>
<!-- 注册对话框 end -->

<!-- 关于 -->

<div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="modal-label">关于</h4>
            </div>
            <div class="modal-body">
                <p>	 本站为Web课程设计项目结果,开发者Yisa </p>
                <p>  <a href="http://yisaer.github.io"> 个人博客  </a> </p>
                <p>  联系我们 : disxiaofei@163.com</p>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
            </div>
        </div>
    </div>
</div>

<!-- 退出对话框 start -->
<div class="modal fade" id="myModa4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabe4">confirm to exit?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="exit">Confirm</button>
            </div>
        </div>
    </div>
</div>
<!-- 退出对话框 end -->
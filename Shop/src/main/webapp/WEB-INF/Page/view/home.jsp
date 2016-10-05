<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/8
  Time: 上午1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body>
<%@include file="../common/menu.jsp"%>
<div class="container">
    <%@include file="../common/homeMenu.jsp"%>

    <%@include file="../common/ShowPic.jsp"%>
    <%@include file="../common/footer.jsp"%>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./lib/js/jquery-1.11.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./lib/js/bootstrap.min.js"></script>
<script type="text/javascript">

    <%@include file="./lib/js/script.js"%>
</script>

<script type="text/javascript">
    $(document).ready(function() {
        //点击图片
        $('img').click(function() {
            $('#myPicModalLabel').html($(this).attr('name') + '&nbsp;&nbsp;&nbsp;<small>' + $(this).attr('date') + '</small>');
            $('#Picmodal-content').html('<img class=\'img-responsive\' src=\'' + $(this).attr('src') + '\'/>');
            $('#myPicModal').modal('show');
        });

        //点击上传
        $('#upload').click(function() {
            if ($('#image_name').val() == '' || $('#image').val() == '') {
            } else {
                $('#formUpload').attr('action', '${pageContext.request.contextPath}' + '/ImageAction?type=1');
                $('#formUpload').attr('enctype', 'multipart/form-data');
                $('#formUpload').attr('method', 'post');
                $('#formUpload').submit();
            }
        });

        //修改头像
        $('#Picupload').click(function() {
            if ( $('#PicUrl').val() == '') {
            } else {
                $('#PicformUpload').attr('action', '${pageContext.request.contextPath}' + '/ImageAction?type=4');
                $('#PicformUpload').attr('enctype', 'multipart/form-data');
                $('#PicformUpload').attr('method', 'post');
                $('#PicformUpload').submit();
            }
        });


        //点击修改资料
        $('#SaveChanges').click(function() {
            //提交注册表单
            $.post('${pageContext.request.contextPath}' + '/UserAction?type=4',
                    {
                        oldpassword: $('#oldpassword').val(),
                        newpassword: $('#newpassword').val(),
                        renewpassword: $('#renewpassword').val(),
                        username: '${sessionScope.user.username}'
                    },
                    function(data, status) {
                        if (data == '1') {
                            createPopOver('#oldpassword', 'right', 'not null', 'show');
                        } else if (data == '2') {
                            createPopOver('#newpassword', 'right', 'not null', 'show');
                        } else if (data == '3') {
                            createPopOver('#renewpassword', 'right', 'not null', 'show');
                        } else if (data == '4') {
                            createPopOver('#oldpassword', 'right', 'Old Passwords do not match', 'show');
                        } else if (data == '5') {
                            createPopOver('#newpassword', 'right', 'New Passwords do not match', 'show');
                        } else if (data == '6') {
                            location.href = '${pageContext.request.contextPath}' + '/home.jsp';
                        }
                    });
        });



        //点击确定删除图片
        $('#delete').click(function() {
            var ids = "";
            var urls = "";
            $('input[type=checkbox]:checked').each(function() {
                ids += $(this).val() + ',';
                urls += $(this).attr('url') + ',';
            });
            $.post('${pageContext.request.contextPath}' + '/ImageAction?type=2', {
                ids: ids,
                urls: urls
            },function(data, status) {
                $('#myModa3').modal('hide');
                location.href = '${pageContext.request.contextPath}' + '/home.jsp';
            });
        });
    });

    // 点击提交上传评论

    $('#CommentSubmit').click(function(){
        $.post(
                '${pageContext.request.contextPath}' + '/CommentAction?type=1',
                {
                    username: '${sessionScope.user.username}',
                    CommentContent: $('#CommentContent').val(),
                },
                function(data,status){
                    if(data === '1'){
                        createPopOver('#CommentContent', 'right', 'not null', 'show');
                    }
                    else if(data === '5'){
                        location.href = '${pageContext.request.contextPath}' + '/home.jsp';
                    }
                }

        );
    });

</script>
</body>
</html>

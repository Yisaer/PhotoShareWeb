/**
 * Created by Yisa on 16/9/8.
 */

$(document).ready(function() {
    //点击登录
    $('#login').click(function() {
        //提交登录表单
        $.post('${pageContext.request.contextPath}' + '/UserAction?type=1',
            {
                username: $('#username').val(),
                password: $('#password').val()
            },
            function(data, status) {
                if (data == '1') {
                    createPopOver('#username', 'right', 'Username can not be empty ', 'show');
                } else if (data == '2') {
                    createPopOver('#password', 'right', ' password can not be empty', 'show');
                } else if (data == '3') {
                    createPopOver('#username', 'right', ' Username does not exist', 'show');
                } else if (data == '4') {
                    createPopOver('#password', 'right', ' wrong password', 'show');
                } else if (data == 5) {
                    if(username === 'admin'){
                        location.href =  '${pageContext.request.contextPath}' + '/admin.jsp';
                    }
                    else {
                        location.href = '${pageContext.request.contextPath}' + '/home.jsp';
                    }
                }
            });
    });

    //点击注册按钮
    $('#register').click(function() {
        //提交注册表单
        $.post('${pageContext.request.contextPath}' + '/UserAction?type=2',
            {
                username: $('#reg_username').val(),
                password: $('#reg_password').val(),
                repassword: $('#reg_repassword').val()
            },
            function(data, status) {
                if (data == '1') {
                    createPopOver('#reg_username', 'right', 'not null', 'show');
                } else if (data == '2') {
                    createPopOver('#reg_password', 'right', 'not null', 'show');
                } else if (data == '3') {
                    createPopOver('#reg_repassword', 'right', 'not null', 'show');
                } else if (data == '4') {
                    createPopOver('#reg_repassword', 'right', 'Passwords do not match', 'show');
                } else if (data == '5') {
                    createPopOver('#reg_username', 'right', 'Username already exists', 'show');
                } else if (data == '6') {
                    location.href = '${pageContext.request.contextPath}' + '/home.jsp';
                }
            });
    });

    $('#exit').click(function() {
        $.get('${pageContext.request.contextPath}' + '/UserAction?type=3', function(data, status) {
            location.href = '${pageContext.request.contextPath}' + '/index.jsp';
        });
    });

    $('#home').click(function(){
        var username = $('#home').html().trim();
        if ( username === 'admin'){
            location.href = '${pageContext.request.contextPath}' + '/admin.jsp';
        }
        else{
            location.href = '${pageContext.request.contextPath}' + '/home.jsp';
        }
    });

    //显示弹出框
    function createPopOver(id, placement, content, action) {
        $(id).popover({
            placement: placement,
            content: content
        });
        $(id).popover(action);
    }

    //点击输入框时销毁弹出框
    $('#username').click(function() {
        $('#username').popover('destroy');
    });

    $('#password').click(function() {
        $('#password').popover('destroy');
    });

    $('#reg_username').click(function() {
        $('#reg_username').popover('destroy');
    });

    $('#reg_password').click(function() {
        $('#reg_password').popover('destroy');
    });

    $('#reg_repassword').click(function() {
        $('#reg_repassword').popover('destroy');
    });
});
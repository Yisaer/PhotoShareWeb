<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/8
  Time: 上午7:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 首部 start -->
<div class="row">
    <div class="col-xs-8 col-xs-offset-2">
        <h3 class="page-header">
            ${user.username}&nbsp;&nbsp;&nbsp;<small>Totals:<span class="badge">${imageList.size()}</span></small>
            <div class="btn-group pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    options<span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" data-toggle="modal" data-target="#fileModa">Profile</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#proModa">Update</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#myModa2">Upload</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#CommentModa">Comment</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#myModa3">Delete</a></li>
                </ul>
            </div>
        </h3>
    </div>
</div>
<!-- 首部 end -->

<!-- File start -->
<div class="modal fade" id="fileModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myFileModalLabel">Personal File</h4>
            </div>
            <div class="modal-body">

                <div class="userheader">
                    <dl class="person-photo">
                        <dt><img src="http:///od0xwraj0.bkt.clouddn.com/${PicUrl}" width="170" height="170"></a></dt>
                    </dl>
                    <dl class="person-detail">
                        <dd>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-user"></i>&nbsp;昵称:&nbsp;&nbsp;${user.username}
                        </dd>
                        <dd>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-envelope-o"></i>&nbsp;邮箱&nbsp;&nbsp;</dd>
                        <dd>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-book"></i>&nbsp;学校&nbsp;&nbsp;</dd>
                    </dl>
                </div>
                <form class="form-horizontal" role="form" id="PicformUpload">
                    <div class="form-group">
                        <label for="PicUrl" class="col-xs-2 control-label">修改头像</label>
                        <div class="col-xs-4">
                            <input type="file" id="PicUrl" name="PicUrlinput"/>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">ok</button>
                <button type="button" class="btn btn-primary" id="Picupload">Upload</button>
            </div>
        </div>
    </div>
</div>

<!-- File End -->


<!-- Update start -->
<div class="modal fade" id="proModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <!-- Change Start -->
                <form class="form-horizontal" role="form" id="proForm">
                    <div class="form-group"  >
                        <label for="oldpassword" class="col-xs-2 control-label" >Old Password</label>
                        <div class="col-xs-4">
                            <input type="password" class="form-control" id="oldpassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newpassword" class="col-xs-2 control-label">New Password</label>
                        <div class="col-xs-4">
                            <input type="password" class="form-control" id="newpassword" name="newpassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="renewpassword" class="col-xs-2 control-label">Reinput</label>
                        <div class="col-xs-4">
                            <input type="password" class="form-control" id="renewpassword" name="renewpassword"/>
                        </div>
                    </div>
                </form>

                <!-- Change End --->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="SaveChanges">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- Update End -->


<!-- 上传图片对话框 start -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabe2">Image Upload</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="formUpload">
                    <div class="form-group"  >
                        <label for="image_name" class="col-xs-2 control-label" >Title</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="image_name" name="image_name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image" class="col-xs-2 control-label">Image</label>
                        <div class="col-xs-4">
                            <input type="file" id="image" name="imageInput"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="upload">Upload</button>
            </div>
        </div>
    </div>
</div>
<!-- 上传图片对话框 end -->

<!-- 删除图片对话框 start -->
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabe3">confirm to delete?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="delete">Confirm</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除图片对话框 end -->

<!-- 评论对话框 START  -->

<div class="modal fade" id="CommentModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"> <strong>Comment</strong> </div>

            <textarea class="form-control" rows="3" id="CommentContent"></textarea>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="CommentSubmit">Submit</button>
            </div>
        </div>
    </div>
</div>

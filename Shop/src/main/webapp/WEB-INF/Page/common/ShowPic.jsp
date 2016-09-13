<%--
  Created by IntelliJ IDEA.
  User: Yisa
  Date: 16/9/8
  Time: 上午12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 显示图片列表 -->
<c:forEach items="${imageList}" varStatus="status" var="image">
    <c:choose>
        <c:when test="${status.first or status.index % 4 eq 0}">
            <div class="row">
            <div class="col-xs-2 col-xs-offset-2">
                <a href="#" class="thumbnail text-center">
                    <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;"
                         src="http:///od0xwraj0.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                    <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}"/>${image.name }
                </a>
            </div>
        </c:when>
        <c:when test="${status.index % 4 eq 3 and not status.last }">
            <div class="col-xs-2">
                <a href="#" class="thumbnail text-center">
                    <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;"
                         src="http://od0xwraj0.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                    <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}" />${image.name }
                </a>
            </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="col-xs-2">
                <a href="#" class="thumbnail text-center">
                    <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;"
                         src="http:///od0xwraj0.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                    <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}"/>${image.name }
                </a>
            </div>
        </c:otherwise>
    </c:choose>
    <c:if test="${status.last}">
        </div>
    </c:if>
</c:forEach>
<!-- 显示图片列表 end -->

<!-- 显示图片对话框 start -->
<div class="modal fade" id="myPicModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myPicModalLabel"></h4>
            </div>
            <div class="modal-body" id="Picmodal-content">
            </div>
        </div>
    </div>
</div>
<!-- 显示图片对话框 end -->

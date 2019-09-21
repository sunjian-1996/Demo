<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>黑马程序员论坛首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common-new.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_info.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hm-bbs.js"></script>
    <style type="text/css">
        .hm-header-b {
            border-bottom: 1px solid #d9d9d9;
        }
    </style>
</head>
<body>


<!-- 头部 -->
<jsp:include page="common/header.jsp"/>


<!--头部信息-->
<div class="hm-header">
    <div class="hm-inner clearfix">
        <div class="hm-header-t clearfix">
            <h1 class="logo l">
                <a href="javascript:;"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""/></a>
            </h1>

        </div>
        <div class="hm-header-b">
            <i class="hm-ico-home"></i>
            <a href="${pageContext.request.contextPath}/jsp/index.jsp">首页</a><span>></span>修改密码
        </div>
    </div>
</div>


<!--修改密码-->
<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="user-info clearfix">
            <div class="user-info-t" style="height:20px;"></div>
            <div class="user-info-l l">
                <div class="user-info-l-t">
                    <img id="pic" src=""/>
                    <div class="username">${loginUser.userName}</div>
                </div>
                <ul class="user-info-l-b">

                    <li><i class="info-icon"></i>我的资料</li>
                    <li class="cur"><i class="safe-icon"></i>修改密码</li>
                    <c:if test="${loginUser.role == 1}">
                        <li><i class="safe-icon"></i>申请高级用户</li>
                    </c:if>
                    <c:if test="${loginUser.role == 2}">
                        <li><i class="safe-icon"></i>开启新板块</li>
                    </c:if>
                </ul>
            </div>


            <div class="user-info-r r">
                <ul class="clearfix hd">
                    <li><a href="/jsp/userInfo.jsp">个人信息</a></li>
                    <li class="cur"><a href="/jsp/userPwd.jsp">修改密码</a></li>
                    <c:if test="${loginUser.role == 1}">
                        <li><a href="/jsp/userInfoGj.jsp">申请高级用户</a></li>
                    </c:if>
                    <c:if test="${loginUser.role == 2}">
                        <li><a href="/jsp/addZone.jsp">开辟新板块</a></li>
                    </c:if>

                </ul>
                <form action="${pageContext.request.contextPath}/userInfo/updateToPass.do" method="post">
                    <ul class="bd">
                        <li class="clearfix">
                            <div class="info-l"><i class="red">*</i>旧密码：</div>
                            <div class="info-r"><input type="password" name="oldPassword"   class="txt" id="oldPassword"/>

                            </div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l"><i class="red">*</i>新密码：</div>
                            <div class="info-r"><input type="password" name="newPassword" class="txt"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l"></div>
                            <div class="info-r">
                                <input id="tijiao" type="submit" class="btn" value="保存"/>
                                <span style="color:red;">${msgg}</span>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>

<script>
    $(function(){
        $("#oldPassword").blur(function () {

            var oldPassword = $("#oldPassword").val();
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/userInfo/yanZhengMM.do",
                data:{"oldPassword":oldPassword},
                dataType:"json",
                success:function (data) {
                  if (data==null){
                      $("#tijiao").prop("type","hidden");
                      alert("你输入的旧密码有误，请重新输入")
                  }else {
                      $("#tijiao").prop("type","submit");
                  }
                }
            })
        })

        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/userInfo/findPic.do",
            dataType:"text",
            success:function (data) {
                $("#pic").prop("src",data);
            }
        })
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/userInfo/SChu.do",
            dataType:"text",
            success:function (data) {

            }
        })
    })
</script>

</body>
</html>
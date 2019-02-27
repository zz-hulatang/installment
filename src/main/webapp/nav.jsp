<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="${pageContext.request.contextPath}/success"></a>

        <div id="sideNav">
            <i class="fa fa-bars icon"></i>
        </div>
    </div>

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown"  style="margin-right: 45px">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
</nav>
<nav class="navbar-default navbar-side" role="navigation" id="menuList">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <input type="hidden" id="userId" value="${sessionScope.get("userId")}" />
            <li>
                <a class="active-menu" href="${pageContext.request.contextPath}/success"><i class="fa fa-list"></i> 用户管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/addUser">添加用户</a>
                    </li>
                </ul>
            </li>

            <%--<li>--%>
            <%--<a href="#"><i class="fa fa-file-text"></i> 我的文章<span class="fa arrow"></span></a>--%>
            <%--<ul class="nav nav-second-level">--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/url/myArticle">文章列表</a>--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/url/op/add">添加文章</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <li>
                <a href="#"><i class="fa fa-cogs"></i> 设置<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/modify_password">修改密码</a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>

</nav>

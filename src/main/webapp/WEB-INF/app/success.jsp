<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>富凯分期</title>
    <jsp:include page="../../head.jsp"/>
</head>

<body>
<div id="wrapper">

    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/success"><img src="${pageContext.request.contextPath}/static/assets/img/logo.png" alt=""></a>

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
                    <li><a onclick="logout()"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation" id="menuList">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="${pageContext.request.contextPath}/success"><i class="fa fa-list"></i> 用户管理</a>
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
                            <a href="chart.html">我的资料</a>
                        </li>
                        <li>
                            <a href="morris-chart.html">修改密码</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>

    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                全部用户 <small>欢迎光临富凯分期</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/success">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/success">用户管理</a></li>
                <li class="active">列表</li>
            </ol>

        </div>
        <div id="page-inner">

            <!-- /. ROW  -->

            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="create">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>手机号</th>
                                                <th>身份证号</th>
                                                <th>贷款本金</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody"></tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="assent">
                                </div>
                                <div class="tab-pane fade" id="against">
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="text-align: center">
                                <div id="page" class="page_div"></div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                </div>
            </div>

            <footer><p>Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://www.i757.com/">七楼的南瓜饼子店</a></p>


            </footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<script>
    var page = 1;
    var orderBy = "createDate";
    $(document).ready(function () {
        createDate();
    });
    function showList(list) {
        $("#tbody").html("");
        if(list.length > 0){
            $.each(list,function (index,item) {
                $("#tbody").append("<tr><th>" + (index+1) + "</th><td>" + item.mobilePhone + "</td><td>" + item.idCard
                    +"</td><td>" + item.installmentEntity.installmentAmount +"</td>" +
                    "<td><a onclick=detailInfo(\""+item.installmentEntity.id+"\")>详情</a></td></tr>");
            });
        }else{
            $("#"+id).html("没有数据");
        }
    }

    function detailInfo(id){
        window.location.href = "${pageContext.request.contextPath}/deatil?id="+id;
    }

    var size = 20;

    function totalPage(count){
        if(count % size ==0){
            return count/size;
        }else{
            return Math.ceil(count/size);
        }
    }

    function callback1(data) {
        if(data.length > 0){
            showList(data);
            $("#page").paging({
                pageNo: page,
                totalPage: totalPage(data[0].count),
                totalSize: data[0].count,
                callback: function(num) {
                    page = num;
                    createDate();
                }
            });
        }else{
            $("body").html(data);
        }
    }

    function createDate() {
        orderBy = "createDate";
        getRequest("${pageContext.request.contextPath}/user/queryUser?page="+page+"&size="+size,callback1);
    }
</script>

</body>

</html>
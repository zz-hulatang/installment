<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
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
            <a href="${pageContext.request.contextPath}/url/success"><img src="${pageContext.request.contextPath}/static/assets/img/logo.png" alt=""></a>

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
                    <a class="active-menu" href="${pageContext.request.contextPath}/url/success"><i class="fa fa-list"></i> 全部文章</a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-file-text"></i> 我的文章<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/url/myArticle">文章列表</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/url/op/add">添加文章</a>
                        </li>
                    </ul>
                </li>
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
                全部文章 <small>欢迎光临七楼的南瓜饼子店</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/url/success">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/url/success">全部文章</a></li>
                <li class="active">列表</li>
            </ol>

        </div>
        <div id="page-inner">

            <!-- /. ROW  -->

            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#create" data-toggle="tab" onclick="createDate()">创建时间</a>
                                </li>
                                <li class=""><a href="#assent" data-toggle="tab" onclick="assentNum()">赞成数</a>
                                </li>
                                <li class=""><a href="#against" data-toggle="tab" onclick="againstNum()">反对数</a>
                                </li>
                            </ul>
                            <br>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="create">
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

            <footer><p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://www.i757.com/">七楼的南瓜饼子店</a></p>


            </footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<script>
    var page = 1;
    var orderBy = "createDate";
    var sort = "desc";
    $(document).ready(function () {
        createDate();
    });
    function showList(list,id) {
        $("#"+id).html("");
        if(list.length > 0){
            var idIndex = 0;
            $.each(list,function (index,item) {
                if(index == 0 || (index % 3) == 0){
                    idIndex = index;
                    $("#"+id).append("<div id=\""+id+""+idIndex+"\" class=\"row\"></div>");
                }
                $("#"+id+""+idIndex).append("<div class=\"col-md-4 col-sm-4\"><div class=\""+className()+"\"><div class=\"panel-heading\">" +
                        "<span class=\"col-sm-8 span\"><a href=\"#\" title=\""+item.title+"\">"+item.title+"</a></span>" +
                        "<span class=\"col-sm-4 span\" style=\"text-align: right\" title=\""+dateFormat(item.createDate)+"\">"+dateFormat(item.createDate)+"</span></div>" +
                        "<div class=\"panel-body title\"><p>"+item.content+"</p></div><div class=\"panel-footer\">" +
                        "<span class=\"col-sm-3 span\" title=\""+item.user.nickname+"\"><i class=\"fa fa-user\"></i>"+item.user.nickname+"</span>" +
                        "<span class=\"col-sm-3 span\" title=\""+item.commentNum+"条评论\"><i class=\"fa fa-comments\"></i>"+item.commentNum+"条评论</span>" +
                        "<span class=\"col-sm-3 span\" title=\""+item.againstNum+"人反对\"><i class=\"fa fa-frown-o\"></i>"+item.againstNum+"人反对</span>" +
                        "<span class=\"col-sm-3 span\" title=\""+item.assentNum+"人支持\"><i class=\"fa fa-smile-o\"></i>"+item.assentNum+"人支持</span>");
            });
        }else{
            $("#"+id).html("没有数据");
        }
    }

    function callback1(data) {
        if(data.code){
            var list = data.data.list;
            showList(list,"create");
            $("#page").paging({
                pageNo: page,
                totalPage: data.data.pageCount,
                totalSize: data.data.totalNum,
                callback: function(num) {
                    page = num;
                    createDate();
                }
            });
        }else{
            $("body").html(data);
        }
    }
    function callback2(data) {
        if(data.code){
            var list = data.data.list;
            showList(list,"assent");
            $("#page").paging({
                pageNo: page,
                totalPage: data.data.pageCount,
                totalSize: data.data.totalNum,
                callback: function(num) {
                    page = num;
                    assentNum();
                }
            });
        }else{
            $("body").html(data);
        }
    }
    function callback3(data) {
        if(data.code){
            var list = data.data.list;
            showList(list,"against");
            $("#page").paging({
                pageNo: page,
                totalPage: data.data.pageCount,
                totalSize: data.data.totalNum,
                callback: function(num) {
                    page = num;
                    againstNum();
                }
            });
        }else{
            $("body").html(data);
        }
    }
    function createDate() {
        orderBy = "createDate";
        getRequest("${pageContext.request.contextPath}/article/list/"+page+"/"+orderBy+"/"+sort,callback1);
    }
    function assentNum() {
        orderBy = "assent";
        getRequest("${pageContext.request.contextPath}/article/list/"+page+"/"+orderBy+"/"+sort,callback2);
    }
    function againstNum() {
        orderBy = "against";
        getRequest("${pageContext.request.contextPath}/article/list/"+page+"/"+orderBy+"/"+sort,callback3);
    }
</script>

</body>

</html>
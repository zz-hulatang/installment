<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>我的文章</title>
    <jsp:include page="../../head.jsp"/>
    <link href="${pageContext.request.contextPath}/static/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
                    <a href="${pageContext.request.contextPath}/url/success"><i class="fa fa-list"></i> 全部文章</a>
                </li>

                <li>
                    <a class="active-menu" href="#"><i class="fa fa-file-text"></i> 我的文章<span class="fa arrow"></span></a>
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
                <li><a href="${pageContext.request.contextPath}/url/success">我的文章</a></li>
                <li class="active">文章列表</li>
            </ol>

        </div>
        <div id="page-inner">

            <!-- /. ROW  -->

            <div class="row">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        Context Classes
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>文章</th>
                                    <th>创建时间</th>
                                    <th>评论量</th>
                                    <th>赞成数</th>
                                    <th>反对数</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
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
<!-- /. WRAPPER  -->


<script src="${pageContext.request.contextPath}/static/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {

        myArticles();
    });
    function myArticles(){
        getRequest("${pageContext.request.contextPath}/article/my_articles/"+localStorage.getItem("userId"),callback);
    }
    function callback(data) {
        var tbody = $("#dataTables-example").find("tbody");
        var list = data.data.list;
        if(list.length > 0){
            tbody.html("");
            $.each(list,function (index,item) {
                var articleId = item.id;
                tbody.append('<tr class="'+className2()+'"><td>'+(index+1)+'</td><td><a href="${pageContext.request.contextPath}/url/article/detail/'+articleId+'" target="_blank">'+item.title+'</a></td>' +
                    '<td>'+formatDateTime(item.createDate)+'</td>' +
                    '<td>'+item.commentNum+'</td><td>'+item.assentNum+'</td><td>'+item.againstNum+'</td>' +
                    '<td><a href="${pageContext.request.contextPath}/url/op/edit?id='+articleId+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 修改</a>&nbsp;&nbsp;&nbsp;' +
                    '<a onclick="deleteArticle('+"'"+articleId+"'"+')"><i class="fa fa-times" aria-hidden="true"></i> 删除</a></td></tr>');
            });
            $('#dataTables-example').dataTable();
        }else{
            tbody.html("暂无数据");
        }
    }

    function deleteArticle(id) {
        layer.confirm('是否删除该文章？', {
            btn: ['是','否'] //按钮
        }, function(){
            ajaxRequest("${pageContext.request.contextPath}/article/"+id,"DELETE",undefined,function (data) {
                if(data.code === 200){
                    layer.msg(data.data.msg, {icon: 1});
                    myArticles();
                }else{
                    layer.msg(data.data.msg, {icon: 2});
                }
            });
        }, function(){
//            layer.msg('也可以这样', {
//                time: 20000, //20s后自动关闭
//                btn: ['明白了', '知道了']
//            });
        });
    }
</script>

</body>

</html>
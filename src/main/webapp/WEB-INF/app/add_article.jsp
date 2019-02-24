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
                添加文章 <small>欢迎光临七楼的南瓜饼子店</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/url/success">主页</a></li>
                <li>我的文章</li>
                <li class="active">添加文章</li>
            </ol>

        </div>
        <div id="page-inner">

            <!-- /. ROW  -->

            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="title" class="col-sm-2 control-label">标题：</label>
                                        <div class="col-sm-10">
                                            <input type="hidden" class="form-control" id="op" value="${op}">
                                            <input type="hidden" class="form-control" id="id" value="${article.id}">
                                            <input type="text" class="form-control" id="title" placeholder="标题" value="${article.title}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="content" class="col-sm-2 control-label">正文：</label>
                                        <div class="col-sm-10">
                                            <div id="content">
                                                <script type="text/plain" id="editor">${article.content}</script>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="type" class="col-sm-2 control-label">话题：</label>
                                        <div class="col-sm-4">
                                            <select id="type" class="selectbox form-control">
                                                <option value="0" selected>--请选择--</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" placeholder="所选话题" id="topic" readonly value="${topics}">
                                            <input type="hidden" class="form-control" id="topicIds" readonly value="${topicIds}">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-8" style="text-align: center">
                                            <a onclick="saveArticle()" class="btn btn-danger" style="width: 30%">保存</a>
                                        </div>
                                        <div class="col-sm-2"></div>
                                    </div>
                                </form>
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
<!-- /. WRAPPER  -->

<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>

<script>

    var editor;
    $(document).ready(function() {
        topicList();
        $(".selectbox").select2();
        editor = UE.getEditor('editor',{
            initialFrameWidth:'100%',
            initialFrameHeight:500
        });
        if($("#op").val() === "edit"){
            var array = $("#topicIds").val().split(",");
            for(var i = 0; i < array.length; i++){
                topicIds.push({id:array[i]});
            }
        }
    });

    function topicList() {
        getRequest("${pageContext.request.contextPath}/topic/list",callback);
    }

    function callback(data) {
        var list = data.data.list;
        $.each(list,function (index,item) {
           $(".selectbox").append("<option value=\""+item.id+"\">"+item.name+"</option>");
        });
    }

    var topicIds = new Array();
    var topicNames = new Array();
    $(".selectbox").change(function () {
        if($("#op").val() === "edit"){
            topicIds.splice(0,topicIds.length);//清空数组
        }
        var id = $(this).children('option:selected').val();
        if(id === 0){
            return;
        }
        var name = $(this).children('option:selected').html();
        if(topicIds.indexOf(id) !== -1){
            for(var i = 0; i < topicIds.length; i++) {
                if(topicIds[i] === id) {
                    topicIds.splice(i, 1);
                    topicNames.splice(i, 1);
                    break;
                }
            }
        }else{
            if(topicIds.length >= 3){
                layer.tips("最多只能选三个","#topic");
                return;
            }
            topicIds.push({id:id});
            topicNames.push(name);
        }
        var str = "";
        for(var i = 0; i < topicNames.length; i++){
            if(i === 0){
                str = topicNames[0];
            }else{
                str = str + "," + topicNames[i];
            }
        }
        $("#topic").val(str);
    });
    
    function saveArticle() {
        var title = $("#title").val();
        if(!validInput(title,"title")) return;
        var content = editor.getContent();
        if(!validInput(content,"content")) return;

        if(topicIds.length === 0){
            layer.tips("请选择话题","#topic");
            return;
        }
        var article = {
            userId:localStorage.getItem("id"),
            title:title,
            content:content,
            topics:topicIds
        };
        if($("#op").val() === "edit"){
            article.id = $("#id").val();
        }
        postRequest("${pageContext.request.contextPath}/article/save",article,function (data) {
            if(data.code == 200){
                window.location.href = "${pageContext.request.contextPath}/url/success";
            }else if(data.code == 403){
                msg("添加失败");
            }
            else{
                $("body").html(data);
            }
        });
    }
</script>

</body>

</html>
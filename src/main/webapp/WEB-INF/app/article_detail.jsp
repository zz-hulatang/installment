<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>HTML5 Responsive Portfolio Template</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/bootstrap.css" />
    <link href="${pageContext.request.contextPath}/static/assets/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/framework.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/general.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/site.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/app.js"></script>
</head>

<body>

<!-- -------------------------------------------------------------------------------------------- -->

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-3 col-xs-6">
                <a class="navbar-brand" style="width: auto;height: auto;margin-left: -100px" href="#">
                    <img src="${pageContext.request.contextPath}/static/assets/img/logo.png" alt=""></a>
            </div>

            <div class="col-md-8" style="text-align: center">
                <h1>${article.title}</h1>
            </div>

            <div class="col-md-2 col-sm-3 col-xs-6">
                <div class="text-left mr15">
                    <img dataset="static/media/pic.png" alt="" width="45" height="45" class="avatar"
                         src="${pageContext.request.contextPath}/${user.imgUrl}"> &nbsp;${user.nickname}
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- -------------------------------------------------------------------------------------------- -->
<div class="mother">
    <article class="main" role="main">
        <section class="stack-fixed entry-text">
            <div class="top-mast">
                <h1><span class="colored">正文...</span></h1>
            </div>

            <p>${article.content }</p>

            <div id="time" style="text-align: right">
                <i class="fa fa-comments"></i><span class="colored"> ${article.commentNum} </span>条评论 &nbsp;
                <i class="fa fa-smile-o"></i><span class="colored"> ${article.assentNum} </span>人赞成 &nbsp;
                <i class="fa fa-frown-o"></i><span class="colored"> ${article.againstNum} </span>人反对 &nbsp;
                创建于:  <script>$("#time").append("<span class=\"colored\">"+formatDateTime(${article.createDate})+"</span>")</script>
            </div>

            <div class="top-mast">
                <h1><span class="colored">评论...</span></h1><br>
                <div id="comments">
                    <div class="comment">
                        <div class="row">
                            <div class="col-md-2">
                                <img dataset="static/media/pic.png" alt="" width="30" height="30" class="avatar"
                                     src="${pageContext.request.contextPath}/${user.imgUrl}"> &nbsp;${user.nickname}
                            </div>
                            <div class="col-md-6"></div>
                            <div class="col-md-4 text-right">2017-12-05 16:30:57</div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">adjkadjkad啊看见的卡掉了卡死了大卡司考虑到sad打开链接点击打开啦</div>
                            <div class="col-md-2"></div>
                        </div>
                    </div><br>

                    <div class="comment">
                        <div class="row">
                            <div class="col-md-2">
                                <img dataset="static/media/pic.png" alt="" width="30" height="30" class="avatar"
                                     src="${pageContext.request.contextPath}/${user.imgUrl}"> &nbsp;${user.nickname}
                            </div>
                            <div class="col-md-6"></div>
                            <div class="col-md-4 text-right">2017-12-05 16:30:57</div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">adjkadjkad啊看见的卡掉了卡死了大卡司考虑到sad打开链接点击打开啦</div>
                            <div class="col-md-2"></div>
                        </div>
                    </div><br>

                    <div class="comment">
                        <div class="row">
                            <div class="col-md-2">
                                <img dataset="static/media/pic.png" alt="" width="30" height="30" class="avatar"
                                     src="${pageContext.request.contextPath}/${user.imgUrl}"> &nbsp;${user.nickname}
                            </div>
                            <div class="col-md-6"></div>
                            <div class="col-md-4 text-right">2017-12-05 16:30:57</div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">adjkadjkad啊看见的卡掉了卡死了大卡司考虑到sad打开链接点击打开啦</div>
                            <div class="col-md-2"></div>
                        </div>
                    </div><br>
                </div>
            </div>
        </section>
    </article>

</div>


</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>富凯分期</title>
    <jsp:include page="../../head.jsp"/>
</head>

<body>
<div id="wrapper">

    <!--/. NAV TOP  -->
    <jsp:include page="../../nav.jsp"/>

    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                全部用户 <small>欢迎光临富凯分期</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/success">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/modify_password">设置</a></li>
                <li class="active">修改密码</li>
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
                                    <form id="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="oldPass" class="col-sm-2 control-label">旧密码</label>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control" id="oldPass" name="oldPass" placeholder="请输入旧密码">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="newPass" class="col-sm-2 control-label">新密码</label>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control" id="newPass" name="newPass" placeholder="请输入新密码">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="newPass2" class="col-sm-2 control-label">确认密码</label>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control" id="newPass2" name="newPass2" placeholder="再次输入新密码">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="button" class="btn btn-default" onclick="modifyPassword()">提 交</button>
                                            </div>
                                        </div>
                                    </form>
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

            <footer><p>Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://www.i757.com/">富凯分期</a></p>


            </footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<script>

    $(document).ready(function () {
        if($("#userId").val() == ''){
            window.location.href='${pageContext.request.contextPath}/index.jsp';
        }
    });

    function form2JsonString(formId) {
        var paramArray = $('#' + formId).serializeArray();
        /*请求参数转json对象*/
        var jsonObj={};
        $(paramArray).each(function(){
            jsonObj[this.name]=this.value;
        });
        console.log(jsonObj);
        // json对象再转换成json字符串
        return jsonObj;
    }

    function callback(data){
        console.log(data)
        if(data.retCode == 500){
            msg(data.retMsg);
        }else if(data.retCode == 200){
            msg(data.retMsg);
            window.location.href = "${pageContext.request.contextPath}/modify_password";
        }
    }

    function modifyPassword() {
        var oldPass = $("#oldPass").val();
        if(!validInput(oldPass,"oldPass")) return;
        var newPass = $("#newPass").val();
        if(!validInput(newPass,"newPass")) return;
        var newPass2 = $("#newPass2").val();
        if(!validInput(newPass2,"newPass2")) return;

        if(newPass !== newPass2){
            layer.tips("两次输入的密码不一致，请重新输入！","#newPass2");
            return;
        }

        postRequest("${pageContext.request.contextPath}/user//password/" + $("#userId").val(),form2JsonString("form"),callback);
    }
</script>

</body>

</html>
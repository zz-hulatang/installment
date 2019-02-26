<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>富凯分期</title>
    <jsp:include page="../../head.jsp"/>
</head>

<style type="text/css">
    .a1{
        color: #5cb85c;
    }
    .a2{
        color: #e50011;
    }
</style>

<body>
<div id="wrapper">
    <input id="infoId" type="hidden" value="${infoId}">

    <!--/. NAV TOP  -->
    <jsp:include page="../../nav.jsp"/>

    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                全部用户 <small>欢迎光临富凯分期</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/success">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/success">用户管理</a></li>
                <li class="active">详情</li>
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
                                            <th>还款期数</th>
                                            <th>还款金额</th>
                                            <th>还款日期</th>
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
        }else {
            createDate($('#infoId').val());
        }
    });
    function showList(data) {
        var list = data.data;
        $("#tbody").html("");
        if(list.length > 0){
            $.each(list,function (index,item) {
                var html = "<tr><td>" + item.repayDate + "/" + data.count + "</td><td>" + item.repayAmount
                    +"</td><td>" + item.repayTime1 +"</td>"
                if(item.repayState == 1){
                    html = html + "<td><a class='a1' onclick=editState(\""+item.id+"\",0)>已还款</a></td></tr>";
                }else{
                    html = html + "<td><a class='a2' onclick=editState(\""+item.id+"\",1)>未还款</a></td></tr>";
                }
                $("#tbody").append(html);
            });
        }else{
            $("#tbody").html("没有数据");
        }
    }

    function editState(id,state){
        getRequest("${pageContext.request.contextPath}/user/editState?installmentInfoId="+id+"&state="+state,callback2);
    }

    function callback2(data) {
        console.log(data)
        if(data.retCode == 200){
            createDate($('#infoId').val());
            alert(data.retMsg);
        }else{
            alert(data.retMsg);
        }
    }

    function callback1(data) {
        showList(data);
    }

    function createDate(infoId) {
        getRequest("${pageContext.request.contextPath}/user/queryInstallmentInfo?installId="+infoId,callback1);
    }
</script>

</body>

</html>
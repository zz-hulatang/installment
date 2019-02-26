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
                <li><a href="${pageContext.request.contextPath}/success">用户管理</a></li>
                <li class="active">添加用户</li>
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
                                            <label for="mobilePhone" class="col-sm-2 control-label">手机号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="mobilePhone" name="mobilePhone" placeholder="手机号">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="idCard" class="col-sm-2 control-label">身份证</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="idCard" name="idCard" placeholder="身份证">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 control-label">姓名</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="name" name="name" placeholder="姓名">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="interestRate" class="col-sm-2 control-label">执行利率</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="interestRate" name="interestRate" min="0" value="0">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="installmentAmount" class="col-sm-2 control-label">贷款本金</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="installmentAmount" name="installmentAmount" min="0" value="0">
                                            </div>
                                        </div>
                                        <div class="form-group" hidden="true">
                                            <label for="repayType" class="col-sm-2 control-label">还款方式</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="repayType" name="repayType" placeholder="还款方式">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="repayNumber" class="col-sm-2 control-label">还款期数</label>
                                            <div class="col-sm-4">
                                                <select id="repayNumber" name="repayNumber" class="selectpicker show-tick form-control" >
                                                    　　<option value="1">1</option>
                                                    　　<option value="2">2</option>
                                                    　　<option value="3">3</option>
                                                    　　<option value="4">4</option>
                                                    　　<option value="5">5</option>
                                                    　　<option value="6">6</option>
                                                    　　<option value="7">7</option>
                                                    　　<option value="8">8</option>
                                                    　　<option value="9">9</option>
                                                    　　<option value="10">10</option>
                                                    　　<option value="11">11</option>
                                                    　　<option value="12">12</option>
                                                    　　<option value="13">13</option>
                                                    　　<option value="14">14</option>
                                                    　　<option value="15">15</option>
                                                    　　<option value="16">16</option>
                                                    　　<option value="17">17</option>
                                                    　　<option value="18">18</option>
                                                    　　<option value="19">19</option>
                                                    　　<option value="20">20</option>
                                                    　　<option value="21">21</option>
                                                    　　<option value="22">22</option>
                                                    　　<option value="23">23</option>
                                                    　　<option value="24">24</option>
                                                    　　<option value="25">25</option>
                                                    　　<option value="26">26</option>
                                                    　　<option value="27">27</option>
                                                    　　<option value="28">28</option>
                                                    　　<option value="29">29</option>
                                                    　　<option value="30">30</option>
                                                    　　<option value="31">31</option>
                                                    　　<option value="32">32</option>
                                                    　　<option value="33">33</option>
                                                    　　<option value="34">34</option>
                                                    　　<option value="35">35</option>
                                                    　　<option value="36" selected>36</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="repayCardNumber" class="col-sm-2 control-label">还款卡号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="repayCardNumber" name="repayCardNumber" placeholder="还款卡号">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="repayDate" class="col-sm-2 control-label">首次还款日期</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" id="repayDate" name="repayDate" placeholder="首次还款日期">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="profileNumber" class="col-sm-2 control-label">档案号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="profileNumber" name="profileNumber" placeholder="档案号">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="button" class="btn btn-default" onclick="submitForm()">提 交</button>
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

            <footer><p>Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://www.i757.com/">七楼的南瓜饼子店</a></p>


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
            layer.msg(data.retMsg, {
                offset: 't',
                anim: 6
            });
        }else if(data.retCode == 200){
            alert("创建用户成功！");
            window.location.href = "${pageContext.request.contextPath}/success";
        }
    }

    function submitForm() {
        var mobilePhone = $("#mobilePhone").val();
        if(!validInput(mobilePhone,"mobilePhone")) return;
        var idCard = $("#idCard").val();
        if(!validInput(idCard,"idCard")) return;
        var name = $("#name").val();
        if(!validInput(name,"name")) return;
        var interestRate = $("#interestRate").val();
        if(interestRate == 0){
            layer.tips("执行利率不能为0！","#interestRate");
            return;
        }
        var installmentAmount = $("#installmentAmount").val();
        if(installmentAmount == 0){
            layer.tips("贷款本金不能为0！","#installmentAmount");
            return;
        }
        var repayCardNumber = $("#repayCardNumber").val();
        if(!validInput(repayCardNumber,"repayCardNumber")) return;
        var repayDate = $("#repayDate").val();
        if(!validInput(repayDate,"repayDate")) return;
        var profileNumber = $("#profileNumber").val();
        if(!validInput(profileNumber,"profileNumber")) return;

        postRequest("${pageContext.request.contextPath}/user/save",form2JsonString("form"),callback);
    }
</script>

</body>

</html>
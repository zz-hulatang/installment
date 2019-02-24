/**
 * ajax请求
 * @param url 请求路径
 * @param method 请求方法
 * @param data 参数
 * @param callback 回调方法
 */
function ajaxRequest(url,method,data,callback) {
    $.ajax({
        url:url,
        type:method,
        data:JSON.stringify(data),
        dataType:"json",
        beforeSend:function (xhr){
            xhr.setRequestHeader("token",localStorage.getItem("token"));
            xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            layer.load();
        },
        success:callback,
        error:function (xhr) {
            layer.msg('网络错误', {
                offset: 't',
                anim: 6
            });
        },
        complete:function (xhr,ts) {
            layer.closeAll('loading');
        }
    });
}

/**
 * get请求
 * @param url 请求路径
 * @param callback 回调方法
 */
function getRequest(url,callback) {
    ajaxRequest(url,"GET",undefined,callback);
}

/**
 * post请求
 * @param url 请求路径
 * @param data 参数
 * @param callback 回调方法
 */
function postRequest(url,data,callback){
    ajaxRequest(url,"POST",data,callback);
}

/**
 * 输入框验证
 * @param value 值
 * @param id id
 * @returns {boolean}
 */
function validInput(value,id) {
    if(value == null || value.trim(value) == "" ){
        layer.tips("不能为空","#"+id);
        return false;
    }
    return true;
}

/**
 * 顶部消息弹出框
 * @param msg 消息
 */
function msg(msg) {
    layer.msg(msg, {
        offset: 't',
        anim: 6
    });
}

/**
 * 随机返回class
 * @returns {string}
 */
function className() {
    var classArray = ["panel panel-info","panel panel-warning","panel panel-danger","panel panel-primary","panel panel-success","panel panel-default"];
    var index = parseInt(Math.random() * classArray.length);
    return classArray[index];
}
function className2() {
    var classArray = ["info","warning","danger","primary","success"];
    var index = parseInt(Math.random() * classArray.length);
    return classArray[index];
}

/**
 * 时间戳转yyy-mm-dd
 * @param longTypeDate
 * @returns {string}
 */
function dateFormat(longTypeDate){
    var dateType = "";
    var date = new Date();
    date.setTime(longTypeDate);
    dateType += date.getFullYear();   //年
    dateType += "-" + getMonth(date); //月
    dateType += "-" + getDay(date);   //日
    return dateType;
}
//返回 01-12 的月份值
function getMonth(date){
    var month = "";
    month = date.getMonth() + 1; //getMonth()得到的月份是0-11
    if(month<10){
        month = "0" + month;
    }
    return month;
}
//返回01-30的日期
function getDay(date){
    var day = "";
    day = date.getDate();
    if(day<10){
        day = "0" + day;
    }
    return day;
}

/**
 * 时间戳转yyy-mm-dd hh:mm:ss
 * @param inputTime
 * @returns {string}
 */
function formatDateTime(inputTime) {
    var date = new Date(inputTime);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
};

/**
 * 菜单隐藏、显示
 */
// function switchNav() {
//     var className = $("#sideNav").attr("class");
//     if(className == "closed"){
//         $("#sideNav").attr("class","");
//         $("#menuList").attr("style","left:0px");
//         $("#page-wrapper").attr("style","margin-left:260px");
//     }else{
//         $("#sideNav").attr("class","closed");
//         $("#menuList").attr("style","left:-260px");
//         $("#page-wrapper").attr("style","margin-left:0px");
//     }
// }

/**
 * 退出
 */
function logout() {
    getRequest("../logout",function () {
        window.location.href = "../index.jsp";
    });
}
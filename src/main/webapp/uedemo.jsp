<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 860px;height: 528px">
    <div>
        <script type="text/plain" id="editor"></script>
    </div>
</div>
<input type="button" value="获取数据" onclick="getCon()">
<br>
<form action="server.php" method="post">
    <!-- 加载编辑器的容器 -->
    <script id="container2" type="text/plain"></script>
</form>

<div id="aaaaa"></div>

<!-- 配置文件 -->
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var editor = UE.getEditor('editor');
    function getCon(){
        editor.ready(function () {
            var html = editor.getContent();
            alert(html);
            document.getElementById("aaaaa").innerHTML = html;
//            var editor2 = UE.getEditor('container2',{
//                toolbars: [],//隐藏工具栏
//                elementPathEnabled: false, //删除元素路径
//                wordCount: false,    //删除字数统计
//                readonly: true,  //只读
//                enableAutoSave: false   //自动保存
//            });
//            editor2.ready(function () {
//                editor2.setContent(html);
//            });
        });
    }
</script>
</body>
</html>

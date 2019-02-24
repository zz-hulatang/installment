<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>富凯分期</title>
	

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<%--<link rel="shortcut icon" href="favicon.ico">--%>

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">


	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/static/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body class="style-3">

		<div class="container">

			<div class="row" style="padding-top: 60px; clear: both;">

			</div>
			<div class="row" style="padding-top: 60px; clear: both;">

			</div>

			<div class="row">
				<div class="col-md-4 col-md-push-8">
					<!-- Start Sign In Form -->
					<form class="fh5co-form animate-box" data-animate-effect="fadeInRight">
						<h2>Sign In</h2>
						<div class="form-group">
							<label for="mobilePhone" class="sr-only">手机号</label>
							<input type="text" class="form-control" id="mobilePhone" placeholder="手机号" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" placeholder="密码" autocomplete="off">
						</div>
						<%--<div class="form-group">--%>
							<%--<label for="remember"><input type="checkbox" id="remember"> Remember Me</label>--%>
						<%--</div>--%>
						<div class="form-group">
							<p>没有账号? <a href="sign-up.jsp">注 册</a></p>
						</div>
						<div class="form-group">
							<input type="button" value="登 录" class="btn btn-primary" onclick="login()">
						</div>
					</form>
					<!-- END Sign In Form -->


				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<%--<div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></small></p></div>--%>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="${pageContext.request.contextPath}/static/assets/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/static/assets/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/app.js"></script>

	<script>
        $(document).keyup(function(event){
            if(event.keyCode == 13){
                login();
            }
        });

		function callback(data) {
			if (data.success != null) {
				localStorage.setItem("userName",data.user.name);
				localStorage.setItem("userName",data.user.id)
				window.location.href = "${pageContext.request.contextPath}/success";
			} else{
				msg(data.error);
			}
		}

		function login() {
			var mobilePhone = $("#mobilePhone").val();
            if(!validInput(mobilePhone,"mobilePhone")) return;
			var password = $("#password").val();
            if(!validInput(password,"password")) return;
			ajaxRequest("${pageContext.request.contextPath}/login", "POST", {
				mobilePhone : mobilePhone,
				password : password
			}, callback);
		}

	</script>

	</body>
</html>


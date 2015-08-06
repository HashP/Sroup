<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 <style type="text/css">
	body {
		background-color: #EBF5FF;
		font-size: 12px;
	}
	
	.wrapper {
		width: 980px;
		margin: 20px auto 0 auto;
		font-size: 14px;
	}
	
	@media (max-width: 980px) {
		.wrapper {
			padding-left: 15px;
			padding-right: 15px;
		}
		
		.form-control, input[type=file] {
			display: inline-block;
		}
		
		.has-feedback label~.form-control-feedback {
   			top: 0px;
		}
	}
	
	#sidebar {
		float: left;		
		width:	250px;
		margin-top: 30px;
	}
	#content {
		float: right;
		width: 700px;
		margin-top: 30px;
		margin-bottom: 100px;
		/* margin: 30px 0px 100px 80px; */
		/* border: 1px dotted red; */
	}

	.mypagetitle {
		margin: 50px 0px 20px 0px;
		font-family: '나눔고딕코딩';
	}
	
	
	
</style>
<script type="text/javascript" src="/sroup/resources/jquery/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<tiles:insertAttribute name="nav"/>
<tiles:insertAttribute name="header"/>


<div class="wrapper">

	<div id="sidebar">
<!-- 		
		<h1 class="mypagetitle">
			마이페이지
		</h1> 
-->
		<tiles:insertAttribute name="sidebar"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
</div>

<tiles:insertAttribute name="footer"/>

</body>
</html>
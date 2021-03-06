<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SROUP - ${pagetitle }</title>
<link rel="shortcut icon" href="/sroup/resources/images/favicon/favicon.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 -->
 <style type="text/css">
	body {
		font-size: 12px;	
	}
	
	.body {
		width: 980px;
		margin: 0 auto 0 auto;
	}
</style>
<script type="text/javascript" src="/sroup/resources/jquery/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	
	//footer 고정
	$( window ).resize(function() {
		var window_height = $(window).height();
		
		var nah_height = $(".nav-and-header").outerHeight(true);
		var w_height = $(".body").outerHeight(true);
		var footer = $(".footer").outerHeight(true);
		var html_height = (nah_height + w_height + footer);
		console.log("window: " + window_height );
		console.log("html: " + html_height);
		console.log("	nah_height: " + nah_height);
		console.log("	w_height: " + w_height);
		console.log("	footer: " + footer);
		
		if(window_height > html_height) {
			$(".footer").addClass("navbar-fixed-bottom");	
		} else {
			$(".footer").removeClass("navbar-fixed-bottom");
		}
		
	});
	
	$(window).resize();

});
</script>
</head>
<body>

<div class="nav-and-header">
	<tiles:insertAttribute name="nav"/>
	<tiles:insertAttribute name="header"/>
</div>

<div class="body">
	<tiles:insertAttribute name="content"/>
</div>

<tiles:insertAttribute name="footer"/>

</body>
</html>
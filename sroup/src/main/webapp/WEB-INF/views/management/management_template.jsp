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
		background-color: #f5f5f5;
	}
	html, body {
	height: 100%;	
}
	.wrapper {
		width: 1140px;
		margin: 0 auto 0 auto;
		
		margin-top: 0px;
	}
	
	
	#content {
		float: left;
		width:100%;
		margin: 30px 0px 100px 30px;
		/* border: 1px dotted red; */
	}
	
	
#page-wrapper {
	height: 80%;
}
#content{
	margin-left: 260px;
}

	
</style>
<script type="text/javascript" src="resources/jquery/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>



<TABLE width="100%" height="100%">
<tr height="100%-50px;">
<TD width="278"><tiles:insertAttribute name="nav"/></TD>
<TD><tiles:insertAttribute name="content"/></TD>
</TR>
<TR>
<TD colspan="2" style="height: 50px;"><tiles:insertAttribute name="footer" /></TD>
</TR>
</TABLE>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Uploadify Implementation</title>
<script type="text/javascript"
    	src="/sroup/resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript">
$(function() {
    $("#file_upload").uploadify({
        'swf'             : '/sroup/resources/uploadify/uploadify.swf',
        'uploader'        : '/sroup/upload.do',
        'onUploadSuccess' : function(file, data, response) {
            alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
        }
    });
});
</script>
</head>
<body>
<input id="file_upload" name="file_upload" type="file" multiple="true">
​<div id="some_file_queue"></div>
</body>
</html>
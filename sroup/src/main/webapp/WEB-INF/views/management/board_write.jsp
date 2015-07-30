<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/inc/ne/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "resources/inc/ne/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});


</script>



<div>

<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px;
display:none;">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면
됩니다.</textarea>

<button type="button" id="add_photo"  onclick="js_frmChk()">기록</button>
</div>

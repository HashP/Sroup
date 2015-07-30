<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/inc/ne/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
   oAppRef: oEditors,
   elPlaceHolder: "content", 
   sSkinURI: "resources/inc/ne/SmartEditor2Skin.html", 
   htParams : {
      bUseToolbar : true,              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : true,          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      fOnBeforeUnload : function(){}
   },
   fCreator: "createSEditor2"
});

</script>

<div>

<!-- <textarea class="col-md-12" placeholder="내용을 입력해주세요." name="post" id="content"></textarea>-->

<button type="button" id="add_photo"  onclick="js_frmChk()">기록</button>
</div>

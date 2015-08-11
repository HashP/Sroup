<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<div class="container" > 
<h1 id="noticename">게시판 수정</h1>
<hr>
<div style="text-align:center">
<form id="frm" action="/sroup/board_resave.do" method="post" >
<table style="width: 802px; margin:0 auto;">
		<tr>
			<th>제목</th>
			<td><input type="text" id="title" name="title" style="width: 100%" value="${b_detail.b_title }"/></td>
		</tr>
		<tr>		
		<tr>			
			<td colspan="2">
				<textarea rows="10" cols="30" id="ir1" name="content" style="width:800px; height:415px; ">${b_detail.b_content} </textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="hidden" name="b_no" value="${b_detail.b_no}"/>
				<input type="button" id="save" value="수정"/>
				<input type="button" value="취소"/>
			</td>
		</tr>
</table>
</form>

</div>
</div>


<script type="text/javascript">
var oEditors = [];
$(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "ir1",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "resources/editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			
							fOnBeforeUnload : function(){
								
							}
						}, 
						fOnAppLoad : function(){
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							//oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
						},
						fCreator: "createSEditor2"
					});
});

$("#save").click(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#frm").submit();
})
</script>


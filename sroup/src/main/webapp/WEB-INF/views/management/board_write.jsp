<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<div class="container" > 
<h1 id="bordname">게시판 글쓰기</h1>
<hr>
<div style="text-align:center">
<form id="frm" action="/sroup/board_writesave.do" method="post" >
<table style="width: 802px; margin:0 auto;">
		<tr>
			<th>제목</th>
			<td><input type="text" id="title" name="title" style="width: 100%" onKeyPress="if(event.keyCode == 13) return false;"/></td>
		</tr>
		<tr>		
		<tr>			
			<td colspan="2">
				<textarea rows="10" cols="30" id="ir1" name="content" style="width:800px; height:415px; "></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="save" value="저장"/>
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
			
	function getByteLength(input) {
		var byteLength = 0;
		if (input == null)
			return 0;
		for (var inx = 0; inx < input.length; inx++) {
			var oneChar = escape(input.charAt(inx));
			if (oneChar.length == 1) {
				byteLength++;
			} else if (oneChar.indexOf("%u") != -1) {
				byteLength += 2;
			} else if (oneChar.indexOf("%") != -1) {
				byteLength += oneChar.length / 3;
			}
		} // enf of for loop
		return byteLength;
	}

	$("#save").click(function() {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		if ($("input[name=title]").val() == "") {
			alert("제목을 입력하세요.");
		} else if (getByteLength($("input[name=title]").val().trim())>100){
			alert("제목은 한글기준 50자 영어기준 100자까지 가능합니다.")
		}
		else {
			$("#frm").submit();
		}
	})
</script>


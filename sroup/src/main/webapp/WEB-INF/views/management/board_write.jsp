<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/inc/ne/js/HuskyEZCreator.js" charset="utf-8"></script>



<div class="container" > 
<h1 id="bordname">게시판 글쓰기</h1>
<hr>
<Div align="center">
<form id="frm" action="/insert.jsp" method="post" >
<table style =" width: 1000px; border-collapse: separate;
    							border-spacing: 3px;" >
		<tr>
			<th style="float: center; font-size: 15px; ">제목</td>
			<td><input type="text" id="title" style="width:100%;"/></td>
		</tr>		
		<tr>			
			<td colspan="2">
				<textarea rows="10" cols="30" id="ir1" name="content" style="width:100%; height:412px; "></textarea>
			</td>
		</tr>		
</table>
</form>
</Div>
<br><Br>
<div align="center">
 <button type="button" id="del_btn"  onclick="js_frmChk()">취소</button>
 <button type="button" id="add_btn"  onclick="add();">등록</button>
</div>
</div>

<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "resources/inc/ne/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
function add(){
	// html형식으로 입력한 글의 내용을 가져온다.
	alert(oEditors.getById["ir1"].getIR());
	
}
</script>


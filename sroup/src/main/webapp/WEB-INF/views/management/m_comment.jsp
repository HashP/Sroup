<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<link href="../../resources/jquery-ui/jquery-ui.css" rel="stylesheet">
<link rel=stylesheet href="../../resources/calendarPicker/jquery.calendarPicker.css" type="text/css" media="screen">
	
<style>
	textarea{
		resize: none
	}
	.c_hiddenBtn{
		width: 4%; display: inline-block;
	}		
	.c_content{
		width: 82%; display: inline-block; vertical-align: top;
	}
	.c_profile{
		width: 13%; display: inline-block; vertical-align: top;
	}
	.recomment{
	width: 100%; display: inline-block; vertical-align: top; padding: 0px 19px;
	}
	.recomment_text{
		padding: 14px 14px 0px 14px;
	}
	.re_btn:active,.re_btn:hover {color:lime;  text-decoration:none}
	.re_btn{
		
		color: white;
	}
	.calElement{
		width:100px;
	}
	.comment_content hr{
		margin-left: 40px;
	}
	pre{
margin: 0px;
border: none;
padding: 0px; 
}
</style>
<link rel=stylesheet href="../../resources/calendarPicker/jquery.calendarPicker.css" type="text/css" media="screen">



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script src="../../resources/jquery-ui/external/jquery/jquery.js"></script>
<script src="../../resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript" src="../../resources/calendarPicker/jquery.calendarPicker.js"></script>
<script type="text/javascript" src="../../resources/calendarPicker/test/jquery.mousewheel.js"></script>
<script type="text/javascript">
	function commentCheck(){		
		if($("textarea[name='content']").val().trim() == ""){
			event.preventDefault();
			alert("내용을 입력해주세요")
		}
	}
	
	function loadAfter(c_write_day){
		var d = new Date();

		  var today =
		    leadingZeros(d.getFullYear(), 2).substr(2,2) + '.' +
		    leadingZeros(d.getMonth() + 1, 2) + '.' +
		    leadingZeros(d.getDate(), 2);
         
		$(".glyphicon").hide();
		
		$(".comment_content").hover(function(){
			if($(this).find(".c_writer").attr("name")=="${sessionScope.LOGIN_ID}" && today!=c_write_day){
			$(this).find(".c_remove").show();
			$(this).find(".glyphicon-remove").show();	
			} else if($(this).find(".c_writer").attr("name")=="${sessionScope.LOGIN_ID}"&& today==c_write_day){
				$(this).find(".glyphicon").show();
			} else if("${admin}"=="${sessionScope.LOGIN_ID}"){
				$(this).find(".c_remove").show();
				$(this).find(".glyphicon-remove").show();
			}
			
		},function(){
			$(".glyphicon").hide();
		})
	}
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
	$(function() {		
		
		 $.ajax({              
             url: "checkuser.do",  
             data:{}, 
             success: function (data) {            	 
            	if(data == "false"){
            	 alert("가입한 스터디가 아닙니다.");
        	  	 location.replace('../../main.do');
            	}else {
            	}
             }                  	     
   	 	 });
		//$(".admin_btn").hide();
		
		
		$(".c_remove").click(function(){
			var id = $(this).attr("id");
			 $.ajax({              
	             url: "comment_del.do",
	             data :  {"c_no":id},                         
	             success: function (data) {	            	 
	           	  	$("#comment_content_"+id).hide("blind","slow");
	           	 	$("#comment_content_"+id).remove();
	             }                  	     
	   	  });
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		})
		$(".c_rewrite").click(function(){
			$(".comment_content").children().show();
			$(".recomment").remove();
			var id = $(this).attr("id");
			$("#comment_content_"+id).children().hide()
			$("#comment_content_"+id).css({"margin-left": "0"})
			var html = ""			
			+"	<div class=\"recomment\">"	
			+""
			+"<form class=\"form-horizontal\" role=\"form\" action=\"\">"
			+"<div class=\"form-group\" style=\"padding: 14px 14px 0px 14px;\">"
			+"<textarea class=\"form-control rewrite_content\" name=\"content\""
			+"		style=\"height: 60px;\"></textarea>"
			+"</div>"
			+"<div>"				
			+"	<button class=\"btn btn-success pull-right\" type=\"submit\" onclick=\"\"><span class=\"re_btn c_rewrite_ok\" onclick=\"rewirte_ok("+id+");\">수정</span> | <span class=\"re_btn c_rewrite_cencle\" onclick=\"rewirte_cencle("+id+");\") >취소</span></button>"
			+"</div>"
			+"<br>"
		+"</form>"					
			+"	</div>"			
			+"<HR>"
			$("#comment_content_"+id).append(html);
			
			
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		});		
	
		
		
	})
	function rewirte_ok(id){		
		event.preventDefault();
		var c_content = $(".rewrite_content").val();
		 $.ajax({              
             url: "comment_resave.do",
             data :  {"c_no":id,"c_content":c_content},                         
             success: function (data) {	            	 
            	 $("#comment_content_"+id).css({"margin-left": "-40px"})
         		 $(".recomment").remove();            	 
            	 $("#c_content_"+id).html("<pre>"+data.c_content+"</pre>");            	 
            	 
            	 $("#comment_content_"+id).children().show();
           	  	
             }     
	})
	}
	function rewirte_cencle(id){	
		$("#comment_content_"+id).css({"margin-left": "-40px"})
		$(".recomment").remove();
		
		$("#comment_content_"+id).children().show();
	}
	
	
</script>
<!-- content 부분 -->
	<div class="container" style="padding-left:50px;">
		<h1 id="bordname">회원 한마디</h1>
		
		<div class="well" style="height: 200px; width:1105px">
			<form class="form-horizontal" role="form" action="comment_add.do" method="post">
				<h4>What's your think</h4>
				<div class="form-group" style="padding: 14px 14px 0px 14px;" >
					<textarea wrap="hard" class="form-control" name="content" placeholder="한 마디를 남겨주세요"
						style="height: 60px;"></textarea>
				</div>
				<div>
							<span class="remaining">
   	 <span class="count">0</span>/<span class="maxcount">1000</span>byte
	</span>	
					<button class="btn btn-success pull-right" type="submit" onclick="commentCheck();">남기기</button>
				</div>
				<br>
			</form>
		</div>
		
		<!--/well-->
		<!-- 달력 -->
		<div id="dsel2" style="width:1105px"></div>
		<br>
		<!-- /달력 -->
		<!-- 내용 입력한거 보는 곳 -->
		<div class="speak_contents" style="padding-top: 20px; width:1105px">
		
	
	</div>
	</div>
	
<script>
var calendarPicker = $("#dsel2").calendarPicker({
    monthNames:["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    useWheel:false,
    callbackDelay:500,
    years:1,
    months:5,
    days:10,
    showDayArrows:true,
    callback:function(cal) {
    	var selectDate = cal.currentDate;
    	 $.ajax({              
             url: "comment_selectday.do",
             data:{"selectDate":selectDate},             
             success: function (data) {        	  
            	 var a = data.commentList;
            	 var html="";
            	 if(data == ""){
            		 html += "<div class=\"comment_content\" id=\"comment_content_"+c_no+"\" style=\"text-align: center;\">"
            		 +"	<div class=\"c_content\" id=\"c_content_\">			"	
             		+"		<p class=\"c_content_p\"> 한 마디가 없습니다. </p>		"		
             		+"	</div>"             		
             			+"<HR>"
             			+"</div>";
            	 } else{
            		 
            	for(i in data.commentList){
            		var c_no = data.commentList[i].c_no;
            		var c_content = data.commentList[i].c_content;
            		var c_writer = data.commentList[i].c_writer;
            		var c_write_day = data.commentList[i].c_write_day;
            		var imagename = data.commentList[i].photoname
           		html += 
        		"<div class=\"comment_content\" id=\"comment_content_"+c_no+"\" style=\"margin-left: -40px;\">"
        		+"<div class=\"c_hiddenBtn \" >"
        		+"<button href=\"#\" class=\"btn btn-default glyphicon c_remove\"  id=\""+c_no+"\" onclick=\"c_remove("+c_no+");\" style=\"padding-left: 8px; padding-right: 8px; color: gray\"><span class=\"glyphicon glyphicon-remove \"></span></button><br>"
        		+"<a href=\"#\" class=\"btn btn-default glyphicon c_rewrite\" id=\""+c_no+"\" onclick=\"c_rewrite("+c_no+");\" style=\"padding-left: 8px; padding-right: 8px; color: gray\"><span class=\"glyphicon glyphicon-pencil\"></span></a>"
        		+"</div>"
        		+"	<div class=\"c_content\" id=\"c_content_"+c_no+"\">"	
        		+"		<pre>"+c_content+"<pre>"	
        		+"	</div>"
        		+"	<div class=\"c_profile\" id=\"c_profile_"+c_no+"\">"
        		+"	<small class=\"text-muted c_writer \" name="+c_writer+">"+c_writer+"</small>"
        		+"			<small class=\"text-muted c_write_day\">"+c_write_day+"</small>"
        		+"		<a href=\"#\" class=\"pull-right\">"        		
        		+"		<img src=\"../../resources/images/profile/"+imagename+"\" class=\"img-circle\"></a>"			       				
        			+"	</div>"
        			+"<HR>"
        			+"</div>";
            	}
            	 }        			
        			$(".speak_contents").html(html);
        			//페이지 로드 된 후 실행
        			loadAfter(c_write_day);
             } 
   	  });
    }});
    
    	function c_remove(id){
			
			 $.ajax({              
	             url: "comment_del.do",
	             data :  {"c_no":id},                         
	             success: function (data) {	            	 
	           	  	$("#comment_content_"+id).hide("blind","slow");
	           	 	$("#comment_content_"+id).remove();
	             }                  	     
	   	  });
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		}
		function c_rewrite(id){
			$(".comment_content").children().show();
			var content = $("#comment_content_"+id).find("pre").text()
			$(".recomment").remove();			
			$("#comment_content_"+id).children().hide()
			$("#comment_content_"+id).css({"margin-left": "0"})
			
			var html = ""			
			+"	<div class=\"recomment\">"	
			+""
			+"<form class=\"form-horizontal\" role=\"form\" action=\"\">"
			+"<div class=\"form-group\" style=\"padding: 14px 14px 0px 14px;\">"
			+"<textarea wrap=\"hard\" class=\"form-control rewrite_content\" name=\"recontent\""
			+"		style=\"height: 60px;\">"+content+"</textarea>"
			+"</div>"
			+"<div>"				
			+"	<button class=\"btn btn-success pull-right\" type=\"submit\" onclick=\"\"><span class=\"re_btn c_rewrite_ok\" onclick=\"rewirte_ok("+id+");\">수정</span> | <span class=\"re_btn c_rewrite_cencle\" onclick=\"rewirte_cencle("+id+");\") >취소</span></button>"
			+"</div>"
			+"<br>"
		+"</form>"	
		+"<hr>"
			+"	</div>"			
			
			$("#comment_content_"+id).append(html);
			
			
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		}		
    	
		 $('.remaining').each(function () {
	            // count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
	            var $maxcount = $('.maxcount', this);
	            var $count = $('.count', this);
	            var $input = $("textarea[name=content]");
	 
	            // .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
	            var maximumByte = $maxcount.text() * 1;
	            // update 함수는 keyup, paste, input 이벤트에서 호출한다.
	            var update = function () {
	                var before = $count.text() * 1;
	                var str_len = $input.val().length;
	                var cbyte = 0;
	                var li_len = 0;
	                for (i = 0; i < str_len; i++) {
	                    var ls_one_char = $input.val().charAt(i);
	                    if (escape(ls_one_char).length > 4) {
	                        cbyte += 2; //한글이면 2를 더한다
	                    } else {
	                        cbyte++; //한글아니면 1을 다한다
	                    }
	                    if (cbyte <= maximumByte) {
	                        li_len = i + 1;
	                    }
	                }
	                // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
	                if (parseInt(cbyte) > parseInt(maximumByte)) {
	                    alert('허용된 글자수가 초과되었습니다.\r\n\n초과된 부분은 자동으로 삭제됩니다.');
	                    var str = $input.val();
	                    var str2 = $input.val().substr(0, li_len);
	                    $input.val(str2);
	                    var cbyte = 0;
	                    for (i = 0; i < $input.val().length; i++) {
	                        var ls_one_char = $input.val().charAt(i);
	                        if (escape(ls_one_char).length > 4) {
	                            cbyte += 2; //한글이면 2를 더한다
	                        } else {
	                            cbyte++; //한글아니면 1을 다한다
	                        }
	                    }
	                }
	                $count.text(cbyte);
	            };
	            // input, keyup, paste 이벤트와 update 함수를 바인드한다
	            $input.bind('input keyup keydown paste change', function () {
	                setTimeout(update, 0)
	            });
	            update();
	        });
	   
</script>
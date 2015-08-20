<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="/sroup/resources/uploadify/jquery.uploadify.js"></script>
<link rel="stylesheet"
	href="/sroup/resources/bootstrap/jquery-ui.css">
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=fdfd44094bda508193c65c95eea570d5"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	var checkAddr = "";
	var selfCheck = "N";
	var oEditors = [];
	$(function() {
		$(".content .core .input").mouseover(function(){$(this).next().addClass("focus")})
		$(".content .core .input").mouseout(function(){$(this).next().removeClass("focus")})
		
		var phoneArr = [];
		var phone = "${userinfo.phone}";
		
		phoneArr = phone.split("-");
		
		$("#ownerPhone").val(phoneArr[0]);
		$("#ownerPhoneBody").val(phoneArr[1]);
		$("#ownerPhoneTail").val(phoneArr[2]);
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "resources/se2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
					
				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["content"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		
		function pasteHTML(fileName) {
			
			var sHTML = "<img style='color:#4195f5;'>"+fileName+"<\/span>";
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		$("#attachToContent").uploadify({
            'swf'      : '/sroup/resources/uploadify/uploadify.swf',
            'uploader' : '/sroup/upload.do',  // 파일업로드를 실제로 처리할 php 파일입니다  
            'fileTypeDesc' : '*.jpg;*.png;*.gif;*.bmp;',
            'fileTypeExts' : '*.jpg;*.png;*.gif;*.bmp;',
            'onUploadSuccess' : function(file, data, response) {  //업로드 성공시 세팅하는곳
          	  	var data = data.split("|");
            	var imgUrl = data[0];
            	var html = "";
            	
            	html = '<img src="/sroup'+ imgUrl + '" />'
            	
            	oEditors.getById["content"].exec("PASTE_HTML", [html]);
             }
     	});
		
		var uploadButton = $(".banner .change");
		uploadButton.uploadify({
			  swf: '/sroup/resources/uploadify/uploadify.swf',
		      uploader: '/sroup/upload.do',
		      fileObjName: 'Filedata',
		      fileTypeExts: '*.jpg;*.jpeg;*.gif;*.png',
		      fileTypeDesc: 'Image Files (.JPG, .GIF, .PNG)',
		      fileSizeLimit: '2MB',
		      buttonText: $('.banner .change').text(),
		      width: 70,
		      height: 26,
		      auto: true,
		      multi: false,
		      removeCompleted: true,
		      removeTimeout: 1,
		      queueSizeLimit: 1,
		      onUploadSuccess : function(file, data, response) {
		    	  var data = data.split("|");
	              var imgUrl = data[0];
	              var html = "";
	              
	              $('.banner>.innerBanner img').attr('src', "/sroup"+imgUrl);
	              
		      }
		      
		    
		})

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});

	$(function() {
		$(".step a").on("click", function() {
			$(".stepbox").hide();
			var box = $(this).attr("href");
			$(box).show();
		})
	})

	$(function() {
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth() + 1);
		var day = new String(date.getDate());

		if (month.length == 1) {
			month = "0" + month;
		}
		if (day.length == 1) {
			day = "0" + day;
		}

		$("#startEventDate").val(year + "-" + month + "-" + day);
		$("#endEventDate").val(year + "-" + month + "-" + day);
		$("#startAcceptDate").val(year + "-" + month + "-" + day);
		$("#endAcceptDate").val(year + "-" + month + "-" + day);
		
		$("#startEventDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					minDate : 'year + "-" + month + "-" + day',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
				});
		$("#endEventDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					minDate : 'year + "-" + month + "-" + day',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
				});
		$("#startAcceptDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
				});
		$("#endAcceptDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					minDate : 'year + "-" + month + "-" + day',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
				});

	})
	
	$(function(){
		var phone;
		var user_id;
		var sendCode = false;
		$("#sendCode").on("click", function() {
			
			var head = $("#ownerPhone").val();
			var body = $("#ownerPhoneBody").val();
			var tail = $("#ownerPhoneTail").val();
			
			if(head.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				return;
			} else if(body.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				
				return;
			} else if(tail.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				
				return;
			}
			
			if(head.length > 3) {
				alert("휴대폰 번호를 제대로 입력해 주세요.")
				return;
			} else if(body.length > 4) {
				alert("휴대폰 번호를 제대로 입력해 주세요.")
				
				return;
			} else if(tail.length > 4) {
				alert("휴대폰 번호를 제대로 입력해 주세요.")
				
				return;
			}
			
			sendCode = true;
			
			phone = head + body + tail;
			user_id = "${userinfo.id}";
			console.log("user_id : " + user_id);
			$.ajax({
				url:"sms.do",
				data: {phone : phone, user_id: user_id},
				dataType: "text",
				success : function(data) {
					alert("메시지가 발송되었습니다.")
				}
			})
		})
		
		$("#codeCheck").on("click", function() {
			
			var head = $("#ownerPhone").val();
			var body = $("#ownerPhoneBody").val();
			var tail = $("#ownerPhoneTail").val();
			
			if(head.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				
				return;
			} else if(body.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				
				return;
			} else if(tail.trim() === "") {
				alert("휴대폰 번호를 입력하세요")
				
				return;
			}
			
			if(!sendCode) {
				alert("인증번호 발송 버튼을 먼저 클릭하세요.");
				return;
			}
			
			var code = $("#secretCode").val();
			
			if(code.trim() === "") {
				alert("휴대폰에 전송된 인증번호를 입력하세요.")
				return;
			} else if(code.trim().length != 6) {
				alert("인증번호는 6자리 입니다. 다시 입력 바랍니다.")
				return;
			} 

			
			
			$.ajax({
				url:"check.do",
				data: {code : code, phone : phone, user_id : user_id},
				dataType: "text",
				success : function(result) {
					if(result === "Y") {
						alert("인증 되었습니다.")
						selfCheck = "Y";
					} else {
						alert("인증번호가 일치하지 않습니다. 다시 입력 바랍니다.")
					}
				}
			})
			
		})
		
		$("#pAddrCheck").on("click", function() {
			
			var pAddr = $("#inputAddr").val();
			
			
			if(pAddr.trim() === "") {
				alert("페이지 주소를 입력하세요.")
				
				return;
			}
			if(pAddr.length > 15) {
				alert("페이지 주소는 열다섯자 내로 입력해 주세요.")
				return;
			}
			
			$.ajax({
				url:"pAddrCheck.do",
				data: {pAddr : pAddr},
				dataType: "text",
				success : function(result) {
					if(result === "Y") {
						alert("사용하셔도 좋은 주소입니다.")
						checkAddr = "Y";
					} else {
						alert("존재하는 주소입니다. 다른 주소를 입력해 주시기 바랍니다.")
						checkAddr = "N";
					}
				}
			})
			
		})
	})

	$(function(){
		$("#searchBtn").on("click", function() {
	
			var addr = $("#POIword").val();
			console.log("addr: " + addr);
			$.ajax({
				url : "map.do",
				data : { addr : addr},
				dataType : 'json',
				success : function(data) {
					$("#resultList ul").html("");
					
					for(var i=0; i<data.results.length; i++) {
						
						var result = data.results[i].address_components[0].long_name;
						
						var componentsCnt = data.results[i].address_components.length;
						
						if(componentsCnt <= 5) {
							var dong = data.results[i].address_components[0].long_name;
							var gusi = data.results[i].address_components[1].long_name;
							var sido = data.results[i].address_components[2].long_name;
						} else {
							var dong = data.results[i].address_components[2].long_name;
							var gusi = data.results[i].address_components[3].long_name;
							var sido = data.results[i].address_components[4].long_name;
						}
						
						var lat = data.results[i].geometry.location.lat;
						var lng = data.results[i].geometry.location.lng;
						
						$("#resultList ul").append("<li id="+"rList"+" value="+lat+"A"+lng+">"+result+" ["+sido+" "+gusi+" "+dong+"]"+"</li>");
					}
					
					if(data.results.length == 0) {
						$("#resultList ul").append("<li value="+1+">존재하지 않는 주소입니다.</li>");
					}
					
					$("#resultList").removeAttr("style", "display");
					
				}
			});
			
			$("#resultList ul").on("click", "li", function(){	
				$(".nmap:first-child").remove();
				
				var value = $(this).attr("value");
				var split = value.split("A");
				
				var lat = split[0];
				var lng = split[1];
				
				var SearchPoint = new nhn.api.map.LatLng(
						lat, lng);
				var defaultLevel = 11;
				var oMap = new nhn.api.map.Map(document
						.getElementById('mapzone'), {
					point : SearchPoint,
					zoom : defaultLevel,
					enableWheelZoom : true,
					enableDragPan : true,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					minMaxLevel : [ 1, 14 ],
					size : new nhn.api.map.Size(642, 358)
				});
				var oSlider = new nhn.api.map.ZoomControl();
				oMap.addControl(oSlider);
				oSlider.setPosition({
					top : 40,
					left : 10
				});

				var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
				oMap.addControl(oMapTypeBtn);
				oMapTypeBtn.setPosition({
					top : 10,
					left : 10
				});

				var oSize = new nhn.api.map.Size(28, 37);
				var oOffset = new nhn.api.map.Size(14, 37);
				var oIcon = new nhn.api.map.Icon(
						'/sroup/resources/images/map_pin.png',
						oSize, oOffset);

				var oInfoWnd = new nhn.api.map.InfoWindow();
				oInfoWnd.setVisible(false);
				
				var oMarker = new nhn.api.map.Marker(oIcon,
						{
							title : '마커 : '
									+ SearchPoint.toString()
						});
				oMarker.setPoint(SearchPoint);
				oMap.addOverlay(oMarker);

				oMap.attach('click', function(oCustomEvent) {
					oMap.clearOverlay();
					var oPoint = oCustomEvent.point;
					var oTarget = oCustomEvent.target;

					var oMarker = new nhn.api.map.Marker(oIcon,
							{
								title : '마커 : '
										+ oPoint.toString()
							});
					oMarker.setPoint(oPoint);
					oMap.addOverlay(oMarker);
					
					$("#lat").val(oPoint.getLat());
					$("#lng").val(oPoint.getLng());
					
				});
				
				$("#lat").val(SearchPoint.getLat());
				$("#lng").val(SearchPoint.getLng());
				console.log(lng+","+lat);
				
			})
			
		});
		$(".body").on("click", function() {
			$("#resultList").attr("style", "display: none;")
		})
	});
	
	function secondStep() {
		$("#secondStep").click();
	}
	function firstStep() {
		$("#firstStep").click();
	}
	function lastStep() {
		$("#lastStep").click();
	}
	
	function check() {
		var user_id = "${userinfo.id}";
		var category = $("#category").val();
		var title = $("#title").val();
		var summary = $("#abstract").val();
		var imgStr = $('.banner>.innerBanner img').attr('src');
		var s_image = imgStr.substring(22);
		
		var textEditor = oEditors.getById["content"].getIR();
		
		var checkRule = $(".radio:checked").val();
		var maxPerson = $(".Access").val();
		
		var dues = $(".dues").val();
		
		var startDate = $("#startEventDate").val();
		var startDateTime = $("select[name=eventStartDateTime_time]").val();
		var endDate = $("#endEventDate").val();
		var endDateTime = $("select[name=eventEndDateTime_time]").val();
		var appPeriodDate = $("#endAcceptDate").val();
		var appPeriodDateTime = $("select[name=recruitEndDateTime_time]").val();
		
		var location = $("#location").val();
		
		var lat = $("#lat").val();
		var lng = $("#lng").val();
		
		var phoneHead = $("#ownerPhone").val();
		var phoneBody = $("#ownerPhoneBody").val();
		var phoneTail = $("#ownerPhoneTail").val();
		
		var secretCode = $("#secretCode").val();
		var pAddr = $("#inputAddr").val();
		
		console.log("map2.do before........................");
		
		if(category.trim() === "") {
			alert("카테고리를 선택해 주세요.");
			return false;
		}
		if(title.trim() === "") {
			alert("스터디명을 입력해 주세요.");
			return false;
		}
		if(summary.trim() === "") {
			alert("요약내용을 입력해 주세요.");
			return false;
		}
		if(textEditor.trim() === "<p><br></p>") {
			alert("상세내용을 입력해 주세요.");
			
			return false;
		}
		if(maxPerson.trim() === "") {
			alert("최대 인원을 입력해 주세요.");
			return false;
		}
		if(dues.trim() === "") {
			alert("회비를 입력해 주세요.");
			return false;
		}
		if(location.trim() === "") {
			alert("장소명을 입력해 주세요.");
			return false;
		}
		
		if(title.length > 25) {
			alert("제목은 20글자 내로 입력해 주세요.");
			return false;
		}
		if(summary.length > 300) {
			alert("요약내용은 300글자 내로 입력해 주세요.");
			return false;
		}
		if(textEditor.length > 600) {
			alert("상세내용은 600글자 내로 입력해 주세요..");
			
			return false;
		}
		if(maxPerson > 150) {
			alert("최대 인원은 150명을 넘을 수 없습니다.");
			return false;
		}
		if(dues.trim() === "") {
			alert("회비를 입력해 주세요.");
			return false;
		}
		if(location.length > 30) {
			alert("장소명은 30글자 내로 입력해 주세요.");
			return false;
		}
		
		if(phoneHead.trim() === "") {
			alert("핸드폰 번호를 입력해 주세요.");
			return false;
		}
		if(phoneBody.trim() === "") {
			alert("핸드폰 번호를 입력해 주세요.");
			return false;
		}
		if(phoneTail.trim() === "") {
			alert("핸드폰 번호를 입력해 주세요.");
			return false;
		}
		if(secretCode.trim() === "") {
			alert("인증번호를 입력해 주세요.");
			return false;
		}
		
		if(pAddr.trim() === "") {
			alert("페이지 주소를 입력해 주세요.");
			return false;
		} else if(checkAddr.trim() === "") {
			alert("페이지 중복을 확인해 주세요. ");
			return false;
		} else if(checkAddr.trim() === "N") {
			alert("다른 주소를 입력하고 다시 중복을 확인해 주세요.");
			return false;
		}
		
		if(selfCheck === "N") {
			alert("핸드폰으로 본인 인증을 반드시 해야합니다.");
			return false;
		}
		
		$.ajax({
			url:"map2.do",
			async : false,
			data: {
				lat : lat,
				lng : lng,
			},
			dataType: "json",
			success : function(data) {
				console.log("map2.do success........................");
				var c_area = data.result.items[0].addrdetail.sido;
				console.log("c_area: "+ c_area);
				
				console.log("studyAdd.do before........................");
				$.ajax({
					url:"studyAdd.do",
					async : false,
					data: {
						user_id : user_id,
						category : category,
						title : title,
						summary : summary,
						s_image : s_image,
						c_area : c_area,
						textEditor : textEditor,
						checkRule : checkRule,
						maxPerson : maxPerson,
						dues : dues,
						startDate : startDate,
						startDateTime : startDateTime,
						endDate : endDate,
						endDateTime : endDateTime,
						appPeriodDate : appPeriodDate,
						appPeriodDateTime : appPeriodDateTime,
						location : location,
						lat : lat,
						lng : lng,
						pAddr : pAddr
					},
					dataType: "text",
					success : function(data) {
						
					}
				});
			}
		})
		
		
		
		
		
	}

</script>
</head>
</head>
<body>
	<div class="content">
		<form action="/sroup/list.do"
			class="innerBorder " name="writeForm" onsubmit="return check();" >
			<input type="hidden" name="proc" value="createBaseEvent" /> <input
				type="hidden" name="eventIdx" value="0" /> <input type="hidden"
				name="banner" value="" /> <input type="hidden"
				name="eventPreviewUrl" value="/event/preview/0" target="_blank" />
			<input type="hidden" name="bannerUrl" value="" /> <input
				type="hidden" name="bannerDelete" value="0" />

			<h2 class="title">모임설정</h2>

			<div id="firstBox" class="roundBox firstStep stepbox"
				style="display: block;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title2">step.1 모임 기본 정보입력</h3>

						<div class="menu">
							<div class="step">
								<a id="firstStep" class="firstStep " href="#firstBox">STEP.1</a><a
									id="secondStep" class="secondStep" href="#secondBox">STEP.2</a><a
									id="lastStep" class="lastStep" href="#lastBox">STEP.3</a>
							</div>
						</div>
					</div>
				</div>
				<div class="core category">
					<div class="input">
						<div class="subCore category">
							<h4 class="subTitle">
								카테고리 / 제목 입력 <span class="star">*</span>
							</h4>
							<select class="category" name="category" id="category"
								style="height: 30px; width: 110px;">
								<option value="">카테고리 선택</option>
								<c:forEach var="c" items="${categories }">
								<option value="${c.sub_value }">${c.subject }</option>
								</c:forEach>
							</select><input id="title" type="text" name="title" placeholder="모임 제목을 입력해주세요."
								title="모임제목 입력" maxlength="64" class="text" />

							<div class="lengthMsg">&nbsp;</div>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							<strong>카테고리를 선택</strong>하고 <strong>모임제목</strong>을 입력해주세요. <br />
							<br /> 카테고리에 맞게 설정하시면 개설 후 검색이나<br /> 카테고리별로 보기 편하고 쉽게 찾을 수
							있습니다.<br /> <br />
						</p>
					</div>
				</div>
				<div class="core">
					<div class="input">
						<div class="subCore banner noBanner">
							<h4 class="subTitle">
								대표 이미지 <span class="star">*</span>
							</h4>

							<div class="innerBanner">
								<img
									src="http://static.onoffmix.com/images2/default/thumbnail_null.jpg"
									default="http://static.onoffmix.com/images2/default/thumbnail_null.jpg"
									alt="대표이미지" />

								<div class="bannerBorder">
									<div class="changeBox">
										<span> <a class="change" id="changeUserPhoto"
											href="#changeUserPhoto">사진변경</a>
										</span> &nbsp;
									</div>
								</div>
							</div>
							

						</div>
						<div class="subCore abstract">
							<h4 class="subTitle">
								요약내용 입력 <span class="star">*</span>
							</h4>
							<textarea id="abstract" class="text"
								title="모임 내용을 간단히 요약하여 입력해 주세요." name="abstract"></textarea>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							모임 특성에 맞는 이미지로 업로드 해주시고 <br /> 대표 이미지가 없을 경우 스룹에서 <br />
							제공하는 이미지를 사용할 수 있습니다. <br />
						</p>

						<p class="subAdvice abstract">
							개설하는 모임의 주요내용을 참여자들이 <br /> 쉽게 알 수 있도록 <strong>요약하여 입력</strong>해
							주세요.
						</p>
					</div>
				</div>
				<div class="core contents">
					<div class="input write">
						<div class="subCore">
							<h4 class="subTitle">
								상세내용 입력 <span class="star">*</span>
							</h4>

							<div class="editor">
								<textarea id="content" name="content"
									style="width: 647px; height: 412px;"></textarea>
								<button class="attach" id="attachToContent">사진 / 파일
									첨부하기</button>
							</div>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							개설하는 모임의 <strong>상세내용을 입력</strong>하고 편집기를<br /> 이용해 다양한 형태의 내용을
							입력해 주세요.<br />
						</p>
					</div>
				</div>
				<div class="core registration">
					<div class="input">
						<div class="subCore">
							<h4 class="subTitle">
								스터디 설정 <span class="star">*</span>
							</h4>
							<div class="divAccess">
								<label for="free" id="dues">스터디 최대 인원</label><input
									class="Access" type="text" name="isDues" /><label for="dues">명</label>
								<br>
							</div>
							<label for="rule" id="checkRule">승인 방식</label> <input
								class="radio" type="radio" name="rule" value="check" checked="checked" /><label
								for="rule" style="margin-right: 20px">검토 후 승인</label> <input
								class="radio" type="radio" name="rule" value="auto" /><label
								for="auto">자동 승인</label> <span class="tip">승인 방식은 <strong>검토
									후 승인을 권장</strong>합니다. 승인을 받지 못하면 간단한 스터디 정보만 공개되고, 자동 승인 방식을 선택하면 스터디
								정보가 모두 공개됩니다.
							</span>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							<br /> 스터디의 최대 인원을 입력해 주세요.<br />
							<br />
							
							개설하려는 모임의 <strong>신청자 승인 방법</strong>을 선택해<br /> 주세요.<br /> <br />
							승인 방식 여부에 따라 공개되는 정보가 다릅니다.
						</p>
					</div>
				</div>
				<div class="core isFree">
					<div class="input">
						<div class="subCore isFree">
							<h4 class="subTitle">
								회비 <span class="star">*</span>
							</h4>
							<br>
							<!-- <input class="noChecked" type="radio" name="isFree" value="" /> -->
							<div class="divDues">
								<label for="free" id="dues">회 당</label><input class="dues"
									type="text" name="isDues" /><label for="dues">원</label> <br>
								<span class="tip">* <strong> 모임의 회비를 정확히 적어주세요.</strong>
									회비가 없다면 0원으로 입력바랍니다.
								</span>
							</div>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							모임의 <strong>유/무료</strong>를 선택해주세요.<br /> <br /> 개설 이후에는 변경할 수
							없습니다.
						</p>
					</div>
					<div class="lastCore">
						<div class="action">
							<a href="#secondStep" class="next button" onclick="secondStep()">다음단계</a>
						</div>
					</div>
				</div>
			</div>
			<!--firstStep end-->
			<div id="secondBox" class="roundBox secondStep stepbox"
				style="display: none;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title2" style="background-position: 0 -40px;">step.2 일정 / 장소 정보 입력</h3>

						<div class="menu">
							<div class="step">
								<a id="firstStep" class="firstStep" href="#firstBox">STEP.1</a><a
									id="secondStep" class="secondStep" href="#secondBox">STEP.2</a><a
									id="lastStep" class="lastStep" href="#lastBox">STEP.3</a>
							</div>
						</div>
					</div>
				</div>
				<div class="core eventDate">
					<div class="input">
						<div class="subCore startEvent singleDay">
							<h4 class="subTitle">
								모임날짜 설정 <span class="star">*</span><!--<label class="days"
									for="eventEndCheck"><input id="eventEndCheck"
									type="checkbox" class="checkbox" name="eventMultiDay" value="y" />모임기간이
									하루이상일경우</label>-->
							</h4>

							<div class="dateConfig" style="width: 625px">
								<input type="hidden" name="eventEndDateInUse" value="y" /> <input
									type="hidden" name="eventStartDateTime"
									value="2015-08-01 17:30" /> <input type="hidden"
									name="eventEndDateTime" value="2015-08-01 18:00" /> <label
									for="startEventDate" class="displayNone">모임시작 날짜설정</label> <input
									id="startEventDate" class="text datepicker" type="text"
									name="eventStartDateTime_date" value="2015-08-01" /> <select
									class="date-select" name="eventStartDateTime_time">
									<option value='00:00' selected='selected'>오전 0시 00분 (자정)</option>
									<option value='00:30'>오전 0시 30분</option>
									<option value='01:00'>오전 1시 00분</option>
									<option value='01:30'>오전 1시 30분</option>
									<option value='02:00'>오전 2시 00분</option>
									<option value='02:30'>오전 2시 30분</option>
									<option value='03:00'>오전 3시 00분</option>
									<option value='03:30'>오전 3시 30분</option>
									<option value='04:00'>오전 4시 00분</option>
									<option value='04:30'>오전 4시 30분</option>
									<option value='05:00'>오전 5시 00분</option>
									<option value='05:30'>오전 5시 30분</option>
									<option value='06:00'>오전 6시 00분</option>
									<option value='06:30'>오전 6시 30분</option>
									<option value='07:00'>오전 7시 00분</option>
									<option value='07:30'>오전 7시 30분</option>
									<option value='08:00'>오전 8시 00분</option>
									<option value='08:30'>오전 8시 30분</option>
									<option value='09:00'>오전 9시 00분</option>
									<option value='09:30'>오전 9시 30분</option>
									<option value='10:00'>오전 10시 00분</option>
									<option value='10:30'>오전 10시 30분</option>
									<option value='11:00'>오전 11시 00분</option>
									<option value='11:30'>오전 11시 30분</option>
									<option value='12:00'>오후 0시 00분 (정오)</option>
									<option value='12:30'>오후 0시 30분</option>
									<option value='13:00'>오후 1시 00분</option>
									<option value='13:30'>오후 1시 30분</option>
									<option value='14:00'>오후 2시 00분</option>
									<option value='14:30'>오후 2시 30분</option>
									<option value='15:00'>오후 3시 00분</option>
									<option value='15:30'>오후 3시 30분</option>
									<option value='16:00'>오후 4시 00분</option>
									<option value='16:30'>오후 4시 30분</option>
									<option value='17:00'>오후 5시 00분</option>
									<option value='17:30'>오후 5시 30분</option>
									<option value='18:00'>오후 6시 00분</option>
									<option value='18:30'>오후 6시 30분</option>
									<option value='19:00'>오후 7시 00분</option>
									<option value='19:30'>오후 7시 30분</option>
									<option value='20:00'>오후 8시 00분</option>
									<option value='20:30'>오후 8시 30분</option>
									<option value='21:00'>오후 9시 00분</option>
									<option value='21:30'>오후 9시 30분</option>
									<option value='22:00'>오후 10시 00분</option>
									<option value='22:30'>오후 10시 30분</option>
									<option value='23:00'>오후 11시 00분</option>
									<option value='23:30'>오후 11시 30분</option>
								</select>
								<span class="space">부터</span> <label for="endEventDate"
									class="displayNone">모임등록시작 날짜설정</label> <input
									id="endEventDate" class="text datepicker" type="text"
									name="recruitEndDateTime_date" value="2015-08-01" /> <select
									class="date-select" name="eventEndDateTime_time">
									<option value='00:00'>오전 0시 00분 (자정)</option>
									<option value='00:30'>오전 0시 30분</option>
									<option value='01:00'>오전 1시 00분</option>
									<option value='01:30'>오전 1시 30분</option>
									<option value='02:00'>오전 2시 00분</option>
									<option value='02:30'>오전 2시 30분</option>
									<option value='03:00'>오전 3시 00분</option>
									<option value='03:30'>오전 3시 30분</option>
									<option value='04:00'>오전 4시 00분</option>
									<option value='04:30'>오전 4시 30분</option>
									<option value='05:00'>오전 5시 00분</option>
									<option value='05:30'>오전 5시 30분</option>
									<option value='06:00'>오전 6시 00분</option>
									<option value='06:30'>오전 6시 30분</option>
									<option value='07:00'>오전 7시 00분</option>
									<option value='07:30'>오전 7시 30분</option>
									<option value='08:00'>오전 8시 00분</option>
									<option value='08:30'>오전 8시 30분</option>
									<option value='09:00'>오전 9시 00분</option>
									<option value='09:30'>오전 9시 30분</option>
									<option value='10:00'>오전 10시 00분</option>
									<option value='10:30'>오전 10시 30분</option>
									<option value='11:00'>오전 11시 00분</option>
									<option value='11:30'>오전 11시 30분</option>
									<option value='12:00'>오후 0시 00분 (정오)</option>
									<option value='12:30'>오후 0시 30분</option>
									<option value='13:00'>오후 1시 00분</option>
									<option value='13:30'>오후 1시 30분</option>
									<option value='14:00'>오후 2시 00분</option>
									<option value='14:30'>오후 2시 30분</option>
									<option value='15:00'>오후 3시 00분</option>
									<option value='15:30'>오후 3시 30분</option>
									<option value='16:00'>오후 4시 00분</option>
									<option value='16:30'>오후 4시 30분</option>
									<option value='17:00' selected='selected'>오후 5시 00분</option>
									<option value='17:30'>오후 5시 30분</option>
									<option value='18:00'>오후 6시 00분</option>
									<option value='18:30'>오후 6시 30분</option>
									<option value='19:00'>오후 7시 00분</option>
									<option value='19:30'>오후 7시 30분</option>
									<option value='20:00'>오후 8시 00분</option>
									<option value='20:30'>오후 8시 30분</option>
									<option value='21:00'>오후 9시 00분</option>
									<option value='21:30'>오후 9시 30분</option>
									<option value='22:00'>오후 10시 00분</option>
									<option value='22:30'>오후 10시 30분</option>
									<option value='23:00'>오후 11시 00분</option>
									<option value='23:30'>오후 11시 30분</option>
								</select> 까지
							</div>
						</div>
						<div class="subCore setupTime" style="width: 648px">
							<h4 class="subTitle">
								참여신청기간 설정 <span class="star">*</span>
							</h4>

							<div class="dateConfig">
								<input type="hidden" name="recruitStartDateInUse" value="y" />
								<input type="hidden" name="recruitStartDateTime"
									value="2015-07-31 17:30" /> <input type="hidden"
									name="recruitEndDateTime" value="2015-08-01 17:00" /> <label
									for="startAcceptDate" class="displayNone">모임등록시작 날짜설정</label> <input
									id="startAcceptDate" class="text datepicker" type="text"
									name="recruitStartDateTime_date" value="2015-07-31" disabled="true" style="cursor: no-drop" /> <select
									class="date-select" name="recruitStartDateTime_time" disabled="true" style="cursor: no-drop">
									<option value='00:00' selected='selected'>오전 0시 00분 (자정)</option>
									<option value='00:30'>오전 0시 30분</option>
									<option value='01:00'>오전 1시 00분</option>
									<option value='01:30'>오전 1시 30분</option>
									<option value='02:00'>오전 2시 00분</option>
									<option value='02:30'>오전 2시 30분</option>
									<option value='03:00'>오전 3시 00분</option>
									<option value='03:30'>오전 3시 30분</option>
									<option value='04:00'>오전 4시 00분</option>
									<option value='04:30'>오전 4시 30분</option>
									<option value='05:00'>오전 5시 00분</option>
									<option value='05:30'>오전 5시 30분</option>
									<option value='06:00'>오전 6시 00분</option>
									<option value='06:30'>오전 6시 30분</option>
									<option value='07:00'>오전 7시 00분</option>
									<option value='07:30'>오전 7시 30분</option>
									<option value='08:00'>오전 8시 00분</option>
									<option value='08:30'>오전 8시 30분</option>
									<option value='09:00'>오전 9시 00분</option>
									<option value='09:30'>오전 9시 30분</option>
									<option value='10:00'>오전 10시 00분</option>
									<option value='10:30'>오전 10시 30분</option>
									<option value='11:00'>오전 11시 00분</option>
									<option value='11:30'>오전 11시 30분</option>
									<option value='12:00'>오후 0시 00분 (정오)</option>
									<option value='12:30'>오후 0시 30분</option>
									<option value='13:00'>오후 1시 00분</option>
									<option value='13:30'>오후 1시 30분</option>
									<option value='14:00'>오후 2시 00분</option>
									<option value='14:30'>오후 2시 30분</option>
									<option value='15:00'>오후 3시 00분</option>
									<option value='15:30'>오후 3시 30분</option>
									<option value='16:00'>오후 4시 00분</option>
									<option value='16:30'>오후 4시 30분</option>
									<option value='17:00'>오후 5시 00분</option>
									<option value='17:30'>오후 5시 30분</option>
									<option value='18:00'>오후 6시 00분</option>
									<option value='18:30'>오후 6시 30분</option>
									<option value='19:00'>오후 7시 00분</option>
									<option value='19:30'>오후 7시 30분</option>
									<option value='20:00'>오후 8시 00분</option>
									<option value='20:30'>오후 8시 30분</option>
									<option value='21:00'>오후 9시 00분</option>
									<option value='21:30'>오후 9시 30분</option>
									<option value='22:00'>오후 10시 00분</option>
									<option value='22:30'>오후 10시 30분</option>
									<option value='23:00'>오후 11시 00분</option>
									<option value='23:30'>오후 11시 30분</option>
								</select> <span class="space">부터</span> <label for="endAcceptDate"
									class="displayNone">모임등록시작 날짜설정</label> <input
									id="endAcceptDate" class="text datepicker" type="text"
									name="recruitEndDateTime_date" value="2015-08-01" /> <select
									class="date-select" name="recruitEndDateTime_time">
									<option value='00:00'>오전 0시 00분 (자정)</option>
									<option value='00:30'>오전 0시 30분</option>
									<option value='01:00'>오전 1시 00분</option>
									<option value='01:30'>오전 1시 30분</option>
									<option value='02:00'>오전 2시 00분</option>
									<option value='02:30'>오전 2시 30분</option>
									<option value='03:00'>오전 3시 00분</option>
									<option value='03:30'>오전 3시 30분</option>
									<option value='04:00'>오전 4시 00분</option>
									<option value='04:30'>오전 4시 30분</option>
									<option value='05:00'>오전 5시 00분</option>
									<option value='05:30'>오전 5시 30분</option>
									<option value='06:00'>오전 6시 00분</option>
									<option value='06:30'>오전 6시 30분</option>
									<option value='07:00'>오전 7시 00분</option>
									<option value='07:30'>오전 7시 30분</option>
									<option value='08:00'>오전 8시 00분</option>
									<option value='08:30'>오전 8시 30분</option>
									<option value='09:00'>오전 9시 00분</option>
									<option value='09:30'>오전 9시 30분</option>
									<option value='10:00'>오전 10시 00분</option>
									<option value='10:30'>오전 10시 30분</option>
									<option value='11:00'>오전 11시 00분</option>
									<option value='11:30'>오전 11시 30분</option>
									<option value='12:00'>오후 0시 00분 (정오)</option>
									<option value='12:30'>오후 0시 30분</option>
									<option value='13:00'>오후 1시 00분</option>
									<option value='13:30'>오후 1시 30분</option>
									<option value='14:00'>오후 2시 00분</option>
									<option value='14:30'>오후 2시 30분</option>
									<option value='15:00'>오후 3시 00분</option>
									<option value='15:30'>오후 3시 30분</option>
									<option value='16:00'>오후 4시 00분</option>
									<option value='16:30'>오후 4시 30분</option>
									<option value='17:00' selected='selected'>오후 5시 00분</option>
									<option value='17:30'>오후 5시 30분</option>
									<option value='18:00'>오후 6시 00분</option>
									<option value='18:30'>오후 6시 30분</option>
									<option value='19:00'>오후 7시 00분</option>
									<option value='19:30'>오후 7시 30분</option>
									<option value='20:00'>오후 8시 00분</option>
									<option value='20:30'>오후 8시 30분</option>
									<option value='21:00'>오후 9시 00분</option>
									<option value='21:30'>오후 9시 30분</option>
									<option value='22:00'>오후 10시 00분</option>
									<option value='22:30'>오후 10시 30분</option>
									<option value='23:00'>오후 11시 00분</option>
									<option value='23:30'>오후 11시 30분</option>
								</select> 까지
							</div>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice startEvent">
							개설하려는 모임의 <strong>날짜</strong>를 설정해 주세요.<br /> <br /> 스터디
							시작일이 모임 날짜입니다.
						</p>

						<p class="subAdvice setupTime">
							모임에 참여하려는 참여자의 <strong>참여 신청기간</strong>을<br /> 설정합니다.<br />
							신청기간은 게시 당일부터 시작됩니다.<br />
							(참여자는 신청기간이 끝나면 해당 모임에 등록을<br /> 할 수 없습니다.)
						</p>
					</div>
				</div>
				<div class="core place">
					<div class="input" style="width: 648px; padding-right: 9px;">
						<div class="subCore location">
							<h4 class="subTitle">
								모임 장소 설정 <span class="star">*</span>
							</h4>
							<input class="location text" type='text' name='location'
								id='location' size='' maxlength='64' value='' minlen='3'
								placeholder="정확한 장소명을 입력해 주세요." />
						</div>
						<div class="subCore map">
							<div class="mapSearch">
								<input id="POIword" placeholder="시, 도, 구, 동 단위로 위치를 입력해 주세요."
									class="text" type="text" value="" /><input id="searchBtn"
									class="search button" type="button" value="" /><br />

								<div class="search result">
									<select id="SearchResult" style="display: none" MULTIPLE>
									</select>
								</div>
								<div id="resultList" style="display: none;">
									<ul>
									</ul>
								</div>
							</div>
							<div class="map holder">
								<div id='mapzone'
									style="width: 644px; height: 360px; display: block;"></div>

								<input type="hidden" name='tm128x' id="tm128x" /> <input
									type="hidden" name='tm128y' id="tm128y" /> <input
									type="hidden" name='mapX' id="lng" size='' maxlength='64'
									value='127.035448' required alias='지도좌표_X_를' confirm='123.' />
								<input type="hidden" name='mapY' id="lat" size='' maxlength='64'
									value='37.503237' required alias='지도좌표_Y_를' confirm='123.' />
								<input type="hidden" name="locality" id="sido" /> <input
									type="hidden" name="sublocality1" id="gugun" /> <input
									type="hidden" name="sublocality2" id="dong" />
							</div>
							<script type="text/javascript">
								var Lat = 37.5675451;
								var Lng = 126.9773356;
								
								var oSeoulCityPoint = new nhn.api.map.LatLng(
										Lat, Lng);
								var defaultLevel = 11;
								var oMap = new nhn.api.map.Map(document
										.getElementById('mapzone'), {
									point : oSeoulCityPoint,
									zoom : defaultLevel,
									enableWheelZoom : true,
									enableDragPan : true,
									enableDblClickZoom : false,
									mapMode : 0,
									activateTrafficMap : false,
									activateBicycleMap : false,
									minMaxLevel : [ 1, 14 ],
									size : new nhn.api.map.Size(642, 358)
								});
								var oSlider = new nhn.api.map.ZoomControl();
								oMap.addControl(oSlider);
								oSlider.setPosition({
									top : 40,
									left : 10
								});

								var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
								oMap.addControl(oMapTypeBtn);
								oMapTypeBtn.setPosition({
									top : 10,
									left : 10
								});

								var oSize = new nhn.api.map.Size(28, 37);
								var oOffset = new nhn.api.map.Size(14, 37);
								var oIcon = new nhn.api.map.Icon(
										'/sroup/resources/images/map_pin.png',
										oSize, oOffset);

								var oInfoWnd = new nhn.api.map.InfoWindow();
								oInfoWnd.setVisible(false);
								
								var oMarker = new nhn.api.map.Marker(oIcon,
										{
											title : '마커 : '
													+ oSeoulCityPoint.toString()
										});
								oMarker.setPoint(oSeoulCityPoint);
								oMap.addOverlay(oMarker);

								oMap.attach('click', function(oCustomEvent) {
									oMap.clearOverlay();
									var oPoint = oCustomEvent.point;
									var oTarget = oCustomEvent.target;

									var oMarker = new nhn.api.map.Marker(oIcon,
											{
												title : '마커 : '
														+ oPoint.toString()
											});
									oMarker.setPoint(oPoint);
									oMap.addOverlay(oMarker);
									
									$("#lat").val(oPoint.getLat());
									$("#lng").val(oPoint.getLng());
								});
								
								
								$("#lat").val(oSeoulCityPoint.getLat());
								$("#lng").val(oSeoulCityPoint.getLng());
								
							</script>
							<!-- .map.holder end -->
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice location">
							참여자들이 장소를 명확히 알 수 있도록<br /> <strong>장소명을 입력</strong>해 주세요.
						</p>

						<p class="subAdvice map">
							모임 장소 위치를 지도에 표시하기 위해 <br /> <strong>지도 위치 설정</strong>을 해 주세요.<br />
							<br /> 설정은 지역명이나 주요명칭을 기입하여<br /> 지정 할 수 있습니다. <br /> <br />
							시, 도, 구, 동 단위로 설정할 수 있습니다.<br /> <br /> 지도를 클릭하고 핀을 이동하여 위치를<br />
							지정할 수도 있습니다.<br /> <br /> 간혹 주소정보를 불러오지 못해<br /> 지역카테고리 범주에
							속하지 못할 수 있습니다.<br />
						</p>
						<p class="subAdvice lend"></p>
					</div>
				</div>
				<div class="lastCore">
					<div class="saveMsg"></div>
					<div class="action">
						<a href="#firstStep" class="prev button" onclick="firstStep()">이전</a><a href="#lastStep"
							class="next button" onclick="lastStep()">다음단계</a>
					</div>
				</div>
			</div>
			<!--secondStep end-->
			<div id="lastBox" class="roundBox lastStep stepbox"
				style="display: none;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title2" style="background-position: 0 -82px;">step.3 부가 정보 입력</h3>

						<div class="menu">
							<div class="step">
								<a id="firstStep" class="firstStep" href="#firstBox">STEP.1</a><a
									id="secondStep" class="secondStep" href="#secondBox">STEP.2</a><a
									id="lastStep" class="lastStep" href="#lastBox">STEP.3</a>
							</div>
						</div>
					</div>
				</div>
				<div class="core publicAdmin">
					<div class="input">
						<div class="subCore admin">
							<h4 class="subTitle">
								개설자 인증 서비스 <span class="star">*</span>
							</h4>
							<table width="100%" style="margin-left: 80px;">
								<tr class="admin_num">
									<th>개설자 전화번호 입력</th>
									<td><label for="ownerPhone" class="displayNone">전화번호
											앞부분 입력</label> <input class="text mask-pint" type="text"
										name="ownerPhone_head" id="ownerPhone" value="" size="4"
										maxlength="4" /> <label for="ownerPhoneBody"
										class="displayNone">전화번호 중간부분입력</label> <input
										id="ownerPhoneBody" class="mask-pint text" type="text"
										name="ownerPhone_body" value="" size="4" maxlength="4" />
										<label for="ownerPhoneTail" class="displayNone">전화번호
											뒷부분 입력</label> <input id="ownerPhoneTail" class="text mask-pint"
										type="text" name="ownerPhone_tail" value="" size="4"
										maxlength="4" /><button type="button" id="sendCode">인증번호 발송</button></td>
								</tr>
								<tr class="admin_check">
									<th>인증번호 확인</th>
									<td><input id="secretCode" class="text"
										type="text" name="ownerCode" value="" />
										<button type="button" id="codeCheck">인증번호 확인</button>
										<!--<input type="hidden" id="checkEmail" name="checkEmail" value="" equal="0" alias="이메일 중복확인이 되지 않았습니다."/>-->
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice public">
							개설자의 개인 인증이 이루어지지 않는다면 <br /> <strong>개설이 불가합니다.<br /> </strong>
							정확한 번호를 입력하여 인증 부탁드립니다.<br /><br /> 인증이 완료되면 최종확인을 통하여 <br />
							게시글을 등록 바랍니다.
						</p>
					</div>
				</div>
				<div class="core registration">
					<div class="input">
						<div class="subCore">
							<h4 class="subTitle">
								스터디 페이지 주소 설정 <span class="star">*</span>
							</h4>
							<div class="pAddr">
								<label for="free" id="pAddr">스터디 페이지 주소</label><input id="inputAddr"
									class="text" type="text" name="pAddr" style="width: 167px" /><button type="button" id="pAddrCheck">중복 확인</button>
								<br>
							</div>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							<br /> 개설되는 스터디 페이지 주소를 입력해 주세요.<br />
						</p>
					</div>
				</div>
				<div class="lastCore">
					<div class="saveMsg"></div>
					<div class="action">
						<a href="#secondStep" class="prev button" onclick="secondStep()">이전</a><input
							type="submit" class="confirm button" value="최종확인" />
					</div>
				</div>
			</div>
			<!--lastStep end-->
		</form>
		<!--innerBorder end-->
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
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

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>

</head>
</head>
<body>
	<div class="content">
		<form action="/event/add" method="post" encType="multipart/form-data"
			class="innerBorder " name="writeForm" data-hpp-max="300000"
			data-hpp-alert="그룹의 금액이 &lt;strong&gt;30만원 이상의 경우&lt;/strong&gt;에는 휴대전화 결제 설정이&lt;br /&gt;불가하여 휴대전화 결제 설정 배제 처리 됩니다.&lt;br /&gt;자세한 사항은 &lt;a href=&quot;/cs/faq/?fs=%ED%9C%B4%EB%8C%80%ED%8F%B0&quot; target=&quot;_blank&quot;&gt;FAQ&lt;/a&gt;를 확인해 주세요">
			<input type="hidden" name="proc" value="createBaseEvent" /> <input
				type="hidden" name="eventIdx" value="0" /> <input type="hidden"
				name="banner" value="" /> <input type="hidden"
				name="eventPreviewUrl" value="/event/preview/0" target="_blank" />
			<input type="hidden" name="bannerUrl" value="" /> <input
				type="hidden" name="bannerDelete" value="0" />

			<h2 class="title">모임설정</h2>

			<div class="roundBox firstStep" style="display: block;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title">step.1 모임 기본 정보입력</h3>

						<div class="menu">
							<a class="firstStep" href="#firstStep">STEP.1</a><a
								class="secondStep" href="#secondStep">STEP.2</a><a
								class="lastStep" href="#lastStep">STEP.3</a>
						</div>
					</div>
				</div>
				<div class="core category">
					<div class="input">
						<div class="subCore category">
							<h4 class="subTitle">
								카테고리 / 제목 입력 <span class="star">*</span>
							</h4>
							<select class="category" name="category" style="height: 30px;">
								<option value="">카테고리 선택</option>
								<option value="15">번개/소모임</option>
								<option value="16">교육/세미나</option>
								<option value="17">컨퍼런스</option>
								<option value="18">동문회/친목행사</option>
								<option value="19">문화행사</option>
								<option value="20">이벤트/파티</option>
								<option value="21">공동구매</option>
								<option value="22">취미활동</option>
								<option value="23">후원금 모금</option>
								<option value="24">개인경조사</option>
								<option value="25">기타</option>
								<option value="26">패션</option>
								<option value="27">뷰티</option>
								<option value="28">엔터테인먼트</option>
							</select><input id="title" type="text" name="title" value="모임제목 입력"
								title="모임제목 입력" maxlength="64" class="text" />

							<div class="lengthMsg">&nbsp;</div>
						</div>
					</div>
					<div class="advice focus">
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
											href="#changeUserPhoto">사진변경</a> <a class="delete"
											href="#deleteUserPhoto">삭제하기</a>
										</span> &nbsp;
									</div>
								</div>
							</div>
							<a class="recommend" href="#recommenBox">추천이미지 보기</a>

							<div class="recommendBox none">
								<p class="closeRecommend">
									<span class="closeBtn"></span>
								</p>
								<ul>
									<li class="first"><label for="banner-recommend-1"
										class="innerBanner"> <img
											src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_01.jpg"
											border="0" alt="추천이미지1 초대합니다" />

											<div class="bannerBorder">
												<!-- -->
											</div> <input id="banner-recommend-1" type="radio"
											name="bannerSelection"
											value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_01.jpg" />
									</label></li>
									<li class="second"><label for="banner-recommend-2"
										class="innerBanner"> <img
											src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_02.jpg"
											border="0" alt="추천이미지2 우리 만나요~" />

											<div class="bannerBorder">
												<!-- -->
											</div> <input id="banner-recommend-2" type="radio"
											name="bannerSelection"
											value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_02.jpg" />
									</label></li>
									<li class="third"><label for="banner-recommend-3"
										class="innerBanner"> <img
											src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_03.jpg"
											border="0" alt="추천이미지3 함께해요" />

											<div class="bannerBorder">
												<!-- -->
											</div> <input id="banner-recommend-3" type="radio"
											name="bannerSelection"
											value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_03.jpg" />
									</label></li>
								</ul>
								<span class="imgAdvice">대표 이미지가 없다면 <br />온오프믹스에서<br />제공하는
									<ins>추천 이미지</ins>를 선택해 주세요.
								</span>
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
							모임 특성에 맞는 이미지로 업로드 해주시고 <br /> 대표 이미지가 없을 경우 온오프믹스에서 <br />
							추천하는 이미지를 선택해 사용할 수 있습니다. <br /> <br /> 이미지 등록에 대한 안내는 <a
								href="/cs/faq/host#167" class="guideSite" target="_blank">FAQ</a>
							를 참고하세요.
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
							입력해 주세요.<br /> <br /> 사진/파일 첨부에 대한 안내는 <a
								href="/cs/faq/host#168" class="guideSite" target="_blank">FAQ</a>
							를 참고하세요.
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
								<label for="free" id="dues">스터디 최대 인원</label><input class="Access"
									type="text" name="isDues" /><label for="dues">명</label> <br>
							</div>
							<label for="free" id="checkRule">승인 방식</label>
							<input id="check" class="radio" type="radio" name="rule" value="1"/><label for="check" style="margin-right: 20px">검토 후 승인</label>
							<input id="auto" class="radio" type="radio" name="rule" value="0"/><label for="auto">자동 승인</label>
							
							<span class="tip">승인 방식은 <strong>검토 후 승인을 권장</strong>합니다.
								승인을 받지 못하면 간단한 스터디 정보만 공개되고,
								자동 승인 방식을 선택하면 스터디 정보가 모두 공개됩니다.
							</span>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice">
							개설하려는 모임의 <strong>참여자 등록 방법</strong>을 선택해<br /> 주세요.<br /> <br />
							개설은 하지만 참여 등록을 온오프믹스가 아닌<br /> 외부페이지나 별도의 다른 등록 방법을 원하시면<br />
							외부 참여 등록을 선택해 주시고 사이트 주소가<br /> 있으시면 입력창에 입력하세요.<br /> <br />
							영문형식(한글 도메인 불가)의 사이트 주소만<br /> 가능하며, 개설 이후에는 주소를 변경하실 수<br />
							없습니다.
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
						<a href="#secondStep"
							class="next button">다음단계</a><a class="temp button" href="#temp"><span>임시저장</span></a>
					</div>
				</div>
				</div>
			</div>
			<!--firstStep end-->
			<div class="roundBox secondStep" style="display: none;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title">step.2 일정 / 장소 정보 입력</h3>

						<div class="menu">
							<a class="firstStep" href="#firstStep">STEP.1</a><a
								class="secondStep" href="#secondStep">STEP.2</a><a
								class="lastStep" href="#lastStep">STEP.3</a>
						</div>
					</div>
				</div>
				<div class="core eventDate">
					<div class="input">
						<div class="subCore startEvent singleDay">
							<h4 class="subTitle">
								모임기간 설정 <span class="star">*</span><label class="days"
									for="eventEndCheck"><input id="eventEndCheck"
									type="checkbox" class="checkbox" name="eventMultiDay" value="y" />모임기간이
									하루이상일경우</label>
							</h4>

							<div class="dateConfig">
								<input type="hidden" name="eventEndDateInUse" value="y" /> <input
									type="hidden" name="eventStartDateTime"
									value="2015-08-01 17:30" /> <input type="hidden"
									name="eventEndDateTime" value="2015-08-01 18:00" /> <label
									for="startEventDate" class="displayNone">모임시작 날짜설정</label> <input
									id="startEventDate" class="text datepicker" type="text"
									name="eventStartDateTime_date" value="2015-08-01" /> <select
									class="date-select" name="eventStartDateTime_time">
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
									<option value='17:00'>오후 5시 00분</option>
									<option value='17:30' selected='selected'>오후 5시 30분</option>
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
								</select> <span class="space">부터</span> <label for="endEventDate"
									class="displayNone">모임종료 날짜설정</label> <input id="endEventDate"
									class="text datepicker" type="text"
									name="eventEndDateTime_date" value="2015-08-01"
									style="display: none" /> <select class="date-select"
									name="eventEndDateTime_time">
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
									<option value='17:00'>오후 5시 00분</option>
									<option value='17:30'>오후 5시 30분</option>
									<option value='18:00' selected='selected'>오후 6시 00분</option>
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
						<div class="subCore setupTime">
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
									name="recruitStartDateTime_date" value="2015-07-31" /> <select
									class="date-select" name="recruitStartDateTime_time">
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
									<option value='17:00'>오후 5시 00분</option>
									<option value='17:30' selected='selected'>오후 5시 30분</option>
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
							개설하려는 모임의 <strong>기간</strong>을 설정해 주세요.<br /> <br /> 모임기간이 하루
							이상일 경우 체크박스를 선택하면<br /> 모임 시작일과 종료일 설정이 가능합니다.
						</p>

						<p class="subAdvice setupTime">
							모임에 참여하려는 참여자의 <strong>참여 신청기간</strong>을<br /> 설정합니다.<br />
							(참여자는 신청기간이 끝나면 해당 모임에 등록을<br /> 할 수 없습니다.)
						</p>
					</div>
				</div>
				<div class="core place">
					<div class="input">
						<div class="subCore location">
							<h4 class="subTitle">
								모임 장소 설정 <span class="star">*</span>
							</h4>
							<input class="location text" type='text' name='location'
								id='location' size='' maxlength='64' value='' minlen='3'
								required alias='장소를' title="정확한 장소명을 입력해 주세요." />
						</div>
						<div class="subCore map">
							<div class="mapSearch">
								<input id="POIword" title="시, 도, 구, 동 단위로 위치를 입력해 주세요."
									class="text" type="text" value="" /><input
									class="search button" type="button" value="" /><br />

								<div class="search result">
									<select id="SearchResult" style="display: none" MULTIPLE>
									</select>
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
						<a href="#firstStep" class="prev button">이전</a><a href="#lastStep"
							class="next button">다음단계</a><a class="temp button" href="#temp"><span>임시저장</span></a>
					</div>
				</div>
			</div>
			<!--secondStep end-->
			<div class="roundBox lastStep" style="display: none;">
				<div class="firstCore">
					<div class="title">
						<h3 class="title">step.3 부가 정보 입력</h3>

						<div class="menu">
							<a class="firstStep" href="#firstStep">STEP.1</a><a
								class="secondStep" href="#secondStep">STEP.2</a><a
								class="lastStep" href="#lastStep">STEP.3</a>
						</div>
					</div>
				</div>
				<div class="core publicAdmin">
					<div class="input">
						<div class="subCore public">
							<h4 class="subTitle">
								공개 설정 <span class="star">*</span>
							</h4>
							<table>
								<tr>
									<th>온오프믹스 모임 목록에 노출</th>
									<td><label for="open1"><input id="open1"
											class="open radio" type="radio" name="isExposed" value="1"
											checked="checked" />노출함</label></td>
									<td><label for="close1"><input id="close1"
											class="close radio" type="radio" name="isExposed" value="0" />노출안함</label></td>
								</tr>
								<tr>
									<th>모임 공개 여부</th>
									<td><label for="open"><input id="open"
											type="radio" class="radio" name="oc" value="0"
											checked="checked" />공개 모임</label></td>
									<td><label for="close" class="close"><input
											id="close" type="radio" class="radio" name="oc" value="1" />비공개
											모임</label><input id="eventPw" title="비밀번호 입력" type="text"
										class="text outfocus" name="eventPw" value=""
										disabled="disabled" /></td>
								</tr>
							</table>
						</div>
						<div class="subCore admin">
							<h4 class="subTitle">
								연락처 및 알림 설정 <span class="star">*</span>
							</h4>
							<table width="100%">
								<tr class="admin_num">
									<th>개설자 전화번호 입력</th>
									<td><label for="ownerPhone" class="displayNone">전화번호
											앞부분 입력</label> <input class="text mask-pint" type="text"
										name="ownerPhone_head" id="ownerPhone" value="010" size="4"
										maxlength="4" /> <label for="ownerPhoneBody"
										class="displayNone">전화번호 중간부분입력</label> <input
										id="ownerPhoneBody" class="mask-pint text" type="text"
										name="ownerPhone_body" value="8545" size="4" maxlength="4" />
										<label for="ownerPhoneTail" class="displayNone">전화번호
											뒷부분 입력</label> <input id="ownerPhoneTail" class="text mask-pint"
										type="text" name="ownerPhone_tail" value="1359" size="4"
										maxlength="4" /></td>
								</tr>
								<tr class="admin_email">
									<th>개설자 이메일 입력</th>
									<td><input title="개설자 이메일 입력" id="email" class="text"
										type="text" name="ownerEmail" value="you645623@naver.com" />
										<!--<input type="hidden" id="checkEmail" name="checkEmail" value="" equal="0" alias="이메일 중복확인이 되지 않았습니다."/>-->
									</td>
								</tr>
								<tr class="admin_notify">
									<th>모임개설 알림 설정</th>
									<td><input type="checkbox" class="checkbox"
										name="postSns[]" value="facebook" id="post_to_facebook"
										checked="checked" /><label for="post_to_facebook"><span
											class="facebook"></span></label> <input type="checkbox"
										class="checkbox" name="postSns[]" value="twitter"
										id="post_to_twitter" /><label for="post_to_twitter"><span
											class="twitter"></span></label> <input type="checkbox"
										class="checkbox" name="postSns[]" value="kakao"
										id="post_to_kakao" /><label for="post_to_kakao"><span
											class="kakao"></span></label></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="advice">
						<p class="subAdvice public">
							온오프믹스에 모임을 노출할 것인지 여부를 <br /> 선택해 주시고 <strong>노출 안함을
								선택하면<br /> 온오프믹스내에 모임이 표시되지 않습니다.
							</strong> <br /> <br /> 모임을 <strong>비공개</strong>로 설정 할 경우 <strong>비밀번호</strong>를<br />
							입력 하시고 모임페이지에 비밀번호를 입력해야<br /> 모임에 접근이 가능합니다.
						</p>
						<p class="subAdvice admin">
							연락처는 개설자의 전화번호, 이메일을 정확히<br /> 입력해 주셔야 하며 모임에 대한 문의나 정보를<br />
							공유할 수 있습니다.<br /> <br /> 개설자의 SNS정보를 선택하여 모임개설의 여부를<br /> 개설과
							동시에 바로 SNS로 알릴 수 있습니다.
						</p>
					</div>
				</div>
				<div class="lastCore">
					<div class="saveMsg"></div>
					<div class="action">
						<a href="#secondStep" class="prev button">이전</a><input
							type="submit" class="confirm button" value="최종확인" /><a
							class="temp button" href="#temp"><span>임시저장</span></a>
					</div>
					<script class="template confirm" type="text/x-jquery-tmpl">
					<div class="layer">
						<h4 class="layerTitle">${title}</h3>
						<div class="layerContent">
							{{html $item.event()}}
							<div class="isFree">
								<dd>본 모임은 <strong>${isFree}</strong>모임입니다.
							</div>
							{{if wayOfRegistration != ''}}
							<div class="outUrl" ${style}>
								<dl>
									<dt>외부 참여 URL</dt>
									<dd><a href="${wayOfRegistration}" class="outLink" target="_blank">${wayOfRegistration}</a></dd>
								</dl>
							</div>
							{{else}}
							<div class="group">
								<dl>
									<dt>그룹</dt>
									<dd>{{html $item.group()}}</dd>
								</dl>
							</div>
							{{/if}}
							<div class="admin">
								<dl>
									<dt>개설자 전화번호</dt>
									<dd>${number}</dd>
									<br />
									<dt>개설자 이메일</dt>
									<dd>${email}</dd>
								</dl>
							</div>
						</div>
						<div class="guide">
							설정한 정보가 모두 맞으면 <strong>개설완료</strong>를 눌러주시고<br />
							내용 수정을 원하시면 <strong>다시 돌아가기</strong>를 눌러주세요
						</div>
						<div class="box">
							<a class="close button" href="#close">다시 돌아가기</a><input class="button confirm" value="개설완료" type="submit" /><input type="submit" class="preview button" value="미리보기" />
						</div>
						<p class="serviceBanner">
  <a href="http://onoffmix.com/place" target="_blank"><img src="http://cfile1.onoffmix.com/attach/s6PDIyENBhEN8NQTFrDi4iJJ6K9NLLun" alt="플레이스 소개" /></a>
</p>
					</div>
					</script>
				</div>
			</div>
			<!--lastStep end-->
		</form>
		<!--innerBorder end-->
	</div>

</body>
</html>
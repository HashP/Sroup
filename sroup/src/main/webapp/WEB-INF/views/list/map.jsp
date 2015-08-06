<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
                        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}</script>
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=5c2814aa90dac61ea095ac66fe8cda82"></script>
</head>

<body>
	<div id="map" style="border: 1px solid #000;"></div>
	<script type="text/javascript">
                var oSeoulCityPoint = new nhn.api.map.LatLng(37.5675451, 126.9773356);
                var defaultLevel = 11;
                var oMap = new nhn.api.map.Map(document.getElementById('map'), { 
                                                point : oSeoulCityPoint,
                                                zoom : defaultLevel,
                                                enableWheelZoom : true,
                                                enableDragPan : true,
                                                enableDblClickZoom : false,
                                                mapMode : 0,
                                                activateTrafficMap : false,
                                                activateBicycleMap : false,
                                                minMaxLevel : [ 1, 14 ],
                                                size : new nhn.api.map.Size(642, 358)           });
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
                var oIcon = new nhn.api.map.Icon('/sroup/resources/images/map_pin.png', oSize, oOffset);

                var oInfoWnd = new nhn.api.map.InfoWindow();
                oInfoWnd.setVisible(false);
                oMap.addOverlay(oInfoWnd);

                oMap.attach('click', function(oCustomEvent) {
                    oMap.clearOverlay();
                	var oPoint = oCustomEvent.point;
                    var oTarget = oCustomEvent.target;
                    oInfoWnd.setVisible(false);
                    
                    var oMarker = new nhn.api.map.Marker(oIcon, { title : '마커 : ' + oPoint.toString() });
                    oMarker.setPoint(oPoint);
                    oMap.addOverlay(oMarker);	
                    
            });
        </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- lnb -->
<aside id="lnb">
	<h1>
		<img src="<c:url value='/resources/images/common/tit_store.png'/>"
			alt="STORE" />
	</h1>
	<nav>
		<ul>
			<li><a href="/store/search">배달매장찾기</a></li>
		</ul>
	</nav>
</aside>
<!-- //lnb -->
<!-- contents -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="/home.whpr">HOME</a></li>
		<li><span>STORE</span></li>
		<li><strong>배달매장찾기</strong></li>
	</ul>

	<div id="cont_tit">
		<h1>배달매장찾기</h1>
	</div>

	<h2 class="store_tit">${sdto.name }</h2>
	<table class="table2 left_tbl">
		<caption>매장상세정보</caption>
		<colgroup>
			<col style="width: 15%" />
			<col style="width: 35%" />
			<col style="width: 15%" />
			<col style="width: 35%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">주소</th>
				<td>${sdto.address }</td>
				<th scope="row">전화번호</th>
				<td><a href="tel:070-7462-8673">${sdto.tel }</a></td>
			</tr>
			<tr>
				<th scope="row">영업시간</th>
				<td>
					<p>주중:${sdto.weekdayon }:00~${sdto.weekdayoff }:00</p>
					<p>주말:${sdto.weekendon }:00~${sdto.weekendoff }:00</p>
				</td>
				<th scope="row">매장상태</th>
				<td>개점</td>
			</tr>

		</tbody>
	</table>
	<div class="map_area mt20">

	<div id="map"></div>
		<script type="text/javascript"
			src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=7d0762c91ed93f00cf6d928deec8e3f5&libraries=services"></script>
		<script>
			var daumMap = function() {
				$('#map').width('100%');
				$('#map').height('100%');
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.5725668, 126.9804712), // 초기 지도 중심좌표(버거킹 종로구청점)
			        level: 2, // 지도의 확대 레벨
			        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
				
				// 지도를 생성한다 
				var map = new daum.maps.Map(mapContainer, mapOption); 
				
				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new daum.maps.ZoomControl();
				
				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				
				
				// 매장 지도 표시
				viewStore = function(coords, title) {
					
					// 마커 이미지의 주소
					var markerImageUrl = '<c:url value="resources/images/common/map_pin_02.png"/>', 
					    markerImageSize = new daum.maps.Size(46, 55), // 마커 이미지의 크기
					    markerImageOptions = { 
					        offset : new daum.maps.Point(23, 55)// 마커 좌표에 일치시킬 이미지 안의 좌표
					    };
					
					// 마커 이미지를 생성한다
					var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
					
					// 지도에 마커를 생성하고 표시한다
					var marker = new daum.maps.Marker({
					    position: coords, // 마커의 좌표
					    image : markerImage, // 마커의 이미지
					    map: map, // 마커를 표시할 지도 객체
					    title: title
					});
					
					// 매장좌표로 지도 이동
					map.setCenter(coords);
				}
				
				return {
					viewStore : viewStore
				}
			}
			var mapFunc = daumMap();
			
		</script>

	</div>
	<p class="button_area mt30">
		<a href="<c:url value='/store/Search.whpr'/>" class="button h40 w200 btn_gray">목록</a>
	</p>
</section>
<!-- //contents -->
<script>
	//주소-좌표 변환 객체 생성
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addressSearch('${sdto.address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	    	 
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        
			mapFunc.viewStore(coords,'${sdto.name}');
	    } 
	    
	});
	//매장 좌표 지도 표시
</script>

</html>
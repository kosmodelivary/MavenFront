<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<script>
	$(function() {
		$("#container").addClass("full");
		$("body").onload("init()");
	});
</script>

<!-- contents -->
<section id="contents"><!-- post 방식으로 바꿀것. -->
	<form name="orderForm" id="orderForm" action="<c:url value='/cart/payment.whpr'/>">
		<ul id="location">
			<li><a class="home" href="/">HOME</a></li>
			<li><strong>주문/결제</strong></li>
		</ul>
		<div id="cont_tit">
			<h1>주문/결제</h1>
		</div>

		<div class="order_tit">
			<h2>주문/결제</h2>
			<p>
				<img src="<c:url value='/resources/images/order/order_step2.gif'/>"
					alt="01장바구니, 02주문/결제(현재위치), 03주문완료" />
			</p>
		</div>
		<table class="cart_tbl table mt0" style="margin-top: 50px;">
			<caption>주문할 리스트 - 상품명, 수량, 가격등을 확인</caption>
			<colgroup>
				<col />
				<col style="width: 15%" />
				<col style="width: 20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">상품명</th>
					<th scope="col">수량</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="items" items="${map.list}" varStatus="i">
					<input type="hidden" name="menu_no" value="${items.menu_no }"/>
					<tr>
						<td class="t_left"><strong class="f14">
							<input type="hidden" name="menu_name" value="${items.menu_name}"/>
								${items.menu_name}</strong>
						</td>
						<td>
							<input type="hidden" name="amount" value="${items.amount}"/>
							${items.amount}
						</td>
						<td class="t_right">
							<input type="hidden" name="price" value="${items.menu_price*items.amount}"/>
							${items.menu_price*items.amount}</td>
					</tr>
				</c:forEach>
				<!-- <tr>
						<td class="t_left"><strong class="f14">붉은대게와퍼</strong> 
							<ul class="addOpt">
								<li>옵션</li>
							</ul>
						</td>								
						<td>1</td>
						<td class="t_right">6,300원</td>
					</tr> -->
			</tbody>
		</table>
		<ul class="comment_list mt25">
			<li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해 주세요.</li>
			<li>비회원의 경우 장바구니에 담긴 상품은 브라우저 종료 시 자동으로 삭제되오니, 상품 리스트를 보관하시려면
				회원가입 후 장바구니에 보관하여 주시기 바랍니다.</li>
			<li>버거킹 딜리버리 서비스는 배달 가능 주소 내 서비스를 제공합니다. 배달주소 변경 시 장바구니 상품은
				삭제됩니다.</li>
		</ul>

		<h3 class="cont_tit tit3 mt40">
			배달 주문정보 <span class="f12 t_red">* 필수입력사항</span>
		</h3>
		<div class="form_list pl15">
			<ul>
				<li>
					<div class="inp_wid">
						<i>*</i><input type="text" id="custNm" name="custNm"
							maxlength="10" class="input" placeholder="이름 직접입력" title="이름 입력" value="${map.ordererName }"/>
					</div>
				</li>
				<li>
					<div class="inp_wid wid4">
						<i>*</i>
						<!-- 회원 -->
						<select class="select phone" id="phone1" name="phone1"
							title="휴대폰 앞자리">
							<option value="010" <c:if test="${map.phone1 == '010' }">selected</c:if>>010</option>
							<option value="011" <c:if test="${map.phone1 == '011' }">selected</c:if>>011</option>
							<option value="016" <c:if test="${map.phone1 == '016' }">selected</c:if>>016</option>
							<option value="017" <c:if test="${map.phone1 == '017' }">selected</c:if>>017</option>
							<option value="018" <c:if test="${map.phone1 == '018' }">selected</c:if>>018</option>
							<option value="019" <c:if test="${map.phone1 == '019' }">selected</c:if>>019</option>
						</select> 
						<input type="tel" id="phone2" name="phone2" class="input phone"
							title="휴대폰 앞자리" maxlength="4" value="${map.phone2 }" /> 
						<input type="tel"
							id="phone3" name="phone3" class="input phone" title="휴대폰 뒷자리"
							maxlength="4" value="${map.phone3 }" />
					</div>
					
					<!-- 비회원 -->
					<div id="checkValidSms" class="mt10" style="display: none;">
						<div class="inp_wid wid2">
							<input type="tel" id="smsRandNum" class="input" maxlength="6"
								placeholder="인증번호 입력" title="인증번호 입력" /> <a
								href="javascript:PageFunction.checkValidSms();"
								class="button btn_gray">인증하기</a>
						</div>
					</div>
				</li>

				<li><textarea class="textarea" name="order_memo" maxlength="120"
						placeholder="배달시 참고사항 입력" title="배달시 참고사항 입력"></textarea></li>
				<li>* <font color="red">제품구성 변경은 메뉴 선택시에만 가능합니다.</font></li>
				<li>* <font color="red">예약주문은 콜센터(1599-0505)에서만 가능합니다.</font></li>
			</ul>
		</div>

		
		<div class="form_list">
			<h2 class="cont_tit tit3">
				<label for="address">주문배달지</label>
			</h2>
			<div>
				<div class="inp_wid wid4">
					<input type="text" name="defaultAddr" id="nonMemberAddr" class="input wid3" placeholder="주소" title="기본주소" readonly="readonly"/>
					<input type="button" class="pop_open button btn_gray" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
				</div>
				<div class="inp_wid wid4 mt10">
					<input type="text" name="detailAddr" id="nonMemberAddrDetail" class="input wid3" placeholder="상세주소" title="상세주소 입력" required/>
				</div>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			</div>
		</div>
		
		
			<h2 class="cont_tit tit3 mt40">배달매장</h2>
			<div>
			<p class="mb10" style="text-align:right;">
				<strong class="t_black">배달매장 직접 검색</strong>
				<input type="text" class="input wid3" placeholder="매장명 혹은 주소 입력" id="find">
				<button class="pop_open button btn_gray" onclick="findshop(document.getElementById('find').value,1)">검색</button>
			</p>
				<table class="table">
					<caption>배달 매장 정보</caption>
					<colgroup>
						<col style="width:15%" />
						<col />
						<col style="width:15%" />
						<col style="width:15%" />
						<col style="width:15%" />
						<col style="width:10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">매장명</th>
							<th scope="col">주소</th>
							<th scope="col">매장전화</th>
							<th scope="col">최소주문금액</th>
							<th scope="col">배달시간</th>
							<th scope="col">선택</th>
						</tr>
					</thead>
					<tbody id="storeInfo">
						<tr><td colspan='6'>선택된 매장정보가 없습니다.</td></tr>
					</tbody> 
				</table>

				<div>
					<div id="loca" style="overflow:visible;width:100%;height:300px;display:none;"></div>
				</div>
				
			</div>
		

		<h3 class="cont_tit tit3 mt40">결제 정보입력</h3>
		<ul class="comment_list mt25">
			<!-- <li>신용카드는 온라인 결제에서만 가능합니다.</li>
 				<li>현금결제는 배달 수령 시 버거킹딜리버리 직원에게 직접 하시면 됩니다.</li> -->
		</ul>

		<div class="cart_tbl">
			<div>
				<strong class="tit">온라인 결제</strong> <label class="radio"> <input
					type="radio" name="payFlag" value="onCredit" checked="checked" /> <span
					class="lbl">신용카드</span>
				</label>
			</div>
			<div>
				<strong class="tit">배달원에게 결제</strong> <label class="radio">
					<input type="radio" name="payFlag" value="deliCredit" /> <span
					class="lbl">신용카드</span>
				</label> <label class="radio"> <input type="radio" name="payFlag"
					value="deliCash" /> <span class="lbl">현금 </span>
				</label>
			</div>
			<div class="price_info">
				<strong>배달매장</strong>
						<span></span>
				<strong>배달예상시간</strong>
					<span>45~60분</span>
				<p class="f_right all_price">
					<span class="bold">총 상품금액</span> 
					<strong><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}" />원</strong>
				</p>
			</div>
		</div>
		<p class="button_area btn2 mt50">
			<c:set var="today" value="<%= new Date() %>"/>
			<input type="hidden" name="order_no" value="<fmt:formatDate value='${today }' pattern='yyyyMMddHHmmssS'/>"/>
			<button type="submit" class="button h50 w200 btn_org">결제하기</button>
			<a  href="<c:url value='/menu/All.whpr'/>" class="button h50 w200">계속쇼핑하기</a>
		</p>
	</form>
</section>
<!-- //contents -->
<style>
.node {
    position: absolute;
    background-image: url('<c:url value="/resources/images/common/map_pin_02.png"/>');
    cursor: pointer;
    width: 52px;
    height: 67px;
    margin: -30px 0;
}

.tooltip {
    background-color: #fff;
    position: absolute;
    border: 1px solid #333;
    font-size: 15px;
    font-weight: bold;
    padding: 3px 5px 0;
    left: 60px;
    top: 24px;
    border-radius: 5px;
    white-space: nowrap;
    display: none;
}

.tracker {
    position: absolute;
    margin: -35px 0 0 -30px;
    display: none;
    cursor: pointer;
    z-index: 3;
}

.icon {
    position: absolute;
    left: 11px;
    top: 17px;
    width: 39px;
    height: 33px;
    background-image: url('<c:url value="/resources/images/product/store.png"/>');
}

.balloon {
    position: absolute;
    width: 60px;
    height: 60px;
    background-image: url('<c:url value="/resources/images/product/balloon.png"/>');
    -ms-transform-origin: 50% 34px;
    -webkit-transform-origin: 50% 34px;
    transform-origin: 50% 34px;
}
</style>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=7d0762c91ed93f00cf6d928deec8e3f5&libraries=services"></script>
<script>
	function kakao(addr,name){
		$(".balloon").trigger("click");
		
		document.getElementById('loca').style.display = 'block';
		//주소-좌표 변환 객체 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		geocoder.addressSearch(addr, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	 
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        
				mapFunc.viewStore(coords,name);
		    } 
		});
	
	//매장 좌표 지도 표시
		var daumMap = function() {
			$('#loca').width('100%');
			$('#loca').height('300px');
			var mapContainer = document.getElementById('loca'), // 지도를 표시할 div 
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
				
				// 매장좌표로 지도 이동
				map.setCenter(coords);
				
				// 툴팁을 노출하는 마커를 생성합니다.
				var marker1 = new TooltipMarker(coords, title);
				
				marker1.setMap(map);

				// MarkerTracker를 생성합니다.
				var markerTracker1 = new MarkerTracker(map, marker1);

				// marker의 추적을 시작합니다.
				markerTracker1.run();
			}
			return {
				viewStore : viewStore
			}
		}
		var mapFunc = daumMap();
		
		function TooltipMarker(position, tooltipText) {
		    this.position = position;
		    var node = this.node = document.createElement('div');
		    node.className = 'node';

		    var tooltip = document.createElement('div');
		    tooltip.className = 'tooltip',

		    tooltip.appendChild(document.createTextNode(tooltipText));
		    node.appendChild(tooltip);
		    
		    // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
		    node.onmouseover = function() {
		        tooltip.style.display = 'block';
		    };
		    node.onmouseout = function() {
		        tooltip.style.display = 'none';
		    };
		}

		// AbstractOverlay 상속. 프로토타입 체인을 연결합니다.
		TooltipMarker.prototype = new daum.maps.AbstractOverlay;

		// AbstractOverlay의 필수 구현 메소드.
		// setMap(map)을 호출했을 경우에 수행됩니다.
		// AbstractOverlay의 getPanels() 메소드로 MapPanel 객체를 가져오고
		// 거기에서 오버레이 레이어를 얻어 생성자에서 만든 엘리먼트를 자식 노드로 넣어줍니다.
		TooltipMarker.prototype.onAdd = function() {
		    var panel = this.getPanels().overlayLayer;
		    panel.appendChild(this.node);
		};

		// AbstractOverlay의 필수 구현 메소드.
		// setMap(null)을 호출했을 경우에 수행됩니다.
		// 생성자에서 만든 엘리먼트를 오버레이 레이어에서 제거합니다.
		TooltipMarker.prototype.onRemove = function() {
		    this.node.parentNode.removeChild(this.node);
		};

		// AbstractOverlay의 필수 구현 메소드.
		// 지도의 속성 값들이 변화할 때마다 호출됩니다. (zoom, center, mapType)
		// 엘리먼트의 위치를 재조정 해 주어야 합니다.
		TooltipMarker.prototype.draw = function() {
		    // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
		    var projection = this.getProjection();
		    
		    // overlayLayer는 지도와 함께 움직이는 layer이므로
		    // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
		    var point = projection.pointFromCoords(this.position);

		    // 내부 엘리먼트의 크기를 얻어서
		    var width = this.node.offsetWidth;
		    var height = this.node.offsetHeight;

		    // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
		    this.node.style.left = (point.x - width/2) + "px";
		    this.node.style.top = (point.y - height/2) + "px";
		};

		// 좌표를 반환하는 메소드
		TooltipMarker.prototype.getPosition = function() {
		    return this.position;
		};

		/**
		 * 지도 영역 외부에 존재하는 마커를 추적하는 기능을 가진 객체입니다.
		 * 클리핑 알고리즘을 사용하여 tracker의 좌표를 구하고 있습니다.
		 */
		function MarkerTracker(map, target) {
		    // 클리핑을 위한 outcode
		    var OUTCODE = {
		        INSIDE: 0, // 0b0000
		        TOP: 8, //0b1000
		        RIGHT: 2, // 0b0010
		        BOTTOM: 4, // 0b0100
		        LEFT: 1 // 0b0001
		    };
		    
		    // viewport 영역을 구하기 위한 buffer값
		    // target의 크기가 60x60 이므로 
		    // 여기서는 지도 bounds에서 상하좌우 30px의 여분을 가진 bounds를 구하기 위해 사용합니다.
		    var BOUNDS_BUFFER = 30;
		    
		    // 클리핑 알고리즘으로 tracker의 좌표를 구하기 위한 buffer값
		    // 지도 bounds를 기준으로 상하좌우 buffer값 만큼 축소한 내부 사각형을 구하게 됩니다.
		    // 그리고 그 사각형으로 target위치와 지도 중심 사이의 선을 클리핑 합니다.
		    // 여기서는 tracker의 크기를 고려하여 40px로 잡습니다.
		    var CLIP_BUFFER = 40;

		    // trakcer 엘리먼트
		    var tracker = document.createElement('div');
		    tracker.className = 'tracker';

		    // 내부 아이콘
		    var icon = document.createElement('div');
		    icon.className = 'icon';

		    // 외부에 있는 target의 위치에 따라 회전하는 말풍선 모양의 엘리먼트
		    var balloon = document.createElement('div');
		    balloon.className = 'balloon';

		    tracker.appendChild(balloon);
		    tracker.appendChild(icon);

		    map.getNode().appendChild(tracker);

		    // traker를 클릭하면 target의 위치를 지도 중심으로 지정합니다.
		    tracker.onclick = function() {
		        map.setCenter(target.getPosition());
		        setVisible(false);
		    };

		    // target의 위치를 추적하는 함수
		    function tracking() {
		        var proj = map.getProjection();
		        
		        // 지도의 영역을 구합니다.
		        var bounds = map.getBounds();
		        
		        // 지도의 영역을 기준으로 확장된 영역을 구합니다.
		        var extBounds = extendBounds(bounds, proj);

		        // target이 확장된 영역에 속하는지 판단하고
		        if (extBounds.contain(target.getPosition())) {
		            // 속하면 tracker를 숨깁니다.
		            setVisible(false);
		        } else {
		            // target이 영역 밖에 있으면 계산을 시작합니다.
		            
		            // TooltipMarker의 위치
		            var pos = proj.containerPointFromCoords(target.getPosition());
		            
		            // 지도 중심의 위치
		            var center = proj.containerPointFromCoords(map.getCenter());

		            // 현재 보이는 지도의 영역의 남서쪽 화면 좌표
		            var sw = proj.containerPointFromCoords(bounds.getSouthWest());
		            
		            // 현재 보이는 지도의 영역의 북동쪽 화면 좌표
		            var ne = proj.containerPointFromCoords(bounds.getNorthEast());
		            
		            // 클리핑할 가상의 내부 영역을 만듭니다.
		            var top = ne.y + CLIP_BUFFER;
		            var right = ne.x - CLIP_BUFFER;
		            var bottom = sw.y - CLIP_BUFFER;
		            var left = sw.x + CLIP_BUFFER;

		            // 계산된 모든 좌표를 클리핑 로직에 넣어 좌표를 얻습니다.
		            var clipPosition = getClipPosition(top, right, bottom, left, center, pos);
		            
		            // 클리핑된 좌표를 tracker의 위치로 사용합니다.
		            tracker.style.top = clipPosition.y + 'px';
		            tracker.style.left = clipPosition.x + 'px';

		            // 말풍선의 회전각을 얻습니다.
		            var angle = getAngle(center, pos);
		            
		            // 회전각을 CSS transform을 사용하여 지정합니다.
		            // 브라우저 종류에따라 표현되지 않을 수도 있습니다.
		            // http://caniuse.com/#feat=transforms2d
		            balloon.style.cssText +=
		                '-ms-transform: rotate(' + angle + 'deg);' +
		                '-webkit-transform: rotate(' + angle + 'deg);' +
		                'transform: rotate(' + angle + 'deg);';

		            // target이 영역 밖에 있을 경우 tracker를 노출합니다.
		            setVisible(true);
		        }
		    }

		    // 상하좌우로 BOUNDS_BUFFER(30px)만큼 bounds를 확장 하는 함수
		    function extendBounds(bounds, proj) {
		        // 주어진 bounds는 지도 좌표 정보로 표현되어 있습니다.
		        // 이것을 BOUNDS_BUFFER 픽셀 만큼 확장하기 위해서는
		        // 픽셀 단위인 화면 좌표로 변환해야 합니다.
		        var sw = proj.pointFromCoords(bounds.getSouthWest());
		        var ne = proj.pointFromCoords(bounds.getNorthEast());

		        // 확장을 위해 각 좌표에 BOUNDS_BUFFER가 가진 수치만큼 더하거나 빼줍니다.
		        sw.x -= BOUNDS_BUFFER;
		        sw.y += BOUNDS_BUFFER;

		        ne.x += BOUNDS_BUFFER;
		        ne.y -= BOUNDS_BUFFER;

		        // 그리고나서 다시 지도 좌표로 변환한 extBounds를 리턴합니다.
		        // extBounds는 기존의 bounds에서 상하좌우 30px만큼 확장된 영역 객체입니다.  
		        return new daum.maps.LatLngBounds(
		                        proj.coordsFromPoint(sw),proj.coordsFromPoint(ne));
		    }

		    // Cohen–Sutherland clipping algorithm
		    // 자세한 내용은 아래 위키에서...
		    // https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm
		    function getClipPosition(top, right, bottom, left, inner, outer) {
		        function calcOutcode(x, y) {
		            var outcode = OUTCODE.INSIDE;

		            if (x < left) {
		                outcode |= OUTCODE.LEFT;
		            } else if (x > right) {
		                outcode |= OUTCODE.RIGHT;
		            }

		            if (y < top) {
		                outcode |= OUTCODE.TOP;
		            } else if (y > bottom) {
		                outcode |= OUTCODE.BOTTOM;
		            }

		            return outcode;
		        }

		        var ix = inner.x;
		        var iy = inner.y;
		        var ox = outer.x;
		        var oy = outer.y;

		        var code = calcOutcode(ox, oy);

		        while(true) {
		            if (!code) {
		                break;
		            }

		            if (code & OUTCODE.TOP) {
		                ox = ox + (ix - ox) / (iy - oy) * (top - oy);
		                oy = top;
		            } else if (code & OUTCODE.RIGHT) {
		                oy = oy + (iy - oy) / (ix - ox) * (right - ox);        
		                ox = right;
		            } else if (code & OUTCODE.BOTTOM) {
		                ox = ox + (ix - ox) / (iy - oy) * (bottom - oy);
		                oy = bottom;
		            } else if (code & OUTCODE.LEFT) {
		                oy = oy + (iy - oy) / (ix - ox) * (left - ox);     
		                ox = left;
		            }

		            code = calcOutcode(ox, oy);
		        }

		        return {x: ox, y: oy};
		    }

		    // 말풍선의 회전각을 구하기 위한 함수
		    // 말풍선의 anchor가 TooltipMarker가 있는 방향을 바라보도록 회전시킬 각을 구합니다.
		    function getAngle(center, target) {
		        var dx = target.x - center.x;
		        var dy = center.y - target.y ;
		        var deg = Math.atan2( dy , dx ) * 180 / Math.PI; 

		        return ((-deg + 360) % 360 | 0) + 90;
		    }
		    
		    // tracker의 보임/숨김을 지정하는 함수
		    function setVisible(visible) {
		        tracker.style.display = visible ? 'block' : 'none';
		    }
		    
		    // Map 객체의 'zoom_start' 이벤트 핸들러
		    function hideTracker() {
		        setVisible(false);
		    }
		    
		    // target의 추적을 실행합니다.
		    this.run = function() {
		        daum.maps.event.addListener(map, 'zoom_start', hideTracker);
		        daum.maps.event.addListener(map, 'zoom_changed', tracking);
		        daum.maps.event.addListener(map, 'center_changed', tracking);
		        tracking();
		    };
		    
		    // target의 추적을 중지합니다.
		    this.stop = function() {
		        daum.maps.event.removeListener(map, 'zoom_start', hideTracker);
		        daum.maps.event.removeListener(map, 'zoom_changed', tracking);
		        daum.maps.event.removeListener(map, 'center_changed', tracking);
		        setVisible(false);
		    };
		}
	}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('nonMemberAddr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('nonMemberAddrDetail').focus();
                
                document.getElementById('find').value = data.sigungu;
                
                document.getElementById('loca').style.display = 'none';
                
                findshop(data.sigungu,1);
            }
        }).open();
    }
    function findshop(sigungu,nowPage){
    	
    	if(sigungu.trim() == 0){
    		popAlert("검색어를 입력하세요"); return;
    	}
    	
    	$.ajax({
			url:'<c:url value="/store/findshop.whpr"/>',
			type:'post',
			dataType:'json',
			data:'find='+sigungu+"&nowPage="+nowPage,
			success:function(record){
				var recstr;
				
				if(record.length != 0){
					
					$.each(record,function(index,data){
						
						if(data.store_name != undefined){
							recstr += "<tr><td>"+data.store_name+"</td>";
							recstr += "<td class='t_left'>"+data.store_addr+"</td>";
							recstr += "</td><td>"+data.store_tel+"</td>";
							recstr += "<td scope='col'>"+data.store_minordermoney+"</td>"
							recstr += "<td>주중:"+data.store_weekdayon+":00~"+data.store_weekdayoff+":00 주말:"+data.store_weekendon+":00~"+data.store_weekendoff+":00</td>";
							recstr += "<td><label class='radio only'><input name='store_no' value='"+data.store_no+"' type='radio' onclick='kakao(\""+data.store_addr+"\",\""+data.store_name+"\")'/><span class='lbl'>선택</span></label></td></tr>";
						}
						else {
							recstr += "<tr><td colspan='6'>"+data.pagingstr+"</td></tr>";
						}
					});
				}
				else {
					recstr = "<tr><td colspan='6'>선택된 매장정보가 없습니다.</td></tr>";
					document.getElementById('loca').style.display = 'none';
				}
				$("#storeInfo").html(recstr);
			},
			error:function(request,status,error){
				alert("Error");
			}
		});
    }
</script>

<!-- 주소검색 팝업 -->
<div id="popConfirm" class="pop_bg">
	<article class="pop_wrap">
		<header class="pop_head">
			<h1>안내</h1>
		</header>
		<section class="pop_cont">
			<div>
				<div class="pt10 pb10 t_center">
					<p class="f14" id="confirm_msg"></p>
				</div>
				<p class="button_area mt10">
					<a href="javascript:PageFunction.confirmResult('Y');"
						class="button btn_org w120">예</a> <a
						href="javascript:PageFunction.confirmResult('N');"
						class="button btn_org w120">아니요</a>
				</p>
			</div>
		</section>

	</article>
</div>
<!-- //주소검색 팝업 -->
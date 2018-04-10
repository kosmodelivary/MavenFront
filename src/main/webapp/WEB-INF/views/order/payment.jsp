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
<section id="contents">
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

				<li><textarea class="textarea" name="orderMemo" maxlength="120"
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
					<input type="text" id="nonMemberAddr" class="input wid3" placeholder="주소" title="기본주소" disabled="disabled"/>
					<input type="button" class="pop_open button btn_gray" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
				</div>
				<div class="inp_wid wid4 mt10">
					<input type="text" id="nonMemberAddrDetail" class="input wid3" placeholder="상세주소" title="상세주소 입력" required/>
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
				<strong>배달매장</strong><span>구로점</span> <strong>배달예상시간</strong><span>45~60분</span>
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
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=7d0762c91ed93f00cf6d928deec8e3f5&libraries=services"></script>
<script>
	function kakao(addr,name){
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
				
				// 마커 이미지의 주소
				var markerImageUrl = '<c:url value="/resources/images/common/map_pin_02.png"/>', 
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
	}
</script>
<!-- 
<script>
	function initMap(store) {
		if(store == null) return;
		document.getElementById('loca').style.display = 'block';
		
		var storePlace = {lat: -25.363, lng: 131.044};
		var map = new google.maps.Map(document.getElementById('loca'), {
			zoom: 17,
			center: storePlace
		});

		var geocoder = new google.maps.Geocoder();
	    geocoder.geocode({'address': store}, function(results, status) {
	        if (status == 'OK') {
	          map.setCenter(results[0].geometry.location);
	          var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location,
	              icon: "<c:url value='/resources/images/common/map_pin_02.png'/>"
	          });
	        } else {
	          alert('Geocode was not successful for the following reason: ' + status);
	        }
      	});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQo9FPSR1RWpd2JWBwrhbTlIi5DzeubEM&callback=initMap"></script>
 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
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
    		alert("검색어를 입력하세요"); return;
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
							recstr += "</td>"+"<td>"+data.store_tel+"</td>";
							recstr += "<td scope='col'>"+data.store_minordermoney+"</td>"
							recstr += "<td>주중:"+data.store_weekdayon+":00~"+data.store_weekdayoff+":00 주말:"+data.store_weekendon+":00~"+data.store_weekendoff+":00</td>";
							recstr += "<td><label class='radio only'><input name='store_no' value='"+data.store_no+"' type='radio' onclick='kakao(\""+data.store_addr+"\")'/><span class='lbl'>선택</span></label></td></tr>";
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
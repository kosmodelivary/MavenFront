<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- lnb -->
		<aside id="lnb" class="hide">
			<div>
				<h1>ORDER</h1>
			</div>
		</aside>
		<!-- //lnb -->
		
		<!-- contents -->
		<section id="contents">
			<ul id="location">
				<li><a class="home" href="/">HOME</a></li>
				<!-- <li><span>버거킹 회원</span></li> -->
				<li><span>ORDER</span></li>
				<li><strong>배달주소선택</strong></li>
			</ul>
			<div id="cont_tit">
				<h1>회원 주문</h1>
			</div>
			
			<div class="full_order">
				<div id="deliveryList">
					
						<div class="form_list">
							<h2 class="cont_tit tit3">배달지 주소</h2>
							<div>
								<p class="mb10"><strong class="t_black">고객님이 이용한 배달지 주소를 5개까지 등록 하실 수 있습니다.</strong></p>
								<table class="table">
									<caption>최근배달주소 리스트 - 주소, 매장선택여부를 확인</caption>
									<colgroup>
										<col style="width:10%" />
										<col style="width:20%" />
								  		<col style="width:auto" />
								  		<col style="width:15%" />
									</colgroup>
									<thead>
											<tr>
												<th scope="col">선택</th>
												<th scope="col">주소지요약</th>											
										  		<th scope="col">주소</th>
												<th scope="col">삭제</th>
											</tr>
										</thead>
										<!-- 자주주문하는 매장 리스트 보여줌-->
										<tbody>
											<tr>
												<td>
													<label class="radio only">
													<!--
														<input type="radio" name="radio" th:value="${list.addrSeq}" th:onclick="'javascript:PageFunction.selectDelivery('+ ${list.custX} +','+ ${list.custY} +')'"/> 
													 -->
														<input type="radio" name="radio" id="radio" onclick="javascript:PageFunction.selectDelivery(288339,545876,&#39;인천광역시&#39;)" value="1" />
														<span class="lbl">선택</span>
													</label>
												</td>
												<td><strong>삼산동</strong></td>
												<td class="t_left">인천광역시 부평구 체육관로 30 이리옴프라자</td>
												<td><a class="button btn_white w60 h25" href="javascript:PageFunction.deleteDelivery(1)">삭제</a></td>
											</tr>
											<tr>
												<td>
													<label class="radio only">
													<!--
														<input type="radio" name="radio" th:value="${list.addrSeq}" th:onclick="'javascript:PageFunction.selectDelivery('+ ${list.custX} +','+ ${list.custY} +')'"/> 
													 -->
														<input type="radio" name="radio" id="radio" onclick="javascript:PageFunction.selectDelivery(301608,542312,&#39;서울특별시&#39;)" value="2" />
														<span class="lbl">선택</span>
													</label>
												</td>
												<td><strong>가산동</strong></td>
												<td class="t_left">서울특별시 금천구 가산동 (가산동) 월드메르디앙1차 1234</td>
												<td><a class="button btn_white w60 h25" href="javascript:PageFunction.deleteDelivery(2)">삭제</a></td>
											</tr>
										</tbody>
								</table>
							</div>
						</div>
						<div class="form_list">
							<h2 class="cont_tit tit3">선택한 매장정보</h2>
							<div>
								<table class="table">
									<caption>배달 매장 정보</caption>
									<colgroup>
										<col style="width:15%" />
										<col />
										<col style="width:15%" />
										<col style="width:15%" />
										<col style="width:15%" />
										<col style="width:15%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">매장명</th>
											<th scope="col">주소</th>
											<th scope="col">매장전화</th>
											<th scope="col">최소주문금액</th>
											<th scope="col">배달시간</th>
											<th scope="col">매장상태</th>
										</tr>
									</thead>
									<tbody id="storeInfo">
										
											<tr><td colspan="6">선택된 매장정보가 없습니다.</td></tr>
											
											
												
										
									</tbody>
								</table>
								<div class="mt30 hidden">
									<div class="button_area btn2">
										<a href="javascript:PageFunction.goNextOrderStep();" class="button btn_org h50 w200">다음</a>
										<a class="button btn_gray h50 w200 pop_open" href="#popZipcode">배송지추가</a>
									</div>
								</div>
							</div>
						</div>
					
				</div>


				<div class="form_list">
					<h2 class="cont_tit tit3">매장위치정보</h2>
					<div class="map_area">
						
		<div id="map"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=115b7b387bc25ada55206e93884ad731"></script>
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
				viewStore = function(x, y, title) {
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
					    position: new daum.maps.LatLng(y, x), // 마커의 좌표
					    image : markerImage, // 마커의 이미지
					    map: map, // 마커를 표시할 지도 객체
					    title: title
					});
					
					// 매장좌표로 지도 이동
					map.setCenter(new daum.maps.LatLng(y, x));
				}
				
				return {
					viewStore : viewStore
				}
			};
			var mapFunc = daumMap();
			
		</script>
	
					</div>
				</div>
			</div>
		</section>
		<!-- //contents -->
		
		<!-- 주소검색 팝업 -->
		<div id="popZipcode" class="pop_bg">
	<article class="pop_wrap">
		<!-- pop_head -->
		<header class="pop_head">			
			<h1>주소입력</h1>
		</header>
		<!-- //pop_head -->
		<!-- pop_cont -->
		<section class="pop_cont zipcode_cont">
			<div>
				<form id="zipcodeForm" name="zipcodeForm">
					<input type="hidden" name="addrTypeCd" />
					<input type="hidden" name="custSi" id="custSi" />
					<input type="hidden" name="custGu" />
					<input type="hidden" name="custDong" />
					<input type="hidden" name="custRi" />
					<input type="hidden" name="custGilDong" />
					<input type="hidden" name="custGilGil" />
					<input type="hidden" name="custAddrFull" />
					<input type="hidden" name="custDongGilDesc" />
					<input type="hidden" name="custDongBunji" />
					<input type="hidden" name="custGilBunji" />
					<input type="hidden" name="custBuilding" />
					<input type="hidden" name="custX" />
					<input type="hidden" name="custY" />
					<input type="hidden" name="convertAddr" />
					
					<p class="mb10">
						<input type="text" id="addrName" name="addrName" autocomplete="off" class="input w_100" placeholder="주소 이름" title="주소 이름" maxlength="50" />
					</p>
				
					<ul class="tabmenu ui-tabmenu zipcodeTab">
						<li><a href="#zipcode1">지번주소</a></li>
						<li><a href="#zipcode2">도로명주소</a></li>
					</ul>								
					
					<!-- 탭내용1 -->
					<div id="zipcode1" class="tab_cont">
						<p class="mb10">
							<input id="inputDong" type="text" autocomplete="off" class="input wid1 inputEnter" placeholder="동 입력" title="동 입력" />
							<button type="button" class="kainess_search_Btn button btn_gray" onclick="PopupFunction.searchAddress('01')">동 검색</button>
						</p>
						<div class="mb10">
							<input id="inputJibun" type="text" autocomplete="off" class="input wid2 inputEnter" placeholder="지번 또는 건물명 입력" title="지번 또는 건물명 입력" />
							<button type="button" class="button btn_gray" onclick="PopupFunction.searchAddress('02')">지번검색</button>
							<button type="button" class="button btn_gray" onclick="PopupFunction.searchAddress('03')">건물명검색</button>
						</div>
					</div>
					<!-- //탭내용1 -->
		
					<!-- 탭내용2 -->
					<div id="zipcode2" class="tab_cont">					
						<p class="mb10">
							<input id="inputRoadName" type="text" autocomplete="off" class="input wid1 inputEnter" placeholder="도로명 입력" title="도로명 입력" />
							<button type="button" class="button btn_gray" onclick="PopupFunction.searchAddress('04')">도로명검색</button>
						</p>
						<p class="mb10">
							<input id="inputRoadNum" type="text" autocomplete="off" class="input wid1 inputEnter" placeholder="건물번호 입력" title="건물번호 입력" />
							<button type="button" class="button btn_gray" onclick="PopupFunction.searchAddress('05')">건물번호검색</button>
						</p>
					</div>
					<!-- //탭내용2 -->
					
					<!-- 검색내용 -->
					<div class="mb10 zipcode_list">
						<ul id="zipcodeList">
							<!-- <li><a href="#">서울특별시 서대문구 창천동 (신촌동) <span class="t_red">[선택]</span></a></li> -->
						</ul>
					</div>
					<!-- //검색내용 -->
					<p class="mb10"><input type="text" id="custAddrDetail" name="custAddrDetail" autocomplete="off" class="input w_100" placeholder="상세주소 입력" title="동 호수 등 상세주소 입력" maxlength="50" /></p>
					<p class="button_area btn2 mt10">
						<a href="javascript:PopupFunction.addrConfirm();" class="button btn_org w120">확인</a>
						<a href="#" class="pop_close button w120btn_ gray ">취소</a>
					</p>
				</form>
			</div>
		</section>
		<!-- pop_foot -->
		<footer class="pop_foot">
			<a href="#" class="pop_close addr_pop_close">팝업 닫기</a>
		</footer>
	</article>
	
	<!-- 팝업 스크립트 -->
	<script type="text/javascript">
	//<![CDATA[
		//popup parameter
		var PopupParam = {
				page : 'member'
				,storeAble:"N"
			};
		
		//popup function
		var PopupFunction = (function(pf) {
			
			pf.init = function() {};
			
			//주소 검색 API 변수 설정
			pf.searchAddress = function(flag){
				
				//파라미터 초기화
				PopupParam.storeAble = 'N';
				
				//[지번주소] 동 검색
				if(flag == "01"){
					if($('#inputDong').val() == ''){
						alertTip('#inputDong','동을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getAddrSearch_Dong_Name2_db.do";
					PopupParam.name = $('#inputDong').val();
				}
				
				//[지번주소] 지번 검색
				else if(flag == "02"){
				
					if($('input[name=custSi]').val() == ''){
						alertTip('#inputDong','동을 입력해 검색해 주세요.');
						return;
					}
					
					if($('#inputJibun').val() == ''){
						alertTip('#inputJibun','지번 또는 건물명을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getAddrJibun3_db.do";
					PopupParam.bunji = $('#inputJibun').val();
				}
				
				//[지번주소] 건물명 검색
				else if(flag == "03"){
					
					if($('input[name=custSi]').val() == ''){
						alertTip('#inputDong','동을 입력해 검색해 주세요.');
						return;
					}
					
					if($('#inputJibun').val() == ''){
						alertTip('#inputJibun','지번 또는 건물명을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/poiSearch2.do";
					PopupParam.name = $('#inputJibun').val();
					PopupParam.listCount = "9999";
					PopupParam.pageNum = 0;
					PopupParam.dongcode = PopupParam.code;
					PopupParam.sido = $('input[name=custSi]').val();
					PopupParam.sigungu = $('input[name=custGu]').val();
					PopupParam.dong = $('input[name=custDong]').val();
				}
				
				//[도로명주소] 도로명 검색
				else if(flag == "04"){
					if($('#inputRoadName').val() == ''){
						alertTip('#inputRoadName','도로명을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getRoadname2_db.do";
					PopupParam.name = $('#inputRoadName').val();
				}
				
				//[도로명주소] 건물번호 검색
				else if(flag == "05"){
					
					if($('input[name=custSi]').val() == ''){
						alertTip('#inputRoadName','도로명을 입력해 검색해 주세요.');
						return;
					} 
					
					if($('#inputRoadNum').val() == ''){
						alertTip('#inputRoadNum','건물번호를 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getRoadaddrSearchList2_db.do";
					PopupParam.roadnum = $('#inputRoadNum').val();
				}
				
				//[도로명주소] -> [지번주소] 변환
				else if(flag == "06"){
					PopupParam.url = "/addr_ch_tr.do";
				}
				
				//주소 검색 API 호출
				this.callGisApi(flag);
			};
			
			//주소 검색 API 호출
			pf.callGisApi = function(flag){
				
				cntt.ajax.post(
					'/API/callGisApi',
					PopupParam,
					function (response) {
						
						var listTemp = '<li><a href="javascript:PopupFunction.{=SCRIPT}">{=TEXT}<span class="t_red">[선택]</span></a></li>';
						var listHtml = '';
						var script = '';
						var text = '';
						
						for(var i in response){
							var data = response[i];
							
							//[지번주소] 동 검색
							if(flag == "01"){
								script = "selectFirst('01','"+ data.code +"','"+ data.sido +"','"+ data.gugun +"','"+ data.dong +"','"+ data.ri +"','"+ data.fullname +"')";
								text = data.fullname;
							}
							
							//[도로명주소] 도로명 검색
							else if(flag == "04"){
								script = "selectFirst('04','"+ data.roadcode +"','"+ data.sido +"','"+ data.gugun +"','"+ data.dong +"','"+ data.roadname +"','"+ data.roadaddr +"')";
								text = data.roadaddr;
							}
							
							//[지번주소] 지번 검색
							else if(flag == "02"){
								text = data.bunji;
								
								if(data.san == "1" || data.san == "산")
									text = "산" + text;
								
								if(data.ho != "" && data.ho != "0")
									text += "-"+ data.ho;
								
								script = "selectSecond('02','"+ text +"','"+ data.cx +"','"+ data.cy +"')";
							}
							
							//[지번주소] 건물명 검색
							else if(flag == "03"){
								script = "selectSecond('03','"+ data.place_name +"','"+ data.point_x +"','"+ data.point_y +"')";
								text = data.place_name;
							}
							
							//[도로명주소] 건물번호 검색
							else if(flag == "05"){
								text = data.mn;
								
								if(data.under == "1")
									text = "지하" + text;
								else if(data.under == "2")
									text = "공중" + text;
								else if(data.under != "0")
									text = data.under + text;
								
								if(data.sn != "" && data.sn != "0")
									text += "-"+ data.sn;
								
								script = "selectSecond('05','"+ text +"','"+ data.point_x +"','"+ data.point_y +"')";
							}
							
							//[도로명주소] -> [지번주소] 변환
							else if(flag == "06"){
								$('input[name=convertAddr]').val(response[0].address);
							}
							
							listHtml += listTemp.replace(/{=SCRIPT}/g, script)
												.replace(/{=TEXT}/g, text);	
						}
						
						//검색 내용 리스트 표시
						$('#zipcodeList').html(listHtml);
					}
				);
			};
			
			//동,도로명 선택
			pf.selectFirst = function(flag, code, sido, gugun, dong, val1, val2){
				
				$('input[name=custSi]').val(sido);
				$('input[name=custGu]').val(gugun);
				$('input[name=custAddrFull]').val(val2);
				
				//동
				if(flag == "01"){
					$('input[name=custDong]').val(dong);
					$('input[name=custRi]').val(val1);
					$('input[name=addrTypeCd]').val('01');
					$('#inputDong').val(val2);
				}
				//도로명
				else if(flag == "04"){
					$('input[name=custDong]').val(val1);
					$('input[name=custGilDong]').val(dong);
					$('input[name=custGilGil]').val(val1);
					$('input[name=addrTypeCd]').val("02");
					$('#inputRoadName').val(val2);
				}
				$('#zipcodeList').html(null);
				
				//지번, 건물번호 검색 시 사용
				PopupParam.code = code;
			};
			
			//지번,건물명,도로번호 선택
			pf.selectSecond = function(flag, val1, x, y){
				
				//form value 설정(주소등록 시 사용)
				$('input[name=custX]').val(x);
				$('input[name=custY]').val(y);
				$('input[name=custDongGilDesc]').val(val1);
				
				//건물번호
				if(flag == "05"){
					$('input[name=custGilBunji]').val(val1);
					PopupParam.addr = $('input[name=custAddrFull]').val() + ' ' + val1; //주소 변환시 사용
					this.searchAddress("06"); //[도로명] -> [지번주소] 변환
					$('#inputRoadNum').val(val1);
				}
				//지번, 건물명
				else{
					$('input[name=custDongBunji]').val(val1);
					$('#inputJibun').val(val1);
				}
				$('#zipcodeList').html(null);
				
				//좌표로 배달가능매장 검색
				this.searchCoordStore(x, y);
			};
			
			//좌표로 배달가능매장 검색
			pf.searchCoordStore = function(x, y){
				cntt.ajax.post(
					'/order/searchCoordStore',
					{cx : x, cy : y},
					function (response) {
						
						if(response == null){
							$('#zipcodeList').html('<li class="t_red"><a>죄송합니다.<br/>검색하신 주소는 현재 배달 가능지역이 아닙니다.<br/>빠른 시일 내에 선택하신 주소에서도 버거킹 딜리버리<br/>서비스를 이용하실 수 있도록 노력하겠습니다.</a></li>');
						} else {
							PopupParam.storeAble = "Y";
							PopupParam.abranchName = response.abranchName;
							PopupParam.aphone = response.aphone;
							PopupParam.minOrderAmt = response.minOrderAmt;
							PopupParam.time = '주중 : '+response.aweekStarttime+'~'+response.aweekEndtime+'<br/>주말 : '+response.aendStarttime+'~'+response.aendEndtime;
							
							$('#zipcodeList').html('<li><a>배달 가능 매장이 검색 되었습니다.<br/>매장명은 '+ response.abranchName +' 입니다.</a></li>');
						}
					}
				);
			};
			
			//주소팝업 확인버튼
			pf.addrConfirm = function(){
				if(PopupParam.storeAble != "Y"){
					popAlert("등록 불가능한 배달주소입니다. 다시 검색해주시기 바랍니다.");
				} else {
					// 회원주소 등록
					if(PopupParam.page == 'member') {
						cntt.ajax.post(
							'/order/addDelivery',
							$('#zipcodeForm').serializeObject(),
							function (response) {
								// 등록 성공
								if(response) {
									popAlert('배달주소가 등록되었습니다.');
									$('.addr_pop_close').click(); //주소검색 팝업 닫기
									$('#deliveryList').getLoad('/order/memberOrder'); //배달주소영역 갱신
								}
							}
						);
					}
					// 비회원 배달가능 매장 표시
					else {
						
						if($('#custAddrDetail').val() == '' || $('#custAddrDetail').val().trim().length == 0) {
							popAlert("상세주소를 입력 해주세요.");
						} else {
							$('#nonMemberAddr').val($('input[name=custAddrFull]').val());
							$('#nonMemberAddrDetail').val($('#custAddrDetail').val());
							// --- 재기동 없이 반영하기 위한 임시 처리
							var custDongGilDesc = $('input[name=custDongGilDesc]');
							custDongGilDesc.val(custDongGilDesc.val() + ' ' + $('#custAddrDetail').val());	
							// ---
							$('#nonMemberDelivery').html('<tr>'
															+'<td class="t_center">'+ PopupParam.abranchName +'</td>'
															+'<td class="t_center">'+ PopupParam.aphone +'</td>'
															+'<td class="t_center">'+ PopupFunction.money(PopupParam.minOrderAmt) + '원' + '</td>'
															+'<td>'+ PopupParam.time +'</td>'
														+'</tr>');
							$('.addr_pop_close').click(); //주소검색 팝업 닫기
						}
					}
				}
			};
			
			//금액 콤마(,) 표시
			pf.money = function(money) {
				 return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			};
			
			return pf;
			
		}(window.pf || {}));
		
		$(function(){
			
			// Enter Key 입력시 검색버튼 클릭 
			$(".inputEnter").keyup(function(e){
				if(e.keyCode == 13)
					$(this).next().click();
			});
			
			//탭 클릭시 form 초기화
			$('.zipcodeTab').click(function(e){
				$("#zipcodeForm")[0].reset();
				
				$('input[name=custSi]').val("");
				$('input[name=custGu]').val("");
				$('input[name=custAddrFull]').val("");
				
				$('#zipcodeList').empty();
				
				PopupParam.storeAble = 'N';
			});
			
		});
		function comma(money) {
			return money.money();
		}
	//]]>
	</script>
</div>
		<!-- //주소검색 팝업 -->
		
		<script type="text/javascript">
		//<![CDATA[
			//page parameter
			var PageParam = {};
			
			//page function
			var PageFunction = (function(pf) {
				
				pf.init = function() {}
				
				//배달주소 선택 (좌표로 매장 검색)
				pf.selectDelivery = function(x, y, custSi) {
					
					if("" == custSi) {
						$('input[name=radio]').attr("checked", false);
						popAlert('시/구/동 주소가 등록되지 않았습니다. 삭제 후 배달지 주소를 다시 등록해 주세요.');
						return false;
					}
					
					$('#storeInfo').getLoad('/order/viewCoordStore?cx='+ x +'&cy='+ y); //인근 배달가능매장 정보 표시
				};
				
				//고객 배달주소 삭제
				pf.deleteDelivery = function(addrSeq) {
					if(confirm('배달주소를 삭제하시겠습니까?')){
						cntt.ajax.post(
							'/order/deleteDelivery',
							{
								addrSeq : addrSeq
							},
							function (response) {
								if(response){
									$('#deliveryList').getLoad('/order/memberOrder'); //배달주소영역 갱신
								}
							}
						);
					}
				};
				
				//다음 버튼
				pf.goNextOrderStep = function(){
					var addrSeq = $('input[name=radio]:checked').val();
					
					if(addrSeq === undefined){
						popAlert("배달주소를 선택해주세요.");
					} else {	
						//배달주소 정보 업데이트
						cntt.ajax.post(
							'/order/updateDeliveryInfo',
							{
								addrSeq : addrSeq
							},
							function (response) {
								if(response){
									location.href="/order/goNextOrderStep";
								}
							}
						);
					}
				};
				
				return pf;
				
			}(window.pf || {}));
		//]]>
		</script>

<script>
	$(function(){
		$("#container").addClass("full");
	});
</script>
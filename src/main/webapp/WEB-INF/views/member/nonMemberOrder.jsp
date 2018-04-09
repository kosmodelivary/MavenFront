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
		<li><a class="home" href="<c:url value='/'/>">HOME</a></li>
		<li><span>비회원 주문</span></li>
		<li><strong>매장 선택</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>비회원 주문</h1>
	</div>
	<div class="full_order">
		<div class="form_list first">
			<h2 class="cont_tit tit3">버거킹 이용약관</h2>
			<div>
				<textarea class="textarea" title="버거킹 이용약관" readonly="readonly">
1.	수집하는 개인정보 항목
	- 전화번호, 성명, 주소
2.	수집 목적 
	① 성명, 주소: 제품의 전달, 청구서, 정확한 제품 배송지의 확보.
3.	개인정보 보유기간 
	① 계약 또는 청약철회 등에 관한 기록 : 6개월
	② 대금결제 및 재화 등의 공급에 관한 기록 : 1년
	③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 1년
4.	비회원 주문 시 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않습니다. 기타 자세한 사항은 '개인정보처리방침'을 참고하여주시기 바랍니다.
				</textarea>
				<p class="mt10">
					<label class="checkbox"><input type="checkbox" id="nonMemberAgree"/><span class="lbl">개인정보동의, 개인정보 수집 및 이용에 모두 동의합니다.</span></label>
				</p>
			</div>
		</div>
		
		
		<div class="form_list">
			<h2 class="cont_tit tit3">
				<label for="address">주소입력</label>
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
		<div class="form_list">
			<h2 class="cont_tit tit3">배달매장</h2>
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
				<p class="button_area btn2 mt30">
					<a href="javascript:PageFunction.goNextOrderStep();" class="button h40 w200">다음</a>
					<a href="<c:url value='/'/>" class="button h40 w200 btn_gray">취소</a>
				</p>
			</div>
		</div>

</section>
<!-- //contents -->
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
                
                findshop(data.sigungu,1);
                
            }
        }).open();
    }
    function findshop(input,nowPage){
    	var sigungu = input;
    	
    	if(input.trim() == 0){
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
							recstr += "<td><label class='radio only'><input id='radio' name='radio' value='1' type='radio'/><span class='lbl'>선택</span></label></td></tr>";
						}
						else {
							recstr += "<tr><td colspan='6'>"+data.pagingstr+"</td></tr>";
						}
					});
				}
				else recstr = "<tr><td colspan='6'>선택된 매장정보가 없습니다.</td></tr>";
				$("#storeInfo").html(recstr);
			},
			error:function(request,status,error){
				alert("Error");
			}
		});
    }
</script>


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
					<input type="hidden" name="convertAddr"/>

					<p class="mb10"></p>

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
							<input id="inputJibun" type="text" autocomplete="off" class="input wid2 inputEnter" placeholder="지번 또는 건물명 입력" title="지번 또는 건물명 입력"/>
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
					<p class="mb10">
						<input type="text" id="custAddrDetail" name="custAddrDetail" autocomplete="off" class="input w_100" placeholder="상세주소 입력" title="동 호수 등 상세주소 입력" maxlength="50"/>
					</p>
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
			page : 'nonMember',
			storeAble : "N"
		};

		//popup function
		var PopupFunction = (function(pf) {

			pf.init = function() {
			};

			//주소 검색 API 변수 설정
			pf.searchAddress = function(flag) {

				//파라미터 초기화
				PopupParam.storeAble = 'N';

				//[지번주소] 동 검색
				if (flag == "01") {
					if ($('#inputDong').val() == '') {
						alertTip('#inputDong', '동을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getAddrSearch_Dong_Name2_db.do";
					PopupParam.name = $('#inputDong').val();
				}

				//[지번주소] 지번 검색
				else if (flag == "02") {

					if ($('input[name=custSi]').val() == '') {
						alertTip('#inputDong', '동을 입력해 검색해 주세요.');
						return;
					}

					if ($('#inputJibun').val() == '') {
						alertTip('#inputJibun', '지번 또는 건물명을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getAddrJibun3_db.do";
					PopupParam.bunji = $('#inputJibun').val();
				}

				//[지번주소] 건물명 검색
				else if (flag == "03") {

					if ($('input[name=custSi]').val() == '') {
						alertTip('#inputDong', '동을 입력해 검색해 주세요.');
						return;
					}

					if ($('#inputJibun').val() == '') {
						alertTip('#inputJibun', '지번 또는 건물명을 입력해 주세요.');
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
				else if (flag == "04") {
					if ($('#inputRoadName').val() == '') {
						alertTip('#inputRoadName', '도로명을 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getRoadname2_db.do";
					PopupParam.name = $('#inputRoadName').val();
				}

				//[도로명주소] 건물번호 검색
				else if (flag == "05") {

					if ($('input[name=custSi]').val() == '') {
						alertTip('#inputRoadName', '도로명을 입력해 검색해 주세요.');
						return;
					}

					if ($('#inputRoadNum').val() == '') {
						alertTip('#inputRoadNum', '건물번호를 입력해 주세요.');
						return;
					}
					PopupParam.url = "/getRoadaddrSearchList2_db.do";
					PopupParam.roadnum = $('#inputRoadNum').val();
				}

				//[도로명주소] -> [지번주소] 변환
				else if (flag == "06") {
					PopupParam.url = "/addr_ch_tr.do";
				}

				//주소 검색 API 호출
				this.callGisApi(flag);
			};

			//주소 검색 API 호출
			pf.callGisApi = function(flag) {

				cntt.ajax
						.post(
								'/API/callGisApi',
								PopupParam,
								function(response) {

									var listTemp = '<li><a href="javascript:PopupFunction.{=SCRIPT}">{=TEXT}<span class="t_red">[선택]</span></a></li>';
									var listHtml = '';
									var script = '';
									var text = '';

									for ( var i in response) {
										var data = response[i];

										//[지번주소] 동 검색
										if (flag == "01") {
											script = "selectFirst('01','"
													+ data.code + "','"
													+ data.sido + "','"
													+ data.gugun + "','"
													+ data.dong + "','"
													+ data.ri + "','"
													+ data.fullname + "')";
											text = data.fullname;
										}

										//[도로명주소] 도로명 검색
										else if (flag == "04") {
											script = "selectFirst('04','"
													+ data.roadcode + "','"
													+ data.sido + "','"
													+ data.gugun + "','"
													+ data.dong + "','"
													+ data.roadname + "','"
													+ data.roadaddr + "')";
											text = data.roadaddr;
										}

										//[지번주소] 지번 검색
										else if (flag == "02") {
											text = data.bunji;

											if (data.san == "1"
													|| data.san == "산")
												text = "산" + text;

											if (data.ho != "" && data.ho != "0")
												text += "-" + data.ho;

											script = "selectSecond('02','"
													+ text + "','" + data.cx
													+ "','" + data.cy + "')";
										}

										//[지번주소] 건물명 검색
										else if (flag == "03") {
											script = "selectSecond('03','"
													+ data.place_name + "','"
													+ data.point_x + "','"
													+ data.point_y + "')";
											text = data.place_name;
										}

										//[도로명주소] 건물번호 검색
										else if (flag == "05") {
											text = data.mn;

											if (data.under == "1")
												text = "지하" + text;
											else if (data.under == "2")
												text = "공중" + text;
											else if (data.under != "0")
												text = data.under + text;

											if (data.sn != "" && data.sn != "0")
												text += "-" + data.sn;

											script = "selectSecond('05','"
													+ text + "','"
													+ data.point_x + "','"
													+ data.point_y + "')";
										}

										//[도로명주소] -> [지번주소] 변환
										else if (flag == "06") {
											$('input[name=convertAddr]').val(
													response[0].address);
										}

										listHtml += listTemp.replace(
												/{=SCRIPT}/g, script).replace(
												/{=TEXT}/g, text);
									}

									//검색 내용 리스트 표시
									$('#zipcodeList').html(listHtml);
								});
			};

			//동,도로명 선택
			pf.selectFirst = function(flag, code, sido, gugun, dong, val1, val2) {

				$('input[name=custSi]').val(sido);
				$('input[name=custGu]').val(gugun);
				$('input[name=custAddrFull]').val(val2);

				//동
				if (flag == "01") {
					$('input[name=custDong]').val(dong);
					$('input[name=custRi]').val(val1);
					$('input[name=addrTypeCd]').val('01');
					$('#inputDong').val(val2);
				}
				//도로명
				else if (flag == "04") {
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
			pf.selectSecond = function(flag, val1, x, y) {

				//form value 설정(주소등록 시 사용)
				$('input[name=custX]').val(x);
				$('input[name=custY]').val(y);
				$('input[name=custDongGilDesc]').val(val1);

				//건물번호
				if (flag == "05") {
					$('input[name=custGilBunji]').val(val1);
					PopupParam.addr = $('input[name=custAddrFull]').val() + ' '
							+ val1; //주소 변환시 사용
					this.searchAddress("06"); //[도로명] -> [지번주소] 변환
					$('#inputRoadNum').val(val1);
				}
				//지번, 건물명
				else {
					$('input[name=custDongBunji]').val(val1);
					$('#inputJibun').val(val1);
				}
				$('#zipcodeList').html(null);

				//좌표로 배달가능매장 검색
				this.searchCoordStore(x, y);
			};

			//좌표로 배달가능매장 검색
			pf.searchCoordStore = function(x, y) {
				cntt.ajax
						.post(
								'/order/searchCoordStore',
								{
									cx : x,
									cy : y
								},
								function(response) {

									if (response == null) {
										$('#zipcodeList')
												.html(
														'<li class="t_red"><a>죄송합니다.<br/>검색하신 주소는 현재 배달 가능지역이 아닙니다.<br/>빠른 시일 내에 선택하신 주소에서도 버거킹 딜리버리<br/>서비스를 이용하실 수 있도록 노력하겠습니다.</a></li>');
									} else {
										PopupParam.storeAble = "Y";
										PopupParam.abranchName = response.abranchName;
										PopupParam.aphone = response.aphone;
										PopupParam.minOrderAmt = response.minOrderAmt;
										PopupParam.time = '주중 : '
												+ response.aweekStarttime + '~'
												+ response.aweekEndtime
												+ '<br/>주말 : '
												+ response.aendStarttime + '~'
												+ response.aendEndtime;

										$('#zipcodeList').html(
												'<li><a>배달 가능 매장이 검색 되었습니다.<br/>매장명은 '
														+ response.abranchName
														+ ' 입니다.</a></li>');
									}
								});
			};

			//주소팝업 확인버튼
			pf.addrConfirm = function() {
				if (PopupParam.storeAble != "Y") {
					popAlert("등록 불가능한 배달주소입니다. 다시 검색해주시기 바랍니다.");
				} else {
					// 회원주소 등록
					if (PopupParam.page == 'member') {
						cntt.ajax.post('/order/addDelivery', $('#zipcodeForm')
								.serializeObject(), function(response) {
							// 등록 성공
							if (response) {
								popAlert('배달주소가 등록되었습니다.');
								$('.addr_pop_close').click(); //주소검색 팝업 닫기
								$('#deliveryList')
										.getLoad('/order/memberOrder'); //배달주소영역 갱신
							}
						});
					}
					// 비회원 배달가능 매장 표시
					else {

						if ($('#custAddrDetail').val() == ''
								|| $('#custAddrDetail').val().trim().length == 0) {
							popAlert("상세주소를 입력 해주세요.");
						} else {
							$('#nonMemberAddr').val(
									$('input[name=custAddrFull]').val());
							$('#nonMemberAddrDetail').val(
									$('#custAddrDetail').val());
							// --- 재기동 없이 반영하기 위한 임시 처리
							var custDongGilDesc = $('input[name=custDongGilDesc]');
							custDongGilDesc.val(custDongGilDesc.val() + ' '
									+ $('#custAddrDetail').val());
							// ---
							$('#nonMemberDelivery')
									.html(
											'<tr>'
													+ '<td class="t_center">'
													+ PopupParam.abranchName
													+ '</td>'
													+ '<td class="t_center">'
													+ PopupParam.aphone
													+ '</td>'
													+ '<td class="t_center">'
													+ PopupFunction
															.money(PopupParam.minOrderAmt)
													+ '원' + '</td>' + '<td>'
													+ PopupParam.time + '</td>'
													+ '</tr>');
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

		$(function() {

			// Enter Key 입력시 검색버튼 클릭 
			$(".inputEnter").keyup(function(e) {
				if (e.keyCode == 13)
					$(this).next().click();
			});

			//탭 클릭시 form 초기화
			$('.zipcodeTab').click(function(e) {
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

	//나이스 윈도우 이름
	window.name = "Parent_window";

	//page parameter
	var PageParam = {};

	//page function
	var PageFunction = (function(pf) {

		pf.init = function() {
			
		}

		//다음 버튼
		pf.goNextOrderStep = function() {
			if (PopupParam.storeAble != 'Y') {
				popAlert("등록 불가능한 배달주소입니다. 다시 검색해주시기 바랍니다.");
			} else if (!$('#nonMemberAgree').is(':checked')) {
				popAlert("개인정보 이용 약관에 동의해주시기 바랍니다.");
			} else {
				//배달주소 정보 업데이트
				cntt.ajax.post('/order/updateDeliveryInfo', $('#zipcodeForm')
						.serializeObject(), function(response) {
					if (response) {
						location.href = "/order/goNextOrderStep";
					}
				});
			}
		};

		return pf;

	}(window.pf || {}));

	// 이벤트
	(function() {

		//로그인페이지 이동
		$('.moveLogin').click(function() {
			location.href = "/member/login";
		});

	}());

	//]]>
</script>
<script>
	$(function(){
		$("#container").addClass("full");
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- lnb -->
<aside id="lnb">

	<h1>
		<img src="<c:url value='/resources/images/common/tit_menu.png'/>"
			alt="MENU" />
	</h1>
	<!-- 분명 스크립트가 있는 부분, 나름대로 쿼리를 넘긴다던지.. 유효성 관련 코드가 있을 거 같다. -->
	<!-- 쿼리나 파라미터를 이용해서 한개의 페이지로 모든 카테고리 메뉴를 조절할 수 있을 거 같다. -->
	<nav>
		<ul>
			<li><a href="javascript:getList('All')">전체메뉴보기</a></li>
			<li><a href="javascript:getList('Set')">세트메뉴</a>
			<li><a href="javascript:getList('Hamburger')">버거</a>
			<li><a href="javascript:getList('Side')">사이드</a></li>
			<li><a href="javascript:getList('Drink')">드링크</a></li>
			
			<li><a href="https://www.burgerking.co.kr/nutrition"
				target="_blank">영양정보</a></li>
		</ul>
	</nav>
	<script type="text/javascript">
		var getList = function(flag){
			if(flag == 'All'){
				location.href="<c:url value='/menu/"+flag+".whpr'/>";
				return;
			}
			else if(flag == 'Set'){
				location.href="<c:url value='/menu/"+flag+".whpr'/>";
				return;
			}
			else if(flag == 'Hamburger'){
				location.href="<c:url value='/menu/"+flag+".whpr'/>";
				return;
			}
			else if(flag == 'Side'){
				location.href="<c:url value='/menu/"+flag+".whpr'/>";
				return;
			}
			else{
				location.href="<c:url value='/menu/"+flag+".whpr'/>";
			}
		};
	</script>
</aside>
<!-- //lnb -->

<!-- contents -->
<!-- 여기도 스크립트인가?? 위치에 따라 location 이 늘어나고 줄어드는..? -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
		<li><span>MENU</span></li>
		<li><strong>드링크</strong></li>
	</ul>
	<!-- 여기까지 궁금증이 드는 부분임. -->
	<div id="cont_tit">
		<h1>드링크 DRINK</h1>
	</div>

	<!-- 딜리버리 유의사항 보기 -->
	<section class="delibery_box" id="deliveryInfo">
		<div class="left">
			<p>
				<img src="<c:url value='/resources/images/common/callCenter.png'/>"
					alt="집에서 만나는 버거킹 1599-0505" />
			</p>
		</div>
		<div class="right">
			<div>
				<h2>딜리버리 유의사항</h2>
				<ul>
					<!-- 매장별 최소주문금액 오픈시 삭제 -->
					<!-- 
				<li>배달 주문 시 최소 금액 <strong class="t_blue">8,000원</strong>부터 적용됩니다.</li>
				 -->
					<!-- //매장별 최소주문금액 오픈시 삭제 -->
					<!-- 매장별 최소주문금액 주석 처리 - 오픈시 주석 해제 -->
					<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
					<li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
					<li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타 쿠폰을 사용하실 수
						없습니다.(일부품목 배달 제외)</li>
					<li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
					<li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
					<!-- <li>예약 주문은 현재 시간으로 부터 2시간 이후에 가능합니다.</li> -->
					<li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
					<li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- //딜리버리 유의사항 보기 -->
	<!--
					이미지 형식으로 title 뿌려준다.
				-->
	<div id="menuList">
		<ul class="menu_list">
			<c:if test="${empty menu}" var="result">
				<li>등록된 메뉴가 없습니당!</li>
			</c:if>
			<c:if test="${not result }">
				<c:forEach items="${menu }" var="items">
					<li>
						<!-- <a href="javascript:PageFunction.openDetailPopup(제품번호 컬럼 el태그)"> -->
						<a href="#">
							<!-- <figure><img src="이미지 주소 컬럼 el태그" alt="제품명 컬럼 el태그" /> -->
							<figure>
								<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${items.menu_name }${items.menu_file_extension}"
									alt="${items.menu_name }" />
								<figcaption>
									<!-- <span class="tit">제품명 컬럼 el태그</span> -->
									<span class="tit">${items.menu_name }</span>
									<!-- <strong>제품 가격 컬럼 el태그</strong> -->
									<strong>${items.menu_price }원</strong>
								</figcaption>
							</figure> <i></i>
					   </a>
						<div class="list_cont">
							<!-- <a class="btn_cart" href="javascript:PopupFunction.addProduct(제품번호 컬럼 el 태그,1)"><span>담기</span></a> -->
							<!-- <a class="btn_view" href="javascript:PageFunction.openDetailPopup(제품번호 컬럼 el 태그)"><span>상세보기</span></a> -->
							<a class="btn_cart"
								href="#"><span>담기</span></a>
							<a class="btn_view"
								href="#"><span>상세보기</span></a>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>

		<p class="product_more">
			<a class="btn_more" href="#">더보기</a>
		</p>
	</div>

	<!-- 자세히 보기 -->
	<div id="popMenuDetail" class="menu_view_wrap">

		<script type="text/javascript">
			//<![CDATA[
			//popup parameter
			var PopupParam = {};

			//popup function
			var PopupFunction = (function(pf) {

				pf.init = function() {
					PopupParam.freeToppingList = []
				};

				//가격 원단위 변환
				pf.convertWon = function(price) {
					return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
							",")
							+ '원';
				};

				//컨디먼트 추가
				pf.addCondiment = function(el) {
					var opt = $(el).find('option:selected');
					var price = opt.attr('data-price') * 1;
					var part = $(el).attr('title');
					var memo = $('.' + part + '_memo');
					var totPrice = $('.unit_price').attr('data-price') * 1;
					var qty = $('.opt_qty').text() * 1;

					if (opt.val() != "") {
						// 음료와 사이드는 있을 시 삭제 후 추가
						if ((part == "drink" || part == "side")
								&& memo.size() > 0) {
							this.deleteCondiment(memo.attr('data-cCode'), memo
									.attr('data-price'));
							totPrice -= memo.attr('data-price');
						}
						// 동일 재료 추가 불가
						else if (memo.andSelf().find(
								'[data-cCode=' + opt.val() + ']').size() > 0) {
							popAlert('같은 재료는 한번만 추가 가능합니다.');
							return;
						}

						var condimentTag = '<span class="'
								+ part
								+ '_memo" data-cCode="'
								+ opt.val()
								+ '" data-price='
								+ price
								+ '>'
								+ opt.text()
								+ '<a href="javascript:PopupFunction.deleteCondiment(\''
								+ opt.val() + '\',' + price
								+ ')" class="btn_delete"></a></span>';

						// 0원 재료 추가 시
						if (part == "topping" && price == 0) {
							PopupParam.freeToppingList.push(opt.val());

							// 0원 재료 2개이상일 시 올 엑스트라 추가
							if (PopupParam.freeToppingList.length >= 2
									&& $(".topping_memo[data-cCode=7111011]")
											.size() == 0
									&& $(".topping_memo[data-cCode=7111012]")
											.size() == 0) {
								if ($('select[title=topping]').find(
										'option[value=7111011]').length > 0) {
									condimentTag += '<span class="topping_memo" data-cCode="7111011" data-price="400">올엑스트라 400 (+400)</span>';
									totPrice += 400;
								} else if ($('select[title=topping]').find(
										'option[value=7111012]').length > 0) {
									condimentTag += '<span class="topping_memo" data-cCode="7111012" data-price="300">올엑스트라 300 (+300)</span>';
									totPrice += 300;
								}

								popAlert('0원 재료 중 2개이상 선택 시\n300~400원이 추가 됩니다.');
							}
						}

						$('.topping_options').append(condimentTag);
						$('.unit_price').attr('data-price', totPrice + price);
						$('.unit_price').text(
								this.convertWon((totPrice + price) * qty));
					}

					$(el).val("");
				};

				//컨디먼트 삭제
				pf.deleteCondiment = function(cCode, price) {
					var totPrice = $('.unit_price').attr('data-price') * 1;
					var qty = $('.opt_qty').text() * 1;
					price = price * 1;

					// 0원 재료 2개 미만일 때 엑스트라 삭제
					if (PopupParam.freeToppingList.indexOf(cCode) > -1) {
						PopupParam.freeToppingList.splice(
								PopupParam.freeToppingList.indexOf(cCode), 1);

						if (PopupParam.freeToppingList.length < 2) {
							if ($('.topping_memo[data-ccode=7111011]').length > 0) {
								$('.topping_options span[data-cCode=7111011]')
										.remove();
								totPrice -= 400;
							} else if ($('.topping_memo[data-ccode=7111012]').length > 0) {
								$('.topping_options span[data-cCode=7111012]')
										.remove();
								totPrice -= 300;
							}
						}
					}

					$('.topping_options span[data-ccode=' + cCode + ']')
							.remove();
					$('.unit_price').attr('data-price', totPrice - price * 1);
					$('.unit_price').text(
							this.convertWon((totPrice - price * 1) * qty));
				};

				//제품상세 수량조절
				pf.changeQty = function(flag) {
					var qty = $('.opt_qty').text() * 1;
					var price = $('.unit_price').attr('data-price') * 1;

					if (flag == 'P') { //Plus
						if (price * (qty + 1) > 150000) { //15만원 미만 주문가능
							popAlert("15만원 미만까지 주문 가능합니다.");
						} else {
							$('.opt_qty').text(qty + 1);
							$('.unit_price').text(
									this.convertWon(price * (qty + 1)));
						}
					} else { //Minus
						//최소 수량 1
						if (qty > 1) {
							$('.opt_qty').text(qty - 1);
							$('.unit_price').text(
									this.convertWon(price * (qty - 1)));
						}
					}
				};

				//제품 담기
				pf.addProduct = function(pCode, qty) {
					if (qty != 1) {
						qty = $('.opt_qty').text();
					}
					var condimentList = $('.topping_options').find('span');
					var cCode = [];

					if (condimentList.size() > 0) {
						for (var i = 0; i < condimentList.size(); i++) {
							cCode.push(condimentList.eq(i).attr('data-cCode'));
						}
						cCode = cCode.join(',');
					} else {
						cCode = null;
					}

					cntt.ajax.post('/cart/addProduct', {
						pCode : pCode,
						cCode : cCode,
						qty : qty
					}, function(response) {
						if (response) {
							popAlert("제품이 담겼습니다.");

							//TODO : 공통스크립트로 빼기??
							$('.menu_close').click(); //메뉴 상세 팝업 닫기
							condimentList.remove(); //컨디먼트 리스트 삭제
							$('html, body').animate({
								scrollTop : 0
							}, 500); //스크롤 상단 이동
							headerFunc.loadHeaderCart('Y'); //장바구니 갱신
						}
					});
				};

				//제품 담은 후 주문
				pf.goOrderProduct = function(pCode, qty) {
					if (qty != 1) {
						qty = $('.opt_qty').text();
					}
					var condimentList = $('.topping_options').find('span');
					var cCode = [];

					if (condimentList.size() > 0) {
						for (var i = 0; i < condimentList.size(); i++) {
							cCode.push(condimentList.eq(i).attr('data-cCode'));
						}
						cCode = cCode.join(',');
					} else {
						cCode = null;
					}

					cntt.ajax.post('/cart/addProduct', {
						pCode : pCode,
						cCode : cCode,
						qty : qty
					}, function(response) {
						if (response) {
							popAlert("제품이 담겼습니다.");
							location.href = "SpecialOffer.html";
						}
					});
				};

				return pf;

			}(window.pf || {}));
			//]]>
		</script>
	</div>
	<!-- //자세히 보기 -->

</section>
<!-- //contents -->

<script type="text/javascript">
	//<![CDATA[
	//TODO : 토핑추가 상세 로직 추가(엑스트라 등)

	//page parameter
	var PageParam = {};

	//page function
	//TODO : 상세 팝업 관련 스크립트, 팝업 소스 안으로 옮기기
	var PageFunction = (function(pf) {

		pf.init = function() {
		};

		//제품 상세보기 팝업
		pf.openDetailPopup = function(pCode) {
			$('#popMenuDetail').getLoad('/menu/getMenuDetail?pCode=' + pCode,
					function() {
						PopupFunction.init();
						menuOpen();
					});
		};

		//리스트 더보기 버튼
		pf.getMoreList = function(nextPage) {
			$('.btn_more').eq(0).parent('p').after(
					'<div id="menuList'+ nextPage +'"></div>');
			$('#menuList' + nextPage).getLoad(
					location.pathname + '?pageNum=' + nextPage);
			$('.btn_more').eq(0).parent('p').remove();
		};

		return pf;

	}(window.pf || {}));

	//퍼블추가:17-08-24
	$(window).load(
			function() {
				setTimeout(function() {
					var $active = $('#lnb > nav > ul > li.active');

					if ($active.length > 0) {
						var $ul = $active.children('ul'), $length = $ul
								.children('li').length;

						if ($length > 1) {
							$ul.clone().appendTo('.menu_sel > div');
							$('.menu_sel a').prepend('#')
						} else {
							$('.menu_sel').remove();
						}
					}
				}, 100)

			})
	//]]>
</script>
</html>
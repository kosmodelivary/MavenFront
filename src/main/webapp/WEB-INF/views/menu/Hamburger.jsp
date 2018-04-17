<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<li><strong>버거</strong></li>
	</ul>
	<!-- 여기까지 궁금증이 드는 부분임. -->
	<div id="cont_tit">
		<h1>버거 BURGER</h1>
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
									<strong><fmt:formatNumber
												pattern="###,###,###"
												value="${items.menu_price}" />원</strong>
								</figcaption>
							</figure> <i></i>
					   </a>
						<div class="list_cont">
							<!-- <a class="btn_cart" href="javascript:PopupFunction.addProduct(제품번호 컬럼 el 태그,1)"><span>담기</span></a> -->
							<!-- <a class="btn_view" href="javascript:PageFunction.openDetailPopup(제품번호 컬럼 el 태그)"><span>상세보기</span></a> -->
							<a class="btn_cart"
								href="#"><span><!-- 주문 진척용 테스트 -->주문<!-- 원래 담기 --></span></a>
							<a class="btn_view"
								href="javascript:menu_view(${items.menu_no })"><span>상세보기</span></a>
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
	</div>
	<script type="text/javascript">
    	function menu_view(menu_no){
    		$.ajax({
    			url:'<c:url value="/menu/getMenu.whpr"/>',
				type:'get',
				dataType:'json',
				data:{"menu_no":menu_no},
				success:function(data,target){
					successAjax(data,'#popMenuDetail');
				},
				error:function(request,error){
						console.log("code:"+request.status+"\n");
						console.log("서버로부터 받은 데이타"+request.responseText+"\n");
						console.log("error:"+error+"\n");								
					   }
    		});
	    	
	    };
	    function successAjax(data,target){
	    	console.log("data : "+data+", 데이터 타입 : "+typeof data);
	    	console.log("target의 display 상태 : "+$(target).css('display'));
			$.each(data, function(i, val) {
	    		$(target).html(getOne(val));
	    	})
	    	menuOpen();
	    }
	    
	    function getOne(val){
	    	var string = "";
	    	string += 
	    		'<article id="menuDetail" class="menu_view">'+
				'<div class="f_left">'+
					'<div class="img">'+
						"<img src='http://restapi.fs.ncloud.com/bkproject/image/menu/"+val.menu_name+""+val.menu_file_extension+"'"+
							"alt=\""+val.menu_name+"\" />"+
					"</div></div>"+
				"<div class=\"f_right\">"+
					"<h1>"+val.menu_name+"</h1>"+
						"<br /> <br /> 해당사항없음"+
					"<div class=\"hidden pb10\">"+
						"<span class=\"unit_price detail_product_text_price price\""+
							"data-price=\""+val.menu_price+"\">"+val.menu_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
									',')+"원</span>"+
						"<div class=\"opt_spinner_wrap\">"+
						"</div>"+
					"</div>"+
					"<p class=\"opt_txt topping_options\">"+

					"</p>"+
					"<div class=\"mt20\">"+
						"<table class=\"table2\">"+
							"<caption>제품 성분 리스트</caption>"+
							"<colgroup>"+
								"<col />"+
								"<col />"+
								"<col />"+
								"<col />"+
								"<col />"+
								"<col />"+
							"</colgroup>"+
							"<thead>"+
								"<tr>"+
									"<th scope=\"col\">중량(g)</th>"+
									"<th scope=\"col\">열량(kcal)</th>"+
									"<th scope=\"col\">단백질(g)</th>"+
									"<th scope=\"col\">나트륨(mg)</th>"+
									"<th scope=\"col\">당류(g)</th>"+
									"<th scope=\"col\">포화지방(g)</th>"+
								"</tr>"+
							"</thead>"+
							"<tbody>"+
								"<tr>"+
									"<td>"+val.menu_weight+"</td>"+
									"<td>"+val.menu_calrorie+"</td>"+
									"<td>"+val.menu_protein+"</td>"+
									"<td>"+val.menu_sodium+"</td>"+
									"<td>"+val.menu_sugars+"</td>"+
									"<td>"+val.menu_fat+"</td>"+
								"</tr>"+
							"</tbody>"+
						"</table>"+
					"</div>"+
					"<p class=\"t_right bold mt10\">"+
						"<a href=\"https://www.burgerking.co.kr/nutrition\" target=\"_blank\""+
							"title=\"새창열림\"><span>알러지 유발성분 확인</span></a>"+
					"</p>"+
				"</div>"+
				"<a href=\"javascript:menu_close()\" class=\"btn_close menu_close\">닫기</a>"+
				'</article>';
				return string;
	    }
	</script>
	<!-- //자세히 보기 -->

</section>
<!-- //contents -->

</html>
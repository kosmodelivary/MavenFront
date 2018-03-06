<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<!-- lnb -->
	<aside id="lnb">
		<h1><img src="../resources/images/common/tit_faq.png" alt="버거킹 회원" /></h1>
		<nav>
			<ul>
				<li><a href="<c:url value='/customer/faqList.whpr'/>">FAQ</a></li>
				<li><a href="<c:url value='/customer/noticeList.whpr'/>">공지사항</a></li>
			</ul>
		</nav>
	</aside>
	<!-- //lnb -->

	<!-- contents -->
	<section id="contents">
		<ul id="location">
			<li><a class="home" href="../index.jsp">HOME</a></li>
			<li><span>FAQ</span></li>
			<li><strong>FAQ</strong></li>
		</ul>

		<div id="cont_tit">
			<h1>FAQ</h1>
		</div>

		<ul class="tabmenu ui-tabmenu six_tab">
			<li><a href="#tabCon1">제품/구매</a></li>
			<li><a href="#tabCon2">기타</a></li>
		</ul>
		<div id="tabCon1" class="tab_cont">
			<dl class="qna_list qna_motion">
				<dt>
					<strong>Q</strong> <a href="#">주문을 변경,취소하고 싶은데 가능하나요?</a>
				</dt>
				<dd>
					<div>완료된 주문의 취소, 변경을 원하시는 경우 1599-0505로 연락 후 가능 여부를 확인받으실 수 있습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">배달 시간이 얼마나 걸리나요?</a>
				</dt>
				<dd>
					<div>버거킹 딜리버리 서비스의 배달 시간은 기상조건이나 주문량 및 매장 상황에 따라 소요 시간이 다르며, 고객님의 주문 시에 배달 가능한 예상 시간을 미리 안내드리고 있습니다. 안내 드린 시간 내 음식을 제공할 수 있도록 노력하겠습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>			
			
				<dt>
					<strong>Q</strong> <a href="#">배달 가능한 시간은 어떻게 되는지요?</a>
				</dt>
				<dd>
					<div>전매장이 동일하게 오전 10시에서 오후 10시까지 딜리버리 서비스를 제공하고 있습니다. 매장 상황에 따라 배달이 어려운 경우 주문시 안내를 드리고 있으며, 기상 악화시에는 배달 라이더들의 안전을 위해 배달이 중단, 제한, 지연 될 수 있습니다. </div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">가격은 어떻게 확인이 가능한가요?</a>
				</dt>
				<dd>
					<div>제품 주문 시에 가격을 확인할 수 있으며, 버거킹 가격 정책에 따라 매장 가격과 배달 시 가격은 다르게 책정되어 있습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">주문 가능한 최소 금액이 있나요?</a>
				</dt>
				<dd>
					<div>예, 버거킹 딜리버리 서비스는 최소 주문 금액제도에 따라. 8,000원 이상 주문 시에 서비스를 받으실 수 있습니다. 단, 최소 주문 금액은 지역별, 매장별로 상이 할 수 있습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">매장에서 판매하는 모든 메뉴를 배달하나요?</a>
				</dt>
				<dd>
					<div>배달이 어려운 일부 디저트 메뉴를 제외하고, 버거킹 매장에서 판매하고 있는 대부분의 제품을 배달해 드리고 있습니다. 메뉴 창에서 주문이 가능한 제품을 확인하실 수 있습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			</dl>
		</div>
		
		<div id="tabCon2" class="tab_cont">
			<dl class="qna_list qna_motion">
				<dt>
					<strong>Q</strong> <a href="#">다른 할인 적용 카드가 있나요?</a>
				</dt>
				<dd>
					<div>현재, 버거킹 딜리버리 서비스에는 별도로 적용되는 타사 할인 카드는 없습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>	
			
				<dt>
					<strong>Q</strong> <a href="#">현금영수증 발행이 가능하나요?</a>
				</dt>
				<dd>
					<div>결제시 현금영수증을 선택하여 발행 여부를 선택하실 수 있습니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>			
			
				<dt>
					<strong>Q</strong> <a href="#">주문을 미리 예약하고 싶은데요?</a>
				</dt>
				<dd>
					<div>예약 주문은 현재 시간으로 부터 2시간 이후에 가능합니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">대량주문에 대한 제한이 있는지요?</a>
				</dt>
				<dd>
					<div>대량주문의 경우 매장 상황을 파악한 후 버거킹 딜리버리 콜센터에서 확인전화를 드리며 확인 전화가 완료되어야 주문이 접수됩니다. 원재료 및 제품의 생산시간을 고려하여 가능 여부를 안내해드립니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				<dt>
					<strong>Q</strong> <a href="#">쿠폰 사용을 할 수 있는지요?</a>
				</dt>
				<dd>
					<div>현재,  버거킹 딜리버리 서비스에는 별도로 적용되는 타사 할인 카드는 없습니다. 버거킹 와퍼카드에 한하여 적립이 가능합니다.</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			</dl>
		</div>
	</section>
	</div>	
</html>
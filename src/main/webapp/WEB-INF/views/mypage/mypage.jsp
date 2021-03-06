<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/mypage/isMember.jsp" %>
<!DOCTYPE html>
<!-- lnb -->
<aside id="lnb">
	<h1>
		<img src="<c:url value='/resources/images/common/tit_mypage.png'/>" alt="마이페이지" />
	</h1>
	<nav>
		<ul>
			<li><a href="<c:url value='/mypage/memberUpdate.whpr'/>">내 정보수정</a></li>
			<li><a href="<c:url value='/mypage/mypage.whpr'/>">내 주문내역</a></li>
			<li><a href="<c:url value='/mypage/passwordUpdate.whpr'/>">비밀번호 변경</a></li>
			<li><a href="<c:url value='/mypage/memberWithdraw.whpr'/>">회원탈퇴</a></li>
		</ul>
	</nav>
</aside>
<!-- //lnb -->
<!-- contents -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="<c:url value='/'/>">HOME</a></li>
		<li><span>마이페이지</span></li>
		<li><strong>내 주문내역</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>내 주문내역</h1>
	</div>
	<h2 class="cont_tit tit3">
		<span class="t_blue">${dto.member_name }</span>님께서 주문한 내역입니다. (최근 6개월까지 내역이 저장됩니다.)
	</h2>
	<div id="myOrderList">
		<table class="table order_list">
			<caption>주문내역 주문번호, 주문상품, 결제금액, 주문매장, 재주문등 확인</caption>
			<colgroup>
				<col style="width: 15%" />
				<col style="width: 13%" />
				<col />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 13%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문일</th>
					<th scope="col">주문번호</th>
					<th scope="col">상품(개수)</th>
					<th scope="col">금액(방법)</th>
					<th scope="col">배달매장<br />매장전화</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody id="order_detail">
				<c:if test="${empty orderComplete }" var="flag"><!--  empty storeInfo -->
					<tr>
						<td colspan="7">내 주문내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not flag }">
					<c:forEach items="${orderComplete }" var="item" varStatus="loop">
						<fmt:parseDate pattern="yyyyMMddHHmm" var="fmt_date" value="${fn:substring(item.order_no,0,12) }"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="order_date" value="${fmt_date }"/>
							<tr>
								<td><!-- 주문일 -->
									${order_date }
								</td>
								<td><!-- 주문번호 칼럼(연월일 시분초 미리초(1/1000초)) 형식으로 들어감
										  payment.jsp페이지에서 모든 메뉴에 일괄적용되기 때문에 미리초단위로 달라지지 않음. 
										  -->
									<span class="t_blue"><a href="javascript:orderDetail('${item.order_no}','${order_date }');">${item.order_no }</a></span>
								</td>
								<td><!-- 메뉴명 -->
									${item.menu_name }
								</td>
								<td><!-- 주문 총액 -->
									<fmt:formatNumber pattern="###,###,###" value="${item.order_price }"/>원
								</td>
								<td>
									<ul><!-- 매장명, 매장전화 -->
										<li>${item.store_name }</li>
										<li>${item.store_tel }</li>
									</ul>
								</td>
								<td><!-- 상태 -->
									<span class="t_red">${item.status }</span>
								</td>
							</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<!-- paging -->
	</div>
</section>
<!-- //contents -->
<script type="text/javascript">
	// 주문번호 클릭했을 때 실행되는 함수들
	function orderDetail(order_no,order_date){
		console.log('order_no : '+order_no+', order_date : '+order_date);
		sessionStorage.setItem('order_no', order_no);
		sessionStorage.setItem('order_date', order_date);
		location.href="<c:url value='/mypage/orderDetail.whpr?order_no="+order_no+"&order_date="+order_date+"'/>";
	};
</script>
<!-- <script type="text/javascript">
	// page parameter
	var PageParam = {};
	// page function
	var PageFunction = (function(pf) {
		// document ready
		pf.init = function() {
		};
		// 페이징
		pf.getListPaging = function(pageNum) {
			var param = [];
			param.push("pageNum=" + pageNum);
			//<![CDATA[
			$('#myOrderList').getLoad('/mypage/orderList?' + param.join("&"));
			//]]>
		};
		// 주문 상세
		pf.orderDetail = function() {
			var aOrderId = this.target.dataset.id;
			var teme = this.target.dataset.mode;
			var param = {
				aOrderId : aOrderId,
				teme : teme
			};
			//<![CDATA[
			cntt.goPagePost("/mypage/orderDetail", param);
			//]]>
		};
		// 재 주문
		pf.reOrder = function(orderId) {
			cntt.ajax.get('/order/reOrder?orderId=' + orderId, function(
					response) {
				if (response) {
					location.href = "/cart/cartList";
				}
			})
		};
		return pf;
	}(window.pf || {}));
	// 이벤트
	(function() {
		// 이벤트 bind
		$('#myOrderList').on('click', function() {
			var targetId = event.target.id;
			if (targetId === "orderDetail") {
				PageFunction.orderDetail.call(event);
			} else if (targetId === "reOrder") {
				PageFunction.reOrder.call(event);
			}
		});
	}());
</script> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/mypage/isMember.jsp" %>
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
	<hr/>
		주문번호 <span class="t_red">${param.order_no }</span>로 ${param.order_date } 에 주문한 내역입니다.
	<hr/>
	<div id="myOrderList">
		<table class="table order_list">
			<caption>주문내역 상세보기</caption>
			<colgroup>
				<col style="width: 30%" />
				<col style="width: 15%" />
				<col style="width: 20%" />
				<col style="width: 20%" />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">상품명</th>
					<th scope="col">수량</th>
					<th scope="col">가격</th>
					<th scope="col">옵션</th>
					<th scope="col">금액</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty orderInfo }" var="order_result">
					<tr>
						<td colspan="5">내 주문내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not order_result }">
					<c:forEach items="${orderInfo }" var="item">
						<fmt:parseDate pattern="yyyyMMddHHmm" var="fmt_date" value="${fn:substring(item.order_no,0,12) }"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="order_date" value="${fmt_date }"/>
						<c:set var="order_memo" value="${item.order_memo }"/>
						<c:set var="order_addr" value="${item.order_addr }"/>
						<c:if test="${loop.count >= 1}">
							<c:set var="order_price" value="${order_price + item.total_price }"/>
						</c:if>
						<tr>
							<td>${item.menu_name }</td>
							<td>${item.amount }</td>
							<td>${item.menu_price }원</td>
							<td>옵션</td>
							<td class="t_right"><strong><span class="t_red f14">${item.total_price }원</span></strong></td>
						</tr>
					</c:forEach>
					<tr>
						<td class="t_left"><h2 class="bold">총 상품금액</h2></td>
						<td class="t_right" colspan="4"><h2><span class="t_red">${sumMoney }</span></h2></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<br/>
		<br/>
		<div class="cont_tit tit2">
			<h3>배달 주문자 정보</h3>
		</div>
		<table class="table order_person">
			<colgroup>
				<col />
				<col  />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문자</th>
					<th scope="col">연락처</th>
					<th scope="col">메모</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${memberInfo.member_name }</td>
					<td>${memberInfo.member_tel }</td>
					<td>${order_memo }</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<div class="cont_tit tit2">
			<h3>배달 주소지 정보</h3>
		</div>
		<table class="table">
			<tr>
				<td><span class="f19">${order_addr }</span></td>
			</tr>
		</table>
		<br/>
		<br/>
		<div class="cont_tit tit2">
			<h3>배달 매장 정보</h3>
		</div>
		<table class="table left_tbl">
			<tbody>
			<tr>
				<th scope="col">매장명</th>
				<td>${storeInfo.name }</td>
				<th scope="col">주소</th>
				<td>${storeInfo.addr }</td>
			</tr>
			<tr>
				<th scope="col">매장전화</th>
				<td>${storeInfo.tel }</td>
				<th scope="col">배달시간</th>
				<td>
					주중 : ${storeInfo.weekdayon } : 00 ~ ${storeInfo.weekdayoff } : 00<br/>
					주말 : ${storeInfo.weekendon } : 00 ~ ${storeInfo.weekendoff } : 00
				</td>
			</tr>
			</tbody>
		</table>
		
		<!-- paging -->
	</div>
</section>
<!-- //contents -->

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
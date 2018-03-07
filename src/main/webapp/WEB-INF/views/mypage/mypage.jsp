<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!--[if lt IE 8]> <html class="lt-ie10 lt-ie9 lt-ie8" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie10 lt-ie9" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 9]>    <html class="lt-ie10" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if gt IE 9]><!-->
<html lang="ko">
<!--<![endif]-->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta charset="utf-8" />
<title>버거킹 딜리버리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="keywords" content="버거킹 딜리버리" />
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/resources/images/favicon.ico'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/common.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/contents.css'/>" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/resources/css/ie.css" />
	<![endif]-->

<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-1.12.4.min-4f252523d4af0b478c810c2547a63e19.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-migrate-1.4.1.min-7121994eec5320fbe6586463bf9651c2.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-ui-1.11.4.min-d935d506ae9c8dd9e0f96706fbb91f65.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/modernizr-2.8.3.min-65f1d21d5fcc9d21da758adababd0c3c.js'/>"></script>
<!--[if lt IE 9]>
		<script src="/resources/js/lib/html5shiv-3.7.3.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="<c:url value='/resources/js/plugins-fc3d87aa7fbbb2aaf27be96df8e2bf72.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/ui_script-9cf17ca67bee4a6db48a6ab65194e497.js'/>"></script>
<script src="<c:url value='/resources/js/cntt-0f738f0aa2f2d3caa2e57a76a8bfc873.js'/>"></script>

<!-- 사용자 스크립트 영역 -->

</head>

<body>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/" />
		<!-- //header -->
		<!-- main -->
		<div id="container">
			<!-- lnb -->
			<aside id="lnb">
				<h1>
					<img src="/resources/images/common/tit_mypage.png" alt="마이페이지" />
				</h1>
				<nav>
					<ul>
						<li><a href="/mypage/memberUpdate">내 정보수정</a></li>
						<li><a href="/mypage">내 주문내역</a></li>
						<li><a href="/mypage/passwordUpdate">비밀번호 변경</a></li>
						<li><a href="/mypage/memberWithdraw">회원탈퇴</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/index.jsp">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>내 주문내역</strong></li>
				</ul>

				<div id="cont_tit">
					<h1>내 주문내역</h1>
				</div>
				<h2 class="cont_tit tit3">
					<span class="t_blue">남기웅</span>님께서 주문한 내역입니다. (최근 6개월까지 내역이 저장됩니다.)
				</h2>
				<div id="myOrderList">
					<table class="table order_list">
						<caption>주문내역 - 주문일자, 주문번호, 주문상품, 결제금액, 주문매장, 재주문등 확인</caption>
						<colgroup>
							<col style="width: 15%" />
							<col style="width: 13%" />
							<col />
							<col style="width: 15%" />
							<col style="width: 15%" />
							<col style="width: 13%" />
							<!-- 
						<col style="width:13%" />
						 -->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문일</th>
								<th scope="col">주문번호</th>
								<th scope="col">상품(개수)</th>
								<th scope="col">금액(방법)</th>
								<th scope="col">배달매장<br />매장전화
								</th>
								<th scope="col">상태</th>
								<!-- 
							<th scope="col">재주문</th>
							 -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="7">내 주문내역이 없습니다.</td>
							</tr>

						</tbody>
					</table>
					<!-- paging -->

				</div>
			</section>
			<!-- //contents -->

			<script type="text/javascript">
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
						$('#myOrderList').getLoad(
								'/mypage/orderList?' + param.join("&"));
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
						cntt.ajax.get('/order/reOrder?orderId=' + orderId,
								function(response) {
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
			</script>
		</div>
		<!-- //contents -->
		<!-- //main -->
		<!-- footer -->
		<jsp:include page="/" />
		<!-- //footer -->
	</div>
</body>
</html>
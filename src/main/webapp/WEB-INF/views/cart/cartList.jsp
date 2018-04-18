<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/mypage/isMember.jsp" %>
<!DOCTYPE html>
<script>
	$(function() {
		$("#container").addClass("full");
	});

	$(function() {
		//선택상품삭제 버튼
		$('#cartInfo').on('click', '.btn_delete', function(e) {
			e.preventDefault();
			$('.delete_box').show(500)
		});
		$('#cartInfo').on('click', '.delete_cancle', function(e) {
			e.preventDefault();
			$('.delete_box').hide(500)
		});

		//상품전체선택
		$('#cartInfo').on(
				'click',
				'#checkAll',
				function() {
					$('input[name=cartItemCheck]').attr('checked',
							$(this).is(':checked'))
				});
	});
	
	var validate = function(){
		if($('#form').serialize().length == 0){
			popAlert('제품이 담겨있지 않습니다.<br/>3초후 메뉴화면으로 이동합니다.');
			window.setTimeout(function() {
				location.href="<c:url value='/menu/All.whpr'/>"
			}, 3000);
		}
		else {
			$('#form').attr('action','<c:url value="/cart/cartUpdateAndPayment.whpr"/>');
			$('#form').submit();
		}
	};
</script>
<!-- contents -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
		<li><strong>장바구니</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>장바구니</h1>
	</div>
	<div class="order_tit">
		<h2>장바구니</h2>
		<p>
			<img src="<c:url value='/resources/images/order/order_step1.gif'/>"
				alt="01장바구니(현재위치), 02주문/결제, 03주문완료" />
		</p>
	</div>
	<ul class="comment_list mt25">
		<li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해 주세요.</li>
		<!-- 매장별 최소주문금액 오픈시 삭제 -->
		<!-- <li>버거킹 최소 배달 금액은 <strong class="t_blue">8,000원</strong> 입니다.</li>-->
		<!-- //매장별 최소주문금액 오픈시 삭제 -->
		<!-- 매장별 최소주문금액 주석 처리 -->
		<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
	</ul>
	<div id="cartInfo">
		<form name="form" id="form" method="post" action="javascript:validate();">
			<table class="table cart_tbl">
				<caption>장바구니 리스트 - 상품명, 수량, 상품가격, 총 상품금액을 확인</caption>

				<thead>
					<tr>
						<th scope="col">
							<label class="checkbox only"> 
								<input id="checkAll" type="checkbox" 
									checked="checked" class="tooltip" title="상품 전체 선택" />
								<span class="lbl"></span>
							</label>
						</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">상품가격</th>
						<th scope="col"><span class="blind">삭제</span></th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<c:when test="${map.count == 0}">
							<td colspan="5">장바구니가 비어있습니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach var="items" items="${map.list}" varStatus="i">
								<tr>
									<td class="chk_td">
										<label class="checkbox only"> 
											<input name="cartItemCheck" type="checkbox" checked="checked"
													title="상품 선택" value="1" /> 
											<span class="lbl">선택</span>
										</label>
									</td>
									<td class="tit_td t_left">
										<div class="prd_tbl">
											<div class="img_box">
												<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/${items.menu_name }.png"
													alt="${items.menu_name}" />
												<input type="hidden" name="menu_no" value="${items.menu_no}">
											</div>
											<div>
												<strong class="tit">${items.menu_name}</strong>
												<ul class="addOpt">

												</ul>
											</div>
										</div>
									</td>
									<td class="spin_td">
										<div class="opt_spinner">
											<span class="opt_area">
												<span class="opt_txt">${items.amount }</span>
												<input type="hidden" name="amount" value="${items.amount}">
												<!-- <input type="hidden" name="amount" value="">  -->
												<input type="hidden" name="menu_price" value="${items.menu_price}"> 
											</span>
												<a href="javascript:void(0);" class="btn_opt opt_plus">더하기</a>
												<a href="javascript:void(0);" class="btn_opt opt_minus">빼기</a>
										</div>
									</td>
									<td class="price_td">
										<span class="txt_price" name="sum">
											<fmt:formatNumber pattern="###,###,###" value="${items.menu_price*items.amount}" />원</span></td>
									<td class="btn_td">
										<a class="button btn_white h25 w60" href="<c:url value='#'/>">주문</a>
										<a class="button btn_gray2 h25 w60" href="<c:url value='/cart/cartDelete.whpr?cart_no=${items.cart_no}'/>">삭제</a>
										<input type="hidden" name="cart_no" value="${items.cart_no }"/>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="price_info">
							<strong>배달매장</strong> <span></span>
							<strong>배달예상시간</strong> <span></span>
							<p class=" f_right all_price">
								<span class="bold">총 상품금액</span> 
								<strong class="price_all">
								<fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}" />원</strong>
							</p>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="mt20 t_left">
				<a href="javascript:PageFunction.selectOrder('')" class="button btn_gray">선택상품주문</a> 
				<span class="delete_box_wrap">
					<a href="#" class="button btn_gray btn_delete">선택상품삭제</a> 
					<span class="layer_box delete_box"> 
						<span>선택상품을 삭제하시겠습니까? 
							<a href="javascript:PageFunction.deleteProduct('')">삭제</a> 
							<a href="#" class="delete_cancle">취소</a>
						</span>
						<i></i>
					</span>
				</span>
			</div>
			<p class="button_area btn2 mt50">
				<button type="submit" id="btnUpdate" class="button btn_org h50 w200">다음</button>
				<a href="<c:url value='/menu/All.whpr' />" class="button btn_gray h50 w200">계속쇼핑하기</a>
			</p>
		</form>
	</div>
</section>
	<script type="text/javascript">
		var plus = document.getElementsByClassName('opt_plus');
		for(var i=0; i<plus.length; i++){
			(function(){
			 	plus[i].index=i;
			    plus[i].onclick = function(){
				 	var amount = document.getElementsByClassName('opt_txt')[this.index].innerHTML;
				 	var price = parseInt(document.getElementsByName('sum')[this.index].innerHTML.replace(",", "")) / amount;
	
				 	amount = parseInt(amount) + 1;
				 	var sum = price * amount;
				 	document.getElementsByClassName('opt_txt')[this.index].innerHTML = amount;
				 	document.getElementsByName('sum')[this.index].innerHTML = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	
				 	document.getElementsByName('amount')[this.index].value = amount;
					
				 	calculate(plus.length);
				}
			})();
		}
		var minus = document.getElementsByClassName('opt_minus');
		for(var i=0; i<minus.length; i++){
			(function(){
				minus[i].index=i;
				minus[i].onclick = function(){
				 	var amount = document.getElementsByClassName('opt_txt')[this.index].innerHTML;
				 	var price = parseInt(document.getElementsByName('sum')[this.index].innerHTML.replace(",", "")) / amount;
	
				 	amount = parseInt(amount) > 1 ? parseInt(amount) - 1 : parseInt(amount);
				 	var sum = price * amount;
				 	document.getElementsByClassName('opt_txt')[this.index].innerHTML = amount;
				 	document.getElementsByName('sum')[this.index].innerHTML = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	
				 	document.getElementsByName('amount')[this.index].value = amount;

				 	calculate(minus.length);
				}
			})();
		}
	
		var calculate = function(length) {
			var total = 0;
			for (var i = 0; i < length; i++) {
				var amount = document.getElementsByClassName('opt_txt')[i].innerHTML;
				var price = parseInt(document.getElementsByName('sum')[i].innerHTML.replace(",", "")) / amount;
	
				total += (price * amount);
			}
			document.getElementsByClassName('price_all')[0].innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		};
	</script>
	<script type="text/javascript">
		function keepshop(){
			var menu_no    = "", 
				menu_name  = $('.tit').html()+"&", 
				amount	   = "", 
				menu_price = $('input[type="hidden"][name="menu_price"]').val(), 
				cart_no	   = "";
			menu_no += $('input[type="hidden"][name="menu_no"]').val()+"&";
			amount  += $('input[type="hidden"][name="amount"]').val()+"&";
			cart_no += $('input[type="hidden"][name="cart_no"]').val()+"&";
			location.href="<c:url value='/cart/keepShopping.whpr?menu_no="+menu_no+"menu_name="+menu_name+"amount="+amount+"cart_no="+cart_no"'/>";
		};
	</script>
<!-- //contents -->
<%--  <c:choose>
		<c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
        </c:when>
		<c:otherwise>
			<form name="form1" id="form1" method="post"
				action="${path}/shop/cart/update.do">
				<table border="1">
					<tr>
						<th>상품명</th>
						<th>단가</th>
						<th>수량</th>
						<th>금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="items" items="${map.list}" varStatus="i">
						<tr>
							<td>${items.menu_name}</td>
							<td style="width: 80px" align="right"><fmt:formatNumber
									pattern="###,###,###" value="${items.menu_price}" /></td>
							<td><input type="number" style="width: 40px" name="amount"
								value="${items.amount}" min="1"> <input type="hidden"
								name="menuNo" value="${items.menu_no}"></td>
							<td style="width: 100px" align="right"><fmt:formatNumber
									pattern="###,###,###" value="${items.menu_price*items.amount}" />
							</td>
							<td><a
								href="<c:url value='/cart/cartDelete.whpr?cart_no=${items.cart_no}'/>">삭제</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">장바구니 금액 합계 : <fmt:formatNumber
								pattern="###,###,###" value="${map.sumMoney}" /><br> 배송료 :
							${map.fee}<br> 전체 주문금액 :<fmt:formatNumber
								pattern="###,###,###" value="${map.allSum}" />
						</td>
					</tr>
				</table>
				<input type="hidden" name="count" value="${map.count}">
				<button type="submit" id="btnUpdate">다음</button>
			</form>
		</c:otherwise>
	</c:choose>
	<button type="button" id="btnList">쇼핑계속하기</button>  --%>

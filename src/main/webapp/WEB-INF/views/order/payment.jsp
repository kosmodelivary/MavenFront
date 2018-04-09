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
	<form name="orderForm" id="orderForm">
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
					<tr>
						<td class="t_left"><strong class="f14">${items.menu_name}</strong></td>
						<td>${items.amount}</td>
						<td class="t_right">${items.menu_price*items.amount}</td>
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
							maxlength="10" class="input" placeholder="이름 직접입력" title="이름 입력" />
					</div>
				</li>
				<li>
					<div class="inp_wid wid4">
						<i>*</i>



						<!-- 회원 -->
						<select class="select phone" id="phone1" name="phone1"
							title="휴대폰 앞자리">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> <input type="tel" id="phone2" name="phone2" class="input phone"
							title="휴대폰 앞자리" maxlength="4" value="" /> <input type="tel"
							id="phone3" name="phone3" class="input phone" title="휴대폰 뒷자리"
							maxlength="4" value="" />



					</div>
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

		<h3 class="cont_tit tit3 mt40">배달 주소정보</h3>
		<table class="table">
			<caption>배달 주소 리스트 - 주문배달지, 상세정보, 배달매장, 매장변경을 확인</caption>
			<colgroup>
				<col />
				<col style="width: 25%" />
				<col style="width: 15%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문배달지</th>
					<th scope="col">상세정보</th>
					<th scope="col">배달매장</th>
					<th scope="col">변경</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="t_left">서울특별시 금천구 가산동</td>
					<td>월드메르디앙1차 333</td>
					<td>구로점</td>
					<td><a href="/order/memberOrder"
						class="button h25 w80 btn_gray2">주소변경</a> <!-- <a href="#popZipcode" class="pop_open button h25 w80 btn_gray2">주소추가</a>
							<a href="#popMyAddress" class="pop_open button h25 w80 btn_gray2 gray2">주소선택</a> -->
					</td>
				</tr>
			</tbody>
		</table>

		<h3 class="cont_tit tit3 mt40">결제 정보입력</h3>
		<ul class="comment_list mt25">
			<!-- <li>신용카드는 온라인 결제에서만 가능합니다.</li>
 				<li>현금결제는 배달 수령 시 버거킹딜리버리 직원에게 직접 하시면 됩니다.</li> -->
		</ul>

		<div class="cart_tbl">
			<div>
				<strong class="tit">온라인 결제</strong> <label class="radio"> <input
					type="radio" name="aCheckCard" value="2" checked="checked" /> <span
					class="lbl">신용카드</span>
				</label>
			</div>
			<div>
				<strong class="tit">배달원에게 결제</strong> <label class="radio">
					<input type="radio" name="aCheckCard" value="0" /> <span
					class="lbl">신용카드</span>
				</label> <label class="radio"> <input type="radio" name="aCheckCard"
					value="1" /> <span class="lbl">현금 </span>
				</label> <span class="pay_group">( <label class="radio"> <input
						type="radio" name="cashType" value="[일반현금 결제]/"
						disabled="disabled" /><span class="lbl">일반현금</span>
				</label> <label class="radio"> <input type="radio" name="cashType"
						value="[5만원권 결제]/" disabled="disabled" /><span class="lbl">5만원권</span>
				</label> <label class="radio"> <input type="radio" name="cashType"
						value="[10만원권 결제]/" disabled="disabled" /><span class="lbl">10만원권</span>
				</label> <label class="checkbox"> <input type="checkbox"
						name="cashReceipt" value="[현금영수증 신청]/" disabled="disabled" /><span
						class="lbl">현금영수증</span>
				</label>
				</span>
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
			<a href="javascript:PageFunction.paymentProcess();"
				class="button h50 w200 btn_org">결제하기</a> <a
				href="<c:url value='/menu/All.whpr'/>" class="button h50 w200">계속쇼핑하기</a>
		</p>
	</form>
</section>
<!-- //contents -->

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
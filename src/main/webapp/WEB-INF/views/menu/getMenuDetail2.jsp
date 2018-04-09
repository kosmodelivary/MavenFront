<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<article id="menuDetail" class="menu_view">
	<div class="f_left">
		<!-- 제품명, 제품이미지 확장자 el로 가져오기 -->
		<div class="img">
			<img
				src="http://restapi.fs.ncloud.com/bkproject/image/menu/${oneMenu.menu_name }${oneMenu.menu_file_extension}"
				alt="${oneMenu.menu_name }" />
		</div>
		<ul>
			<li>
				<div class="option_change">
					<strong>구성변경</strong> <select class="select" title="drink"
						onChange="PopupFunction.addCondiment(this)">
						<option value="">음료변경</option>
						<option data-price="800" value="3020031">미닛메이드 (+800)</option>
						<option data-price="0" value="3020032">순수(생수) (+0)</option>
						<option data-price="0" value="3030038">아메리카노 (+0)</option>
						<option data-price="0" value="3030039">아이스아메리카노 (+0)</option>
						<option data-price="300" value="3030040">핫초코 (+300)</option>
						<option data-price="200" value="3040042">콜라(L) (+200)</option>
						<option data-price="200" value="3040043">스프라이트(L) (+200)</option>
						<option data-price="200" value="3040044">환타(L) (+200)</option>
						<option data-price="200" value="3040045">제로콜라(L) (+200)</option>
						<option data-price="0" value="3040050">제로콜라® (+0)</option>
						<option data-price="0" value="3040051">환타® (+0)</option>
						<option data-price="0" value="3040052">스프라이트® (+0)</option>
					</select>
				</div>
			</li>
		</ul>
	</div>
	<div class="f_right">
		<!-- 제품명 el로 가져오기 -->
		<h1>${oneMenu.menu_name }</h1>
		<!-- 영문 빼기 -->
		<!-- <p class="eng">Double Pack 2</p> -->
		<!-- 우짜까... -->
		<div class="txt">
			<!-- 빅앤더블버거+뉴올리언스치킨버거+프렌치프라이(L)+콜라(R)2 -->
			<br />
			<br /> 해당사항없음
		</div>
		<div class="hidden pb10">
			<!-- 제품가격 el로 가져오기 -->
			<span class="unit_price detail_product_text_price price"
				data-price="${oneMenu.menu_price }">${oneMenu.menu_price }원</span>
			<div class="opt_spinner_wrap">
				<strong>수량선택</strong> <span class="opt_spinner"> <span
					class="opt_area"> <span class="opt_txt opt_qty">1</span>
				</span> <a href="javascript:PopupFunction.changeQty('P')"
					class="btn_opt opt_plus"></a> <!-- 더하기 --> <a
					href="javascript:PopupFunction.changeQty('M')"
					class="btn_opt opt_minus"></a> <!-- 빼기 -->
				</span>
			</div>
		</div>
		<p class="opt_txt topping_options">
			<!-- 토핑 변경 메모추가-->
		</p>
		<div class="mt20">
			<table class="table2">
				<!-- 제품성분 el로 가져오기 -->
				<caption>제품 성분 리스트</caption>
				<colgroup>
					<col />
					<col />
					<col />
					<col />
					<col />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">중량(g)</th>
						<th scope="col">열량(kcal)</th>
						<th scope="col">단백질(g)</th>
						<th scope="col">나트륨(mg)</th>
						<th scope="col">당류(g)</th>
						<th scope="col">포화지방(g)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${oneMenu.menu_weight }</td>
						<td>${oneMenu.menu_calrorie }</td>
						<td>${oneMenu.menu_protein }</td>
						<td>${oneMenu.menu_sodium }</td>
						<td>${oneMenu.menu_sugars }</td>
						<td>${oneMenu.menu_fat }</td>
					</tr>
				</tbody>
			</table>
		</div>

		<p class="t_right bold mt10">
			<a href="https://www.burgerking.co.kr/nutrition" target="_blank"
				title="새창열림"><span>알러지 유발성분 확인</span></a>
		</p>
		<div class="button_area btn2 mt10">
			<a class="button btn_org h40 w150"
				href="javascript:PopupFunction.goOrderProduct(7190349)">주문하기</a> <a
				class="button h40 w150"
				href="javascript:PopupFunction.addProduct(7190349)">장바구니담기</a>
		</div>
	</div>
	<a href="#" class="btn_close menu_close">닫기????</a>
</article>
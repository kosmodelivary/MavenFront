<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- lnb -->
<aside id="lnb">
	<h1>
		<img src="<c:url value='/resources/images/common/tit_store.png'/>"
			alt="STORE" />
	</h1>
	<nav>
		<ul>
			<li><a href="<c:url value='/store/Search.whpr'/>">배달매장찾기</a></li>
		</ul>
	</nav>
</aside>
<!-- //lnb -->
<!-- contents -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
		<li><span>STORE</span></li>
		<li><strong>배달매장찾기</strong></li>
	</ul>

	<div id="cont_tit">
		<h1>배달매장찾기</h1>
	</div>

	<p class="bold f16">주소 또는 매장명 검색을 통하여 버거킹 매장 정보를 확인해보세요.</p>
	<div class="store_search">
		<div>
			<label class="radio"> <input type="radio" name="searchType"
				checked="checked" value="address" /> <span class="lbl ">주소로
					검색</span>
			</label>

			<!-- 시/도 구/군 셀렉트 박스 영역 -->
			<span id="areaInfo"> <select class="select" title="주소 시/구 선택"
				id="sido">
					<option value="">시/도</option>
					<option value="강원">강원도</option>
					<option value="경기">경기도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="광주">광주광역시</option>
					<option value="대구">대구광역시</option>
					<option value="대전">대전광역시</option>
					<option value="부산">부산광역시</option>
					<option value="서울">서울특별시</option>
					<option value="세종">세종특별자치시</option>
					<option value="울산">울산광역시</option>
					<option value="인천">인천광역시</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주">제주특별자치도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
			</select> <select class="select" title="주소 구/군 선택" id="gugun">
					<option value="">구/군</option>



			</select>
			</span>

		</div>
		<div>
			<label class="radio"> <input type="radio" name="searchType"
				value="name" /> <span class="lbl">매장명으로 검색</span>
			</label> <span> <input type="text" class="input" placeholder="매장명 입력"
				title="매장명 입력" id="searchWord" /> <a
				href="javascript:PageFunction.getList(1)" class="button">검색</a>
			</span>
		</div>
	</div>

	<div id="storeList">
		<table class="table mt15">
			<caption>버거킹 매장 리스트 - 매장명, 매장주소, 배달가능시간, 위치 등 확인</caption>
			<colgroup>
				<col style="width: 15%" />
				<col />
				<col style="width: 13%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">매장명</th>
					<th scope="col">매장주소</th>
					<th scope="col">최소주문금액</th>
					<th scope="col">배달가능시간</th>
					<th scope="col">상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty store }" var="flag">
					<tr>
						<td colspan="6">등록된 자료가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not flag }">
					<c:forEach var="item" items="${store }" varStatus="loop">
						<tr>
							<!-- 매장이름 -->
							<td>${item.name }</td>
							<!-- 매장주소 -->
							<td>${item.addr }</td>
							<!-- 최소주문가격 -->
							<td>${item.minordermoney }</td>
							<td>
								<!-- 개/폐점 시간 -->
								<p>주중 : ${item.weekdayon }:00~${item.weekdayoff }:00</p>
								<p>주말 : ${item.weekendon }:00~${item.weekendoff }:00</p> <!-- 서버시간과 매점개폐시간에 맞춰 이프문으로 개점 폐점 분기. -->
								<%-- <c:if > --%>
								<p class="t_blue">개점</p> <%-- </c:if> --%>
							</td>
							<td><a class="button h25 btn_white w60"
								href="<c:url value='/store/Detail.whpr?no=${item.no }'/>">상세보기</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>

		<!-- paging -->
		<!-- <p class="list_paging">
						<a class="btn_paging" href="javascript:void(0)"> <img
							src="/resources/images/common/paging_prev.gif" alt="이전페이지" />
						</a> <a href="javascript:PageFunction.getList(1)"> <strong>1</strong>
						</a> <a href="javascript:PageFunction.getList(2)"> 2 </a> <a
							href="javascript:PageFunction.getList(3)"> 3 </a> <a
							href="javascript:PageFunction.getList(4)"> 4 </a> <a
							href="javascript:PageFunction.getList(5)"> 5 </a> <a
							href="javascript:PageFunction.getList(6)"> 6 </a> <a
							href="javascript:PageFunction.getList(7)"> 7 </a> <a
							href="javascript:PageFunction.getList(8)"> 8 </a> <a
							href="javascript:PageFunction.getList(9)"> 9 </a> <a
							href="javascript:PageFunction.getList(10)"> 10 </a> <a
							class="btn_paging" href="javascript:PageFunction.getList(2)">
							<img src="/resources/images/common/paging_next.gif" alt="다음페이지" />
						</a>
					</p> -->
		<!-- //paging -->
	</div>
</section>
<!-- //contents -->

<script type="text/javascript">
	$(document).ready(function(){
	    $("#sido").on('change',function(){
				console.log($('input[name=searchType]:checked').val()+$('#sido').val());
				$.ajax({
					url:"<c:url value='/store/find.whpr'/>",
					type:"get",
					dataType:"json",
					data:{
						"searchType" : $('input[name=searchType]:checked').val(),
	    				"aSi" : $('#sido').val()},
					success:function(data,target){
							gugunCallback(data,$('#gugun'));					
							},
					error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
				});
	    });
	    
	    $("#gugun").on('change',function(){
			console.log($('input[name=searchType]:checked').val()+$('#sido').val());
			$.ajax({
				url:"<c:url value='/store/find.whpr'/>",
				type:"get",
				dataType:"json",
				data:{"searchType" : $('input[name=searchType]:checked').val(),
    			 "aSi" : $('#sido').val()},
				success:function(data,target){
				gugunCallback(data,$('#gugun'));					
						},
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
    });
	    
	    $('#searchWord').on('focus',function(){
			$('input[name=searchType][value=name]').attr('checked', true);
			console.log($('input[name=searchType]:checked').val()+$('#searchWord').val());
			$.ajax({
				url:"<c:url value='/store/find.whpr'/>",
				type:"get",
				dataType:"json",
				data:{"searchType" : $('input[name=searchType]:checked').val(),
					  "searchWord" : $('#searchWord').val()},
				success:function(data){
					nameCallback(data);
				},
				error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
			});
		});
	});
	
	/* $(document).ready(function(){
		
	}); */
	
	function gugunCallback(data,target){
		//console.log('서버로부터 받은 데이터 : '+data+', 유형 : '+typeof data);
		var value;
		$.each(data, function(key, val) {
			var obj = val.toString().split(',');
			$.each(obj, function(i, elt) {
				value += "<option value='elt'>"+elt+"</option>";
			});
		});
		$(target).html(value);
	}
	
	function nameCallback(data){
		console.log('서버로부터 받은 데이터 : '+data+', 유형 : '+typeof data);
	}
	
	/* //<![CDATA[
	//page parameter
	var PageParam = {};

	//page function
	var PageFunction = (function(pf) {

		pf.init = function() {
		};

		//매장 리스트 조회
		pf.getList = function(pageNum) {

			var param = [];
			param.push("pageNum=" + pageNum);
			param.push("searchType="
					+ $('input[name=searchType]:checked').val());
			param.push("searchWord=" + $('#searchWord').val());
			param.push("aSi=" + $('#sido').val());
			param.push("aGu=" + $('#gugun').val());

			$('#storeList').getLoad('/store/search?' + param.join("&"));
		};

		// 시/도 변경 시 구/군 조회
		pf.getGugun = function(sido) {
			$('#gugun').getLoad('/store/getGugun?sido=' + sido);
		};

		return pf;

	}(window.pf || {}));

	$(function() {
		$('#sido').click(function() {
			$('input[name=searchType][value=address]').attr('checked', true);
		});

		$("#gugun").click(function() {
			$('input[name=searchType][value=address]').attr('checked', true);
		});

		$('#searchWord').focus(function() {
			$('input[name=searchType][value=name]').attr('checked', true);
		});

		$('#sido').change(function() {
			PageFunction.getGugun(this.value);
		});

		// 검색창 Enter키 입력
		$('#searchWord').keyup(function(e) {
			if (e.keyCode == 13)
				PageFunction.getList(1);
		});
	});
	//]]> */
</script>
</html>
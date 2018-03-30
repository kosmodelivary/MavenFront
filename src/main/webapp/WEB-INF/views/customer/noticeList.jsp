<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div id="container">
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
			<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
			<li><span>FAQ</span></li>
			<li><strong>공지사항</strong></li>
		</ul>

		<div id="cont_tit">
			<h1>공지사항</h1>
		</div>

		<p>
			총 <strong class="t_red">13</strong>개의 글이 등록되어 있습니다.
		</p>
		<div id="noticeList">
			<table class="table mt15">
				<caption>공지사항 리스트 - 번호, 제목, 작성일, 조회수 등 확인</caption>
				<colgroup>
					<col style="width: 10%" />
					<col />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>13</td>
						<td class="t_left">
							<a href="javascript:PageFunction.getNoticeDetail(26, 13, 1)">포항법원앞SK점 11월 29일(수) ~ 12월 20일(수) 휴점</a>
						</td>
						<td>2017-11-30</td>
						<td>165</td>
					</tr>
				</tbody>
			</table>
	
			<!-- paging -->
			<p class="list_paging">
				<a class="btn_paging" href="javascript:void(0)">
					<img src="../resources/images/common/paging_prev.gif" alt="이전페이지" />
				</a>
				
				<a href="javascript:PageFunction.getNoticeList(1)">
					
					<strong>1</strong>
				</a>
				
				<a href="javascript:PageFunction.getNoticeList(2)">
					2
					
				</a>
				
				<a class="btn_paging" href="javascript:PageFunction.getNoticeList(2)">
					<img src="../resources/images/common/paging_next.gif" alt="다음페이지" />
				</a>
			</p>
		</div>
	</section>
	<!-- //contents -->
	
	<script type="text/javascript">
		//<![CDATA[
			//page parameter
			var PageParam = {};
			
			//page function
			var PageFunction = (function(pf) {
				
				pf.init = function() {}
				
				pf.getNoticeList = function(pageNum) {
					var param = [];
					param.push("pageNum=" + pageNum);
					
					$("#noticeList").getLoad("/customer/noticeList?pageNum=" + pageNum);
				}
				

				//공지사항 상세 
				pf.getNoticeDetail = function(boardSeq, rowNum, pageNum) {
					if (!rowNum) return false;
					cntt.goPagePost("/customer/noticeDetail", {boardSeq : boardSeq, rowNum : rowNum, pageNum : pageNum});
				};
				
				return pf;
				
			}(window.pf || {}));
		//]]>
		</script>
	</div>
</body>
</html>
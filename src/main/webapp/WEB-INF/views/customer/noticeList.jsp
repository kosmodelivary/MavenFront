<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<aside id="lnb">
	<h1><img src="../resources/images/common/tit_faq.png" alt="버거킹 회원" /></h1>
	<nav>
		<ul>
			<li><a href="<c:url value='/customer/faqList.whpr'/>">FAQ</a></li>
			<li><a href="<c:url value='/customer/noticeList.whpr'/>">공지사항</a></li>
		</ul>
	</nav>
</aside>
	
	<section id="contents">
		<ul id="location">
			<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
			<li><span>FAQ</span></li>
			<li><strong>공지사항</strong></li>
		</ul>

		<div id="cont_tit">
			<h1>공지사항</h1>
		</div>

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
						<!-- <th scope="col">조회수</th> -->
					</tr>
				</thead>
				
				<tbody id="noticeListBody"><!-- id 설정  -->
					<c:if test="${empty notice }" var="flag">
						<tr>
							<td colspan="6">등록된 자료가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not flag }">
						<c:forEach var="item" items="${notice }" varStatus="loop">						
						<tr>
							<!-- 공지사항 번호 -->
							<td>${item.notice_no }</td>
							<!-- 공지사항 타이틀 -->
							<td class="t_left">
								<a href="<c:url value='/customer/noticeDetail.whpr?no=${item.notice_no }'/>"/>
								${item.notice_title }</a>
							</td>
							<!-- 공자사항 작성일 -->
							<td>${item.notice_postdate }</td>
							<!-- 공지사항 조회수 -->
							<%-- <td>${item.notice_visitcount }</td> --%>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<p class="list_paging">
				${pagingString }
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
</html>
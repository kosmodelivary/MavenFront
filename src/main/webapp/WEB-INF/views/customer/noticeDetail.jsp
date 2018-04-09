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
			<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
			<li><span>FAQ</span></li>
			<li><strong>공지사항</strong></li>
		</ul>
		
		<div id="cont_tit">
			<h1>공지사항</h1>
		</div>
		<div id="noticeDetail">
		
			<article class="list_view">
			
				<h1 class="tit">${ndto.notice_title }</h1>
				<div class="info">
					<span class="date">등록일 :</span> 
					<span>${ndto.notice_postdate }</span>
				</div>
				<div class="view_cont">
					<!-- <div th:text="${noticeDetail.boardContent}"></div> -->
					<div>${ndto.notice_title } 
					<br />${ndto.notice_content }
					<br /></div>
					<!-- <img th:src="${noticeDetail.imagePath}"/> -->
				</div>	
			</article>
					
			<!-- <ul class="listNavi">
				<li class="prev">
					<a href="javascript:void(0);" class="goPrevNextPage" data-seq="9" data-pn="1" data-rn="8">
						<strong>이전 게시글</strong>
						<span>추석연휴 휴무매장 안내</span>
					</a>
				</li>
				<li class="next">
					<a href="javascript:void(0);" class="goPrevNextPage" data-seq="24" data-pn="1" data-rn="10">
						<strong>다음 게시글</strong>
						<span>쌍문점 휴점 안내 - 11월 13일(월) ~ 12월 20일(수)</span>
					</a>
				</li>
			</ul> -->
			<p class="button_area mt30">
				<a href="<c:url value='/customer/noticeList.whpr?no=${item.notice_no }'/>"/>목록</a>
			</p>
		</div>
	</section>
	
			<!-- //contents -->
			<script type="text/javascript">
			// page parameter
			var PageParam = {};
			// page function

			var PageFunction = (function(pf) {
				// document ready
				pf.init = function(){};
				
				// 목록 가기
				 pf.goNoticeList = function(pageNum) {
					cntt.goPagePost('/customer/noticeList', {pageNum : 1});
				}; 
				// 이전글, 다음글
				pf.goPrevNextPage = function() {
					var seq = $(this).data('seq');
					var rn = $(this).data('rn');
					var pn = $(this).data('pn');
					if (rn) {
						cntt.goPagePost('/customer/noticeDetail', {boardSeq : seq, rowNum : rn, pageNum : pn});
					}
				};
				
				return pf;
			}(window.pf || {}));
			
			// 이벤트
			(function(){
				// 목록 가기
				$('#goNoticeList').click(function() {
					PageFunction.goNoticeList();
				});
				// 이전글, 다음글
				$('.goPrevNextPage').click(function() {
					PageFunction.goPrevNextPage.call(this);
				});
			}());	
			
			
			
				//	'/customer/noticeList/' + ${noticeDetail.pageNum}	
			
			
	</script>
</html>
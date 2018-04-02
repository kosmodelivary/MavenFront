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
			<li><strong>FAQ</strong></li>
		</ul>

		<div id="cont_tit">
			<h1>FAQ</h1>
		</div>

		<ul class="tabmenu ui-tabmenu six_tab">
			<li><a href="#tabCon1">제품/구매</a></li>
			<li><a href="#tabCon2">기타</a></li>
		</ul>
		<div id="tabCon1" class="tab_cont">
			<dl class="qna_list qna_motion">
			<c:forEach var="item" items="${faq }" varStatus="loop" >
				<dt>
					<strong>Q</strong> <a href="#">${item.faq_ask }</a>
				</dt>
				<dd>
					<div>${item.faq_answer }</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>
			
				</c:forEach>
			</dl>
		</div>
		
		<div id="tabCon2" class="tab_cont">
			<dl class="qna_list qna_motion">
			<c:forEach var="item" items="${faq }" varStatus="loop" >
				<dt>
					<strong>Q</strong> <a href="#">${item.faq_ask }</a>
				</dt>
				<dd>
					<div>${item.faq_answer }</div>
					<a href="#" class="btn_close">닫기</a>
				</dd>	
			</c:forEach>
				
			</dl>
		</div>
	</section>
	</div>	
</html>
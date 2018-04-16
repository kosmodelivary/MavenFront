<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer id="footer">
	<div class="foot_util">
		<div class="inner">
			<ul>
				<li><a href="<c:url value='/customer/faqList.whpr'/>">FAQ</a></li>
				<li><a href="<c:url value='/etc/terms.whpr'/>">이용약관</a></li>
				<li><a href="<c:url value='/etc/privacy.whpr'/>">개인정보처리방침</a></li>
				<li><a href="#">사이트맵</a></li>
				<li><a href="<c:url value='/customer/noticeList.whpr'/>">공지사항</a></li>
				<!-- <li><a href="#">사이버상담실</a></li> -->
				<!-- <li><a href="#">법적고지</a></li> -->
				<!-- <li><a href="#">브랜드사이트</a></li> -->
			</ul>
		</div>
	</div>
	<div class="inner">
		<div class="copyright">
			<p>
				<strong>Copyright 2012 BKR Co., Ltd. All right Reserved</strong>
			</p>
			<p>
				<span>(주)BKR</span> <span>대표이사 문영주</span> <span>사업자 등록번호
					101-86-76277</span> <span>서울 종로구 삼봉로 71 G 타워 2층</span> <span>주식회사
					비케이알</span>
			</p>
			<p>
				<span>TEL 02-6331-8282</span> <span>FAX 02-3775-4325</span>
			</p>
		</div>
	</div>

	<!-- 공통 안내 레이어 팝업 -->
	<div id="popAlert" class="pop_bg">
		<article class="pop_wrap">
			<header class="pop_head">
				<h1>안내</h1>
			</header>
			<section class="pop_cont">
				<div>
					<div class="pt10 pb10 t_center">
						<p class="f14" id="alert_msg"></p>
					</div>
					<div class="pt10 pb10 t_center">
						<p class="button_area mt10">
							<a id="alert_dest" href="#" class="pop_close button btn_org w120">확인</a>
						</p>
					</div>
				</div>
			</section>
			<footer class="pop_foot">
				<a href="#" class="pop_close">팝업 닫기</a>
			</footer>
		</article>
	</div>

</footer>

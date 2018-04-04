<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- lnb -->
<aside id="lnb">
	<h1>
		<img src="<c:url value='/resources/images/common/tit_mypage.png'/>" alt="마이페이지" />
	</h1>
	<nav>
		<ul>
			<li><a href="<c:url value='/mypage/memberUpdate.whpr'/>">내 정보수정</a></li>
			<li><a href="<c:url value='/mypage/mypage.whpr'/>">내 주문내역</a></li>
			<li><a href="<c:url value='/mypage/passwordUpdate.whpr'/>">비밀번호 변경</a></li>
			<li><a href="<c:url value='/mypage/memberWithdraw.whpr'/>">회원탈퇴</a></li>
		</ul>
	</nav>
</aside>
<!-- //lnb -->
<!-- contents -->
<section id="contents">
	<ul id="location">
		<li><a class="home" href="<c:url value='/'/>">HOME</a></li>
		<li><span>마이페이지</span></li>
		<li><strong>회원탈퇴</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>회원탈퇴</h1>
	</div>
	<div class="boxStyle">
		<div class="memberOut_complate">
			<h2>회원탈퇴가 완료되었습니다.</h2>
			<p>보다 나은 버거킹으로 다시 만나 뵐 수 있기를 바랍니다.</p>
		</div>
	</div>
	<p class="button_area mt30">
		<a href="<c:url value='/'/>" class="button h40 w200 gray">버거킹 홈</a>
	</p>
</section>
<!-- //contents -->
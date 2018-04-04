<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="container">
	<!-- lnb -->
	<aside id="lnb">
		<h1>
			<img src="<c:url value='/resources/images/common/tit_members.png'/>" alt="버거킹 회원" />
		</h1>
		<nav>
			<ul>
				<li><a href="<c:url value='/member/login.whpr'/>">로그인</a></li>
				<li><a href="<c:url value='/member/joinAgree.whpr'/>">회원가입</a></li>
				<li><a href="<c:url value='/member/searchIdPassword.whpr'/>">아이디/비밀번호 찾기</a></li>
				<li><a href="/order/nonMemberOrder">비회원주문</a></li>
			</ul>
		</nav>
	</aside>
	<!-- //lnb -->
	<!-- contents -->
	<section id="contents">
		<ul id="location">
			<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
			<li><span>버거킹 회원</span></li>
			<li><strong>회원가입</strong></li>
		</ul>
		<div id="cont_tit">
			<h1>BURGER KING 회원가입</h1>
		</div>
		<div class="order_tit">
			<h2>정보입력</h2>
			<p>
				<img src="<c:url value='/resources/images/member/step3.gif'/>" alt="01약관동의, 02정보입력, 03가입완료(현재위치)" />
			</p>
		</div>
		<div class="form_list noline">
			<h3 class="cont_tit tit3">회원가입정보</h3>
			<ul class="comment_list">
				<li>고객님의 회원아이디는 <strong class="t_blue">${email }</strong> 입니다.
				</li>
				<li>계정정보 분실 시 메뉴 <strong class="bold">내 아이디/비밀번호 찾기</strong>로 정보를 찾을 수 있습니다.
				</li>
			</ul>
		</div>
		<p class="button_area btn2 mt30">
			<a href="<c:url value='/member/login.whpr'/>" class="button h40 w200">로그인</a>
			<a href="<c:url value='/home.whpr'/>" class="button h40 w200 btn_gray">홈 바로가기</a>
		</p>
	</section>
	<!-- //contents -->
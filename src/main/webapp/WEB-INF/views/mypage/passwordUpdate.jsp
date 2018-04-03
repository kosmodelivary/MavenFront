<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/mypage/isMember.jsp"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
<script>
$(function(){
	//회원정보 유효성 검사
	$('form').validate({
		rules:{
			member_password:{required:true},
			passchange:{required:true,minlength:8,maxlength:20},
			pass2:{required:true,equalTo:"#pass"},
		},
		messages:{
			member_password:"현재 비밀번호를 입력하세요",
			passchange:"비밀번호를 8~20자 입력하세요",
			pass2:{required:"비밀번호를 입력하세요",equalTo:"비밀번호가 일치하지 않습니다"},
		}
	});
});
</script>
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
		<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
		<li><span>마이페이지</span></li>
		<li><strong>비밀번호 변경</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>비밀번호 변경</h1>
	</div>
	<form id="passwordUpdateForm" name="passwordUpdateForm" action="<c:url value='/mypage/passchange.whpr'/>" method="post">
		<div class="form_list first">
			<input type="hidden" name="member_email" value="${dto.member_email }" />
			<h3 class="cont_tit tit3">비밀번호변경</h3>
			<ul>
				<li>
					<div class="inp_wid">
						<input type="password" name="member_password" id="member_password" autocomplete="off" class="input" placeholder="현재 비밀번호 입력" title="현재 비밀번호 입력" maxlength="20"/><br>
						<label class="error" for="member_password" style="display:none;color:red;font-weight:bold"></label>
					</div>
				</li>
				<li>
					<div class="inp_wid">
						<input type="password" name="passchange" id="pass" autocomplete="off" class="input" placeholder="새 비밀번호 입력(8~20 영문, 숫자)" title="새 비밀번호 입력" maxlength="20" />
					</div>
					<label class="error" for="pass" style="display:none;color:red;font-weight:bold"></label>
				</li>
				<li>
					<div class="inp_wid">
						<input type="password" name="pass2" id="pass2" autocomplete="off" class="input" placeholder="새 비밀번호 재입력" title="새 비밀번호 재입력" maxlength="20" />
					</div>
					<label class="error" for="pass2" style="display:none;color:red;font-weight:bold"></label>
				</li>
			</ul>
		</div>
	<p class="button_area btn2 mt30">
		<input type="submit" class="button h40 w200" value="수정">
		<a href="/mypage" class="button h40 w200 btn_gray">취소</a>
	</p>
	</form>
</section>
<!-- //contents -->
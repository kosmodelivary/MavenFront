<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/mypage/isMember.jsp"%>
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
		<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
		<li><span>마이페이지</span></li>
		<li><strong>회원탈퇴</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>회원탈퇴</h1>
	</div>
		<div class="memberOut">
			<div class="first">
				<h2>개인정보 안내</h2>
				<p>
					그 동안 버거킹 딜리버리를 이용해 주셔서 감사합니다. <br />
					사용하시면서 불편하셨던 점이나 불만사항을 알려주시면 적극 반영하여 향후 개선하도록 하겠습니다. <br />
					아울러 회원 탈퇴 시 아래사항을 숙지하시기 바랍니다.
				</p>
				<ol class="boxStyle mt25">
					<li>1. 회원탈퇴 시 고객님의 정보는 전자상거래 상에서의 소비자보호 법률에 의거한 버거킹의 개인정보보호정책에 따라 관리됩니다.</li>
					<li>2. 탈퇴 처리 이후에는 어떠한 방법으로도 회원님의 개인정보를 복원할 수 없습니다.</li>
				</ol>
			</div>
			<div>
				<h2>탈퇴사유</h2>
				<p>
					<select class="select" title="탈퇴사유 선택" id="withdrawReason">
						<option value="01">개인정보보호</option>
						<option value="02">아이디변경</option>
						<option value="03">웹사이트이용불만</option>
						<option value="04">직접입력</option>
					</select>
				</p>
				<p>
					<textarea class="textarea" name="seceReason" id="seceReason" placeholder="직접 입력 최대 1000자 입력가능" title="탈퇴사유 내용입력" disabled="disabled" maxlength="1000"></textarea>
				</p>
			</div>
			<div>
				<form id="withdraw" action="<c:url value='/mypage/withdraw.whpr'/>">
					<h2>계정입력</h2>
					<p>
						아이디 : <strong id="userEmail"><input id="email" name="member_email" style="border:none;background-color:white;" value="${dto.member_email }" disabled></strong>
					</p>
					<div class="inp_wid wid4">
						<input type="password" name="member_password" id="password" class="input wid3" placeholder="비밀번호 입력" title="비밀번호 입력" maxlength="20" required/>
						<input type="button" class="button w120 ml6" id="memberWithdraw" value="회원탈퇴">
				</form>
			</div>
			</div>
		</div>
<!-- //contents -->
<script>
	$(function(){
		$("#memberWithdraw").click(function() {
			$("#email").removeAttr("disabled");
			$("#withdraw").submit();
		});
	});
</script>
	<script type="text/javascript">
		// page parameter
		var PageParam = {};

		// page function
		var PageFunction = (function(pf) {

			// document ready
			pf.init = function() {
				var _seceReason = $('#seceReason');
				var _withdrawReason = $('#withdrawReason');

				_seceReason.val(_withdrawReason.children('option:selected').text());
			};

			// 회원 탈퇴 처리
			pf.memberWithdraw = function() {
				var _seceReason = $('#seceReason');
				if ($('#withdrawReason').val() != 00) {
					_seceReason.removeAttr('disabled');
				}
				cntt.ajax.post('/mypage/memberWithdrawProcess', $('#memberWithdrawForm').serializeObject(), function() {
					cntt.goPage("/mypage/memberWithdrawSuccess");
				});
				if ($('#withdrawReason').val() != '04') {
					PageFunction.withdrawReason();
				}
			};

			// 회원 탈퇴 이유 
			pf.withdrawReason = function() {
				var _seceReason = $('#seceReason');
				var _withdrawReason = $('#withdrawReason');

				if (_withdrawReason.val() === '04') {
					_seceReason.removeAttr('disabled').focus();
					_seceReason.val('');
				} else {
					_seceReason.attr('disabled', 'disabled');
					_seceReason.val(_withdrawReason.children('option:selected').text());
				}
			};

			return pf;
		}(window.pf || {}));

		// 이벤트
		(function() {

			// 탈퇴 사유 선택
			$('#withdrawReason').change(function() {
				PageFunction.withdrawReason();
			});

		}());
	</script>
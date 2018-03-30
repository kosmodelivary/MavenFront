<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

			<!-- lnb -->
			<aside id="lnb">
				<h1>
					<img src="/resources/images/common/tit_mypage.png" alt="마이페이지" />
				</h1>
				<nav>
					<ul>
						<li><a href="<c:url value='/mypage/memberUpdate.whpr'/>">내 정보수정</a></li>
						<li><a href="/mypage">내 주문내역</a></li>
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
				<p class="bold f16 mb15">남기웅 님께서 비밀번호를 변경한지 11일이 지났습니다.</p>
				<form id="passwordUpdateForm" name="passwordUpdateForm">
					<div class="form_list first">
						<input type="hidden" name="email" value="valentine-l@nate.com" />
						<h3 class="cont_tit tit3">비밀번호변경</h3>
						<ul>
							<li>
								<div class="inp_wid">
									<input type="password" name="password" id="password"
										autocomplete="off" class="input" placeholder="현재 비밀번호 입력"
										title="현재 비밀번호 입력" maxlength="20" />
								</div>
							</li>
							<li>
								<div class="inp_wid">
									<input type="password" name="changePassword"
										id="changePassword" autocomplete="off" class="input"
										placeholder="새 비밀번호 입력(8~20 영문, 숫자, 특수문자의 조합)"
										title="새 비밀번호 입력" maxlength="20" />
								</div>
							</li>
							<li>
								<div class="inp_wid">
									<input type="password" name="changeConfirmPassword"
										id="changeConfirmPassword" autocomplete="off" class="input"
										placeholder="새 비밀번호 재입력" title="새 비밀번호 재입력" maxlength="20" />
								</div>
							</li>
						</ul>
					</div>
				</form>
				<p class="button_area btn2 mt30">
					<a href="javascript:void(0);" id="passwordUpdate"
						class="button h40 w200">수정</a> <a href="/mypage"
						class="button h40 w200 btn_gray">취소</a>
				</p>
			</section>
			<!-- //contents -->

			<script type="text/javascript">
				// page parameter
				var PageParam = {};

				// page function
				var PageFunction = (function(pf) {

					// document ready
					pf.init = function() {
					};

					// 비밀번호 변경
					pf.passwordUpdate = function() {
						cntt.ajax.post('/mypage/passwordUpdateProcess', $(
								'#passwordUpdateForm').serializeObject(),
								function() {
									cntt.goPage("/mypage");
								});
					};

					return pf;
				}(window.pf || {}));

				// 이벤트
				(function() {

					// 비밀번호 변경 클릭
					$('#passwordUpdate').click(function() {
						PageFunction.passwordUpdate();
					});

				}());
			</script>
</body>
</html>
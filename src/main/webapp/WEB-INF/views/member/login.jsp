<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<!-- lnb -->
		<aside id="lnb">
		<h1><img src="<c:url value='/resources/images/common/tit_members.png'/>" alt="버거킹 회원" /></h1>
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
				<li><strong>로그인</strong></li>
			</ul>
			<div id="cont_tit">
				<h1>BURGER KING 로그인</h1>
			</div>
			<div class="login_wrap">
				<div class="login_left">		
					<form id="loginForm" name="loginForm" action="<c:url value='/member/loginProc.whpr'/>" method="post">
						<input type="hidden" id="loginFlag" name="loginFlag" value="user" />
						<h2 class="cont_tit tit2">회원로그인</h2>
						<ul class="login_list">
							<li><input type="email" id="email" name="member_email" class="input" placeholder="이메일 주소 입력" title="이메일주소 입력" maxlength="50" required/></li>
							<li><input type="password" id="password" name="member_password" class="input" placeholder="비밀번호 입력(8~20 영문, 숫자)" title="비밀번호 입력" maxlength="20" required/></li>
							<li><label class="mt10 checkbox"><span>${loginErr }</span>
								</label>
								<button type="submit" class="button h40 w130 f_right" id="loginProcessButton">로그인</button>
							</li>
						</ul>
						<ul class="login_list2">
							<li><span>회원가입을 하시면 더 많은 혜택이 있습니다.</span><a href="joinAgree.html" class="button btn_gray">회원가입</a></li>
							<li><span>아이디/비밀번호를 잃어버리셨나요?</span><a href="searchIdPassword.html" class="button btn_gray p10">아이디/비밀번호찾기</a></li>
						</ul>
					</form>
				</div>
				<div class="login_right">
					<h2 class="cont_tit tit2">비회원주문</h2>
					<p class="radio_box">
						<label class="radio"><input type="radio" class="rdoOpt" name="rdoOpt" value="nonmember1" checked="checked" />
							<span class="lbl">비회원주문</span>
						</label>
						<label class="radio"><input type="radio" class="rdoOpt" name="rdoOpt" value="nonmember2" />
							<span class="lbl">비회원주문조회</span>
						</label>
					</p>
					<div id="nonmember1">
						<div class="txt">
							<p>회원가입 없이 비회원으로 주문이 가능합니다.</p>
							<p>비회원 주문 시 간단한 휴대폰 인증 후 고객님의 배송지 확인 후 회원과 동일한 서비스를 이용하실 수 있습니다.</p>
						</div>
						<p class="t_right">
							<a href="../order/nonMemberOrder.html" class="button h40 w130">비회원주문</a>
						</p>
					</div>
					<!-- 동의 후 조회: 기본숨김 -->
					<div id="nonmember2" class="hide">
						<div class="nonmember">
							<select id="searchOpt" class="select" title="조회방법 선택">
								<option value="number">주문번호</option>
								<option value="phone">휴대폰번호</option>
							</select>
							<form id="nonMemberForm" name="nonMemberForm">	
								<ul class="login_list">
									<!-- 주문번호 -->
									<li id="number" class="cont"><input type="text" name="orderNumber" id="orderNumber" class="input" maxlength="23" placeholder="- 제외한 주문번호 입력" title="비회원 주문번호 입력" /></li>
									<!-- 휴대폰번호: 기본숨김 -->
									<li id="phone" class="inp_wid wid3 hide cont">
										<select id="phoneValid" class="select" title="휴대폰 앞자리 선택">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<input type="tel" class="input" id="phone2" placeholder="" title="휴대폰 앞자리 입력" maxlength="4" />
										<input type="tel" class="input" id="phone3" placeholder="" title="휴대폰 뒷자리 입력" maxlength="4" />
									</li>
									<li><input type="password" name="orderPassword" id="orderPassword" class="input" maxlength="6" placeholder="주문비밀번호 입력" title="주문비밀번호 입력" /></li>
									<li class="t_right"><a href="javascript:void(0);" class="button h40 w130" id="nonMemberOrderLookup">비회원조회</a></li>
								</ul>
							</form>
						</div>			
					</div>
				</div>
			</div>
		</section>
		<!-- //contents -->
		<!-- popup -->
		<div id="popSleepMember" class="pop_bg">
		<article class="pop_wrap">			
			<div class="pop_head">
				<h1>휴면 계정 안내</h1>
			</div>
			<div class="pop_cont">
				<div>
					<p class="f16">회원님의 아이디는 1년이상 로그인 하지 않아, <strong class="t_blk">휴면계정으로 전환</strong>된 상태입니다. </p>
					<p class="mt10 f16">지속적인 서비스 이용을 위해 휴면을 해제하시고자 하면 아래의 <strong>[휴면계정 해제]</strong> 버튼을 클릭해주세요. 
					휴면계정의 해제를 하지 않을 경우<strong class="t_red">기존 계정으로의 로그인이 불가</strong>합니다.</p>
					<p class="t_center mt30">
						<a href="javascript:void(0);" class="button h40 btn_org" id="dormancyAccountRelease">휴면계정 해제</a>
					</p>
				</div>
			</div>
			<div class="pop_foot">
				<a href="#" class="pop_close">팝업닫기</a>
			</div>
		</article>
	</div>
		<!-- //popup -->
		<script type="text/javascript">
			
			// page parameter
			var PageParam = {};
			
			// page function
			var PageFunction = (function(pf) {
				
				// document ready
				pf.init = function() {
					// 쿠키 확인 및 처리
					var userEmail = cntt.cookie.get("userEmail");
					if (userEmail) {
						$('#email').val(userEmail);
						$('#emailInfoSave').prop('checked', true);
					}
				};
				
				// 비회원 메뉴 선택
				pf.noneUserMenuChoice = function() {
					var _val = $(this).val();
					$('#'+ _val).show().siblings('div').hide();
					
					$('#phoneValid option:eq(0)', '#nonmember2').attr('selected', 'selected');
					$('input', '#nonmember2').val('');
				};
				
				// 비회원 주문 조회 방법 선택
				pf.noneUserOrderSearchChoice = function() {
					var _val = $(this).val();
					$('#'+ _val).show().siblings('.cont').hide();
					
					$('#phoneValid option:eq(0)', '#nonmember2').attr('selected', 'selected');
					$('input', '#nonmember2').val('');
				};
				
				// 휴면계정해제 클릭
				pf.dormancyAccountRelease = function() {
					cntt.ajax.post(
						'/member/updateDormancyAccount',
						$('#loginForm').serializeObject(),
						function(response) {
							popClose("#popSleepMember");
							pf.loginProcess();
						}
					);
				};
				
				// 비회원 주문 조회
				pf.nonMemberOrderLookup = function() {
					var searchOpt = $('#searchOpt').val();
					var ajaxUrl = '';
					var custPhone = '';
					if (searchOpt === 'number') {
						ajaxUrl = '../mypage/nonMemberOrderLookupNumber.html';
					} else if (searchOpt === 'phone') {
						custPhone = $('#phoneValid').val() + $('#phone2').val() + $('#phone3').val();
						ajaxUrl = '../mypage/nonMemberOrderLookupPhone.html';
					}
					cntt.ajax.post(
						ajaxUrl,
						{
							orderNumber	: $('#orderNumber').val(),
							phoneValid : custPhone,
							orderPassword : $('#orderPassword').val(),
							searchOption : searchOpt
						},
						function(response) {
							var param = {
								aOrderId : response.orderNumber,
								teme : response.searchOption
							};
							//<![CDATA[
							cntt.goPagePost("/mypage/nonMemberOrderDetail", param);
							//]]>
						}
					);
				};
				
				return pf;
			}(window.pf || {}));
			
			// 이벤트
			(function(){
				// 로그인 버튼 클릭
				$('#loginProcessButton').click(function(){
					PageFunction.loginProcess();
				});
				
				// 비회원 메뉴 선택
				$('.rdoOpt').change(function(){
					PageFunction.noneUserMenuChoice.call(this);	
				});	
				
				// 비회원 주문 조회 방법 선택
				$('#searchOpt').change(function(){
					PageFunction.noneUserOrderSearchChoice.call(this); 
				});
				
				// 휴면계정해제 클릭 (popSleepMember.html)
				$('#dormancyAccountRelease').click(function(){
					PageFunction.dormancyAccountRelease();
				});
				
				// 비회원 주문 조회 클릭
				$('#nonMemberOrderLookup').click(function(){
					PageFunction.nonMemberOrderLookup();
				});
			}());
			// 이벤트
			(function(){
				// input Enter Key 
				$(".login_list .input").keyup(function(e){
					if(e.keyCode == 13)
						$('#loginProcessButton').click();
				});
			}());	
		</script>		
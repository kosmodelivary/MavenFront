<%@page import="com.bgk.delivery.service.FindPassDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bgk.delivery.impl.FindPassDAO"%>
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
				<li><a class="home" href="../index.jsp">HOME</a></li>
				<li><span>버거킹 회원</span></li>
				<li><strong>회원가입</strong></li>
			</ul>
			<div id="cont_tit">
				<h1>BURGER KING 회원가입</h1>
			</div>			
							
			<div class="order_tit">
				<h2>정보입력</h2>
				<p><img src="/resources/images/member/step2.gif" alt="01약관동의, 02정보입력(현재위치), 03가입완료" /></p>
			</div>
			<input type="hidden" name="eventSms" id="eventSms" value="Y" />
			<input type="hidden" name="eventEmail" id="eventEmail" value="Y" />
			<div class="form_list noline">
				<h3 class="cont_tit tit3">정보입력</h3>
				<ul>
					<li>
						<div class="inp_wid inp_mail"><i>*</i>
							<input type="text" autocomplete="off" class="input" title="이메일 입력" id="emailValid" maxlength="25" />
							<span>@</span>
							<input type="text" autocomplete="off" class="input" title="이메일 입력" id="email2" maxlength="25" />
							<select class="select" id="emailSelectBox">
								<option value="DIRECT">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="hanmail.net">다음</option>
								<option value="nate.com">네이트</option>
								<option value="gmail.com">지메일</option>
							</select>
						</div>
					</li>
					<li>
						<div class="inp_wid"><i>*</i><input type="password" name="password" id="password" autocomplete="off" class="input" placeholder="비밀번호 영문, 숫자, 특수문자 8~20자" title="비밀번호 입력" maxlength="20" /></div>
					</li>
					<li>
						<div class="inp_wid"><i>*</i><input type="password" name="confirmPassword" id="confirmPassword" autocomplete="off" class="input" placeholder="비밀번호 재입력" title="비밀번호 재입력" maxlength="20" /></div>
					</li>
				</ul>					
			</div>
			<div class="form_list">
				<h3 class="cont_tit tit3">이름입력</h3>
				<ul>
					<li>
						<div class="inp_wid"><i>*</i><input type="text" autocomplete="off" id="custName" name="custName" class="input" placeholder="이름 입력" title="이름 입력" maxlength="10" /></div>
					</li>
				</ul>		
			</div>
			<div class="form_list">
				<h3 class="cont_tit tit3">휴대폰정보</h3>
				<ul>
					<li>
						<div class="inp_wid wid3">
							<i>*</i>
							<select class="select" title="휴대폰 앞자리" id="phoneValid">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="tel" id="phone2" class="input" title="휴대폰 앞자리" maxlength="4" />
							<input type="tel" id="phone3" class="input" title="휴대폰 뒷자리" maxlength="4" />
						</div>								
					</li>
				</ul>	
			</div>
			
			<div class="form_list">
				<h3 class="cont_tit tit3">비번 찾기 질문</h3>
				<ul>
					<li>
						<div class="inp_wid"><i>*</i>
							<select class="select" title="비번 찾기 질문 선택" id="quiz">
<%
FindPassDAO dao = new FindPassDAO();
List<FindPassDTO> list = dao.selectList();
dao.close();
for(FindPassDTO record:list){
%>
								<option><%=record.getFindpass_ask() %></option><%} %>
								
							</select>
						</div>
					</li>
					<li>
						<div class="inp_wid"><i>*</i><input type="text" name="answer" id="answer" class="input" placeholder="비번 찾기 정답 입력" title="비번 찾기 정답 입력" maxlength="20" /></div>
					</li>
				</ul>
			</div>

			<div class="form_list">	
				<h3 class="cont_tit tit3">정보수신여부</h3>
				<p><label class="checkbox">
						<input type="checkbox" checked="checked" id="eventSmsCheck" data-target="eventSms" />
						<span class="lbl">이벤트/주문정보의 SMS 수신을 동의합니다.</span>
					</label>
				</p>
				<p class="mt10">
					<label class="checkbox">
						<input type="checkbox" checked="checked" id="eventEmailCheck" data-target="eventEmail" />
						<span class="lbl">이벤트/주문정보의 이메일 수신을 동의합니다. 정확한 정보를 입력해주세요.</span>
					</label>
				</p>
			</div>
			<p class="button_area btn2 mt30">
				<a href="javascript:void(0);" class="button h40 w200" id="joinProcess">확인</a>
				<a href="<c:url value='/member/joinAgree.whpr'/>" class="button h40 w200 btn_gray">취소</a>
			</p>
		</section>
		<!-- //contents -->
		
		<script type="text/javascript">
			
			// page parameter
			var PageParam = {};
			
			// page function
			var PageFunction = (function(pf) {
				
				// document ready
				pf.init = function() {};
				
				// 회원가입 
				pf.joinProcess = function() {
					var email = $('#emailValid').val() + "@" + $('#email2').val();
					var custPhone = $('#phoneValid').val() + $('#phone2').val() + $('#phone3').val();
					
					cntt.ajax.post(
						'/member/joinProcess',
						{
							emailValid : email,
							password : $('#password').val(),
							confirmPassword : $('#confirmPassword').val(),
							custName : $('#custName').val(),
							phoneValid : custPhone,
							eventSms : $('#eventSms').val(),
							eventEmail : $('#eventEmail').val(),
							email : email,
							custPhone : custPhone
						},
						function(response) {
							cntt.goPage("/member/joinSuccess");
						}
					);
					
					
				};
				
				// 이메일 변경
				pf.emailSelect = function() {
					var optionValue = $(this).val();
					if (optionValue == "DIRECT") {
						$('#email2').removeAttr('readonly').val("");
					} else {
						$('#email2').attr('readonly', 'true').val(optionValue);
					}
				};
				
				// 정보 수신 여부 변경 
				pf.eventInfoChange = function() {
					$('#' + $(this).data("target")).val($(this).is(':checked') ? 'Y' : 'N');
				};
				
				return pf;
			}(window.pf || {}));
			
			// 이벤트
			(function(){
					
				// 회원가입 버튼 클릭
				$('#joinProcess').click(function(){
					PageFunction.joinProcess();
				});
				
				// 이메일 셀렉트 박스 변경
				$('#emailSelectBox').change(function(){
					PageFunction.emailSelect.call(this);
				});
				
				// 정보 수신 여부 변경
				$('#eventSmsCheck, #eventEmailCheck').change(function(){
					PageFunction.eventInfoChange.call(this);
				});
				
			}());
		</script>
</html>
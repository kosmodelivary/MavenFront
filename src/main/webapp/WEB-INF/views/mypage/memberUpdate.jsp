<%@page import="com.bgk.delivery.service.FindPassDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bgk.delivery.impl.FindPassDAO"%>
<%@page import="com.bgk.delivery.service.MemberDTO"%>
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
		<li><strong>내 정보수정</strong></li>
	</ul>
	<div id="cont_tit">
		<h1>내 정보수정</h1>
	</div>
	<p class="bold f16 mb15">회원님의 정보 중 변경된 내용이 있는 경우, 아래에서 수정해주세요.</p>
	<form action="<c:url value='/mypage/update.whpr'/>" method="post">
		<div class="form_list">
			<h3 class="cont_tit tit3">회원정보변경</h3>
			<ul>
				<li>
					<div class="inp_wid wid2">
						<input type="text" class="input readonly" id="custName" readonly="readonly" maxlength="10" value='${dto.member_name }' />
					</div>
				</li>
				<li>
					<p>배달 시 사용되는 전화번호입니다. (변경 가능합니다.)</p>
					<div class="inp_wid wid4 mt5">
						<input style="width: 100%" type="tel" id="phone" class="input" title="휴대폰 번호 입력" maxlength="13" name="member_tel" placeholder="휴대폰 번호 하이픈(-)제외 숫자만 입력" value="${dto.member_tel }" />
					</div>
				</li>
				<li>
					<p>이벤트 시 연락하는 이메일 주소입니다. (고객님의 아이디로 변경이 안됩니다)</p>
					<div class="inp_wid mt5">
						<input type="text" class="input tooltip readonly" id="email" readonly="readonly" title="고객님의 아이디로 변경이 안됩니다" name="member_email" value="${dto.member_email }" />
					</div>
				</li>
			</ul>
		</div>
		<div class="form_list">
			<h3 class="cont_tit tit3">비번 찾기 질문</h3>
			<ul>
				<li>
					<div class="inp_wid">
						<i>*</i> <select class="select" title="비번 찾기 질문 선택" id="quiz" name="findpass_no">
<%
FindPassDAO dao = new FindPassDAO();
List<FindPassDTO> list = dao.selectList();
dao.close();
for(FindPassDTO record:list){
%>
							<option value="<%=record.getFindpass_no()%>" <%=record.getFindpass_no().equals(((MemberDTO)session.getAttribute("dto")).getFindpass_no())?"selected":"" %>>
							<%=record.getFindpass_ask() %>
							</option><%} %>
						</select>
					</div>
				</li>
				<li>
					<div class="inp_wid">
						<i>*</i> <input type="text" name="member_answer" id="answer" class="input" placeholder="비번 찾기 정답 입력" title="비번 찾기 정답 입력" maxlength="20" value="${dto.member_answer }" required />
					</div>
				</li>
			</ul>
		</div>
		<div class="form_list">
			<h3 class="cont_tit tit3">정보수신여부</h3>
			<p>
				<label class="checkbox">
				<input id="event_sms_checkbox" type="checkbox" data-target="eventSms" name="member_agreesms" ${dto.member_agreesms=="true"?"checked":"" } />
				<span class="lbl">이벤트/주문정보의 SMS 수신을 동의합니다.</span>
				</label>
			</p>
			<p class="mt10">
				<label class="checkbox"> <input id="event_email_checkbox" type="checkbox" data-target="eventEmail" name="member_agreeemail" ${dto.member_agreeemail=="true"?"checked":"" } />
				<span class="lbl">이벤트/주문정보의 이메일 수신을 동의합니다. 정확한 정보를 입력해주세요.</span>
				</label>
			</p>
		</div>
		<p class="button_area btn2 mt30">
			<input type="submit" class="button h40 w200" value="수정"> <a href="<c:url value='/mypage/mypage.whpr'/>" class="button h40 w200 btn_gray">취소</a>
		</p>
	</form>
</section>
<!-- //contents -->
<script>
$(function(){
	//전화번호 자동 하이픈 입력
	$("#phone").on("focus",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,''));
	});
	$("#phone").on("blur",function(){
		var num = $(this).val();
		num = num.replace(/[^0-9]/g,'');
		$(this).val(num);
		tmp = '';
		if(num.length==9){
			tmp = num.substr(0,2)+'-'+num.substr(2,3)+'-'+num.substr(5,4);
			$(this).val(tmp);
		}
		else if(num.length==10){
			tmp = num.substr(0,3)+'-'+num.substr(3,3)+'-'+num.substr(6,4);
			$(this).val(tmp);
		}
		else if(num.length==11){
			tmp = num.substr(0,3)+'-'+num.substr(3,4)+'-'+num.substr(7,4);
			$(this).val(tmp);
		}
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
		};

		// 회원 정보 수정
		pf.memberInfoUpdate = function() {
			var custPhone = $('#phoneValid').val() + $('#phone2').val() + $('#phone3').val();
			cntt.ajax.post('/mypage/memberUpdateProcess', {
				phoneValid : custPhone,
				email : $('#email').val(),
				custPhone : custPhone,
				eventSms : $('#eventSms').val(),
				eventEmail : $('#eventEmail').val(),
				custName : $('#custName').val()
			}, function() {
				cntt.goPage("/mypage");
			});
		};

		// 정보 수신 여부 변경 
		pf.eventInfoChange = function() {
			$('#' + $(this).data("target")).val($(this).is(':checked') ? 'Y' : 'N');
		};

		return pf;
	}(window.pf || {}));

	// 이벤트
	(function() {

		// 내 정보 수정 버튼
		$('#memberInfoUpdate').click(function() {
			PageFunction.memberInfoUpdate();
		});

		// 정보 수신 여부 변경
		$('#event_sms_checkbox, #event_email_checkbox').change(function() {
			PageFunction.eventInfoChange.call(this);
		});

	}());
</script>
<%@page import="com.bgk.delivery.service.FindPassDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bgk.delivery.impl.FindPassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
<script>
$(function(){
	//회원정보 유효성 검사
	$('form').validate({
		rules:{
			member_email:{required:true,email:true,
				remote:{
					url:"<c:url value='/member/idcheck.whpr'/>",
					type:"post",
					data:{
						username:function(){
							return $("#member_email").val();
						}}}},
			member_password:{required:true,minlength:8,maxlength:20},
			pass2:{required:true,equalTo:"#pass"},
			member_name:"required",
			member_tel:{required:true},
			member_answer:"required"
		},
		messages:{
			member_email:{required:"이메일주소를 입력하세요",email:"이메일주소를 올바르게 입력하세요",remote:"중복된 이메일주소입니다"},
			member_password:"비밀번호를 8~20자 입력하세요",
			pass2:{required:"비밀번호를 다시 입력하세요",equalTo:"비밀번호가 일치하지 않습니다"},
			member_name:"이름을 입력하세요",
			member_tel:"전화번호를 올바르게 입력하세요",
			member_answer:"정답을 입력하세요"
		}
	});
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
				<li><strong>회원가입</strong></li>
			</ul>
			<div id="cont_tit">
				<h1>BURGER KING 회원가입</h1>
			</div>			
							
			<div class="order_tit">
				<h2>정보입력</h2>
				<p><img src="../resources/images/member/step2.gif" alt="01약관동의, 02정보입력(현재위치), 03가입완료" /></p>
			</div>
			<form action="<c:url value='/member/proc.whpr'/>" >
			<input type="hidden" name="eventSms" id="eventSms" value="Y" />
			<input type="hidden" name="eventEmail" id="eventEmail" value="Y" />
			<div class="form_list noline">
				<h3 class="cont_tit tit3">정보입력</h3>
				<ul>
					<li>
						<div class="inp_wid inp_mail"><i>*</i>
							<input style="width:100%" type="text" autocomplete="off" class="input" id="emailValid" name="member_email" placeholder="이메일 주소 ID@example.com"/>
						</div>
						<label class="error" for="emailValid" style="display:none;color:red;font-weight:bold"></label>
					</li>
					<li>
						<div class="inp_wid"><i>*</i>
							<input type="password" name="member_password" id="pass" autocomplete="off" class="input" placeholder="비밀번호 영문,숫자 8~20자" title="비밀번호 입력" maxlength="20"/>
						</div>
						<label class="error" for="pass" style="display:none;color:red;font-weight:bold"></label>
					</li>
					<li>
						<div class="inp_wid"><i>*</i>
							<input type="password" name="pass2" id="pass2" autocomplete="off" class="input" placeholder="비밀번호 재입력" title="비밀번호 재입력" maxlength="20" />
						</div>
						<label class="error" for="pass2" style="display:none;color:red;font-weight:bold"></label>
					</li>
				</ul>					
			</div>
			<div class="form_list">
				<h3 class="cont_tit tit3">이름입력</h3>
				<ul>
					<li>
						<div class="inp_wid"><i>*</i>
							<input type="text" autocomplete="off" id="custName" name="member_name" class="input" placeholder="이름 입력" title="이름 입력" maxlength="10"/>
						</div>
						<label class="error" for="custName" style="display:none;color:red;font-weight:bold"></label>
					</li>
				</ul>		
			</div>
			<div class="form_list">
				<h3 class="cont_tit tit3">휴대폰정보</h3>
				<ul>
					<li>
						<div class="inp_wid wid3">
							<i>*</i>
							<input style="width:100%" type="tel" id="phone" class="input" title="휴대폰 번호 입력" maxlength="13" name="member_tel" placeholder="휴대폰 번호 하이픈(-)제외 숫자만 입력"/>
							<label class="error" for="phone" style="display:none;color:red;font-weight:bold"></label>
						</div>								
					</li>
				</ul>	
			</div>			
			<div class="form_list">
				<h3 class="cont_tit tit3">비번 찾기 질문</h3>
				<ul>
					<li>
						<div class="inp_wid"><i>*</i>
							<select class="select" title="비번 찾기 질문 선택" id="quiz" name="findpass_no">
<%
FindPassDAO dao = new FindPassDAO();
List<FindPassDTO> list = dao.selectList();
dao.close();
for(FindPassDTO record:list){
%>
								<option value="<%=record.getFindpass_no()%>"><%=record.getFindpass_ask() %></option><%} %>								
							</select>
						</div>
					</li>
					<li>
						<div class="inp_wid"><i>*</i>
						<input type="text" name="member_answer" id="answer" class="input" placeholder="비번 찾기 정답 입력" title="비번 찾기 정답 입력" maxlength="20" /></div>
						<label class="error" for="answer" style="display:none;color:red;font-weight:bold"></label>
					</li>
				</ul>
			</div>
			<div class="form_list">	
				<h3 class="cont_tit tit3">정보수신여부</h3>
				<p><label class="checkbox">
						<input type="checkbox" checked="checked" id="eventSmsCheck" data-target="eventSms" name="member_agreesms"/>
						<span class="lbl">이벤트/주문정보의 SMS 수신을 동의합니다.</span>
					</label>
				</p>
				<p class="mt10">
					<label class="checkbox">
						<input type="checkbox" checked="checked" id="eventEmailCheck" data-target="eventEmail" name="member_agreeemail"/>
						<span class="lbl">이벤트/주문정보의 이메일 수신을 동의합니다. 정확한 정보를 입력해주세요.</span>
					</label>
				</p>
			</div>
			<p class="button_area btn2 mt30">
				<input type="submit" class="button h40 w200" value="확인">
				<a href="<c:url value='/member/joinAgree.whpr'/>" class="button h40 w200 btn_gray">취소</a>
			</p>
			</form>
		</section>
		<!-- //contents -->
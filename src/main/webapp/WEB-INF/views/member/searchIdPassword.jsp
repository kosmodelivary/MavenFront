<%@page import="com.bgk.delivery.service.FindPassDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
				<li><a class="home" href="<c:url value='/home.whpr'/>">HOME</a></li>
				<li><span>버거킹 회원</span></li>
				<li><strong>아이디/비밀번호 찾기</strong></li>
			</ul>
			<div id="cont_tit">
				<h1>아이디/비밀번호 찾기</h1>
			</div>			
							
			<ul class="tabmenu ui-tabmenu" id="tab">
				<li><a href="#tab1" id="idTab">아이디 찾기</a></li>
				<li><a href="#tab2" id="passwordTab">비밀번호 찾기</a></li>
			</ul>
			
			<!-- 아이디 찾기 -->	
			<div id="tab1" class="tab_cont">
				<section class="boxStyle search_info">
					<h2 class="cont_tit tit3">가입시 사용한 핸드폰 번호로 아이디 찾기</h2>
					<form id="search" method="post" >
					<p class="inp_wid"><input type="text" class="input" name="member_name" size="35" id="idsearchCustName" placeholder="이름" title="이름 입력" maxlength="10" /></p>
					<div class="mt10">
						<p class="inp_wid wid3">
							<input style="width:100%" type="tel" id="phone" class="input" title="휴대폰 앞자리" maxlength="13" name="member_tel" placeholder="휴대폰 번호 하이픈(-)제외 숫자만 입력"/>
						</p>
					</div>
					
					<p class="button_area pt20">
						<input type="button" class="button h50 btn_gray" id="findId" value="아이디 찾기" data-toggle="modal" data-target="#myModal"/>
					</p>
					</form>
				</section>	

				<ul class="comment_list mt50">
					<li>회원님의 가입 시 입력한 이름과 휴대폰번호로 가입 시 입력한 아이디 정보를 찾을 수 있습니다.</li>
					<li>가입 시 입력한 비밀번호 찾기 질문과 답으로 비밀번호를 재설정할 수 있습니다.</li>
				</ul>
			</div>
		
			<!-- 비밀번호 찾기	 -->	
			<div id="tab2" class="tab_cont">
				<section class="find_pw boxStyle">
					<h2 class="cont_tit tit3">비밀번호 찾기 질문으로 비밀번호 재설정</h2>
					<form id="findpw" method="post">
					<div id="mail">
						<div class="find_mail">
							<div class="inp_wid"><input type="text" class="input" size="35" id="custName" name="member_name" placeholder="이름" title="이름 입력" maxlength="10" /></div>
							<div class="inp_wid inp_mail mt10">
								<input style="width:100%" type="text" autocomplete="off" class="input" id="emailValid" name="member_email" placeholder="이메일 주소 ID@example.com"/>
							</div>
							
			<div>
				<ul>
					<li>
						<div class="inp_wid mt10">
							<select class="select" title="비번 찾기 질문 선택" id="quiz">
<%
FindPassDAO dao = new FindPassDAO();
List<FindPassDTO> list=dao.selectList();
dao.close();
for(FindPassDTO record:list){
%>
								<option value="<%=record.getFindpass_no()%>"><%=record.getFindpass_ask() %></option><%} %>
							</select>
						</div>
					</li>
					<li>
						<div class="inp_wid mt10"><input type="text" name="member_answer" id="answer" class="input" placeholder="비번 찾기 정답 입력" title="비번 찾기 정답 입력" maxlength="20" /></div>
					</li>
				</ul>
			</div>
							<p class="button_area pt20">
								<input type="button" class="button h50 btn_gray" id="resetpass" value="비밀번호 재설정" data-toggle="modal" data-target="#myModal"/>
							</p>
						</div>
					</div>
					</form>
				</section>
						<ul class="comment_list mt50">
							<li>회원 가입 시 입력한 비밀번호 찾기 질문과 답으로 비밀번호를 재설정합니다.</li>
						</ul>
			</div>
		<!-- 아이디 찾기 결과 팝업창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <span id='find_msg'></span>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
		<!-- 비밀번호 재설정 팝업창 -->
<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <span id='find_pass'></span>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
		</section>
<script>
	$(function() {
		//전화번호 자동 하이픈 입력
		$("#phone").on("focus", function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ''));
		});
		$("#phone").on("blur",function() {
					var num = $(this).val();
					num = num.replace(/[^0-9]/g, '');
					$(this).val(num);
					tmp = '';
					if (num.length == 9) {
						tmp = num.substr(0, 2) + '-' + num.substr(2, 3) + '-'
								+ num.substr(5, 4);
						$(this).val(tmp);
					} else if (num.length == 10) {
						tmp = num.substr(0, 3) + '-' + num.substr(3, 3) + '-'
								+ num.substr(6, 4);
						$(this).val(tmp);
					} else if (num.length == 11) {
						tmp = num.substr(0, 3) + '-' + num.substr(3, 4) + '-'
								+ num.substr(7, 4);
						$(this).val(tmp);
					}
				});
		//아이디 찾기
		$('#findId').click(function() {
			$.ajax({
				url : '<c:url value="/member/searchID.whpr"/>',
				type : 'post',
				dataType : 'json',
				data : $('#search').serialize(),
				success : function(data){
					if(data!=null){
						$("#find_msg").html(data['find']);
						$("#myModal").dialog("open");
					}
					else {
						$("#find_msg").html("입력하신 정보로 회원을 조회할 수 없습니다");
						$("#myModal").dialog("open");
					}
				}
			});
		});
		//비밀번호 찾기
		$('#resetpass').click(function() {
			$.ajax({
				url : '<c:url value="/member/searchPW.whpr"/>',
				type : 'post',
				dataType : 'json',
				data : $('#findpw').serialize(),
				success : function(data){
					if(data!=null){
						$("#passModal").dialog("open");
					}
					else {
						$("#find_pass").html("입력하신 정보로 회원을 조회할 수 없습니다");
						$("#passModal").dialog("open");
					}
				}
			});
		});
	     $("#myModal").dialog({
	         autoOpen: false,
	         modal: true,
	         title: "아이디 찾기"
	     });
	     $("#passModal").dialog({
	         autoOpen: false,
	         modal: true,
	         title: "비밀번호 재설정"
	     });
	})
</script>
<!-- Mirrored from delivery.burgerking.co.kr/member/searchIdPassword by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Jan 2018 10:07:27 GMT -->
</html>
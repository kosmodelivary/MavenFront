<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--[if lt IE 8]> <html class="lt-ie10 lt-ie9 lt-ie8" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie10 lt-ie9" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 9]>    <html class="lt-ie10" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="ko"> <!--<![endif]-->

	<head>

	<meta charset="utf-8" />
	<title>버거킹 딜리버리</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Expires" content="-1" /> 
	<meta http-equiv="Pragma" content="no-cache" /> 
	<meta http-equiv="Cache-Control" content="No-Cache" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<meta name="keywords" content="버거킹 딜리버리" />
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico" />
	<link rel="stylesheet" media="all" href="/resources/css/common-24458f8a0e01376c781a67dc53f89b32.css" />
	<link rel="stylesheet" media="all" href="/resources/css/contents-b5d34c340fe4dec196cacca755c0b45f.css" />
	<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/resources/css/ie.css" />
	<![endif]-->
	
	<script type="text/javascript" src="/resources/js/lib/jquery-1.12.4.min-4f252523d4af0b478c810c2547a63e19.js"></script>
	<script type="text/javascript" src="/resources/js/lib/jquery-migrate-1.4.1.min-7121994eec5320fbe6586463bf9651c2.js"></script>
	<script type="text/javascript" src="/resources/js/lib/jquery-ui-1.11.4.min-d935d506ae9c8dd9e0f96706fbb91f65.js"></script>
	<script type="text/javascript" src="/resources/js/lib/modernizr-2.8.3.min-65f1d21d5fcc9d21da758adababd0c3c.js"></script>
	<!--[if lt IE 9]>
		<script src="/resources/js/lib/html5shiv-3.7.3.js"></script>
	<![endif]-->
	<script type="text/javascript" src="/resources/js/plugins-fc3d87aa7fbbb2aaf27be96df8e2bf72.js"></script>
	<script type="text/javascript" src="/resources/js/ui_script-4989f16677aea2bebdb95d1292bf59a0.js"></script>
	
	<script src="/resources/js/cntt-0f738f0aa2f2d3caa2e57a76a8bfc873.js"></script>
	
	<!-- 사용자 스크립트 영역 -->
	
</head>
	
	<body>
		<div id="skipNavi">
			<a href="#container">본문 바로가기</a>
			<a href="#gnb">주메뉴 바로가기</a>
			<a href="#footer">사이트정보 바로가기</a>
		</div>
		
		<div id="wrap">
			<header id="header">
		<h1 id="logo"><a href="/">버거킹</a></h1>
		<div class="btn_gnb"><a href="#"><i></i><span>메뉴</span></a></div>
		<div class="gnb_wrap">
			<div class="head_util">
				<div class="inner"> 
					<ul>
					
					
						<!-- 로그인 전 -->
						<li><a href="/member/login">로그인</a></li>	
						<li><a href="/member/joinAgree">회원가입</a></li>
						<!-- <li><a href="#none">주문확인</a></li>		 -->
							
					</ul>
				</div>
			</div>	
		
		
			<div class="inner">
				<nav id="gnb">
					<ul>
						<li class="gnb01"><a href="/order/memberOrder">ORDER</a></li>
						<li class="gnb02"><a href="/menu/SpecialOffer" class="in_sub">MENU</a>
							<ul id="menuClass">
								
								<li><a href="https://www.burgerking.co.kr/nutrition" target="_blank">영양정보</a></li>
								<!-- <li><a href="#">스페셜오퍼</a></li>
								<li><a href="#">세트메뉴</a></li>
								<li><a href="#">버거</a></li>
								<li><a href="#">사이드</a></li>
								<li><a href="#">드링크</a></li>
								<li><a href="#">영양정보</a></li> -->
							</ul>
						</li>
						<li class="gnb03"><a href="/store/search" class="in_sub">STORE</a>
							<ul>
								<li><a href="/store/search">배달매장찾기</a></li>
							</ul>
						</li>
						<li class="gnb05"><a href="/customer/faqList" class="in_sub">FAQ</a>
							<ul>
								<li><a href="/customer/faqList">FQA</a></li>
								<li><a href="/customer/noticeList">공지사항</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="head_call">
					<img class="w_img" src="/resources/images/common/head_call.png" alt="집에서 만나는 버거킹 1599-0505" />
					<a href="tel:1599-0505" class="m_img"><img src="/resources/images/main/main_call.png" alt="집에서 만나는 버거킹 1599-0505" /></a>
				</div>
			</div>
		</div>
		
		<!-- 장바구니, 결제페이지는 장바구니 표시하지 않음 -->
		
			<section class="cart_box" id="headerCart">
		
		<a class="cart_btn" href="#"><i></i><span>장바구니</span><strong>0</strong></a>
		
		
	</section>
		
		
		<div class="gnb_bg"></div>
		<script>
			var headerObj = {};
			
			var headerFunc = (function(hf) {
				
				hf.init = function() {
					
					// 모바일 화면일 때 GNB 메뉴 로드
					if($(".btn_gnb").css('display') == "block") {
						$('#menuClass').getLoad('/menu/getHeaderMenuClass');
					}
					
					// 헤더 장바구니 갱신
					this.loadHeaderCart();
				};
				
				// 로그아웃 처리
				hf.logoutProcess = function() {
					cntt.ajax.get(
						'/member/logoutProcess',
						function (response) {
							cntt.goPage("/");
						}
					);
				};
				
				// 헤더 장바구니 갱신
				hf.loadHeaderCart = function(open){
					$('#headerCart').getLoad('/common/headerCart', function(){
						if(open == 'Y')
							$('.cart_btn').click();
					});
				}
				
				// 장바구니 제품 삭제
				hf.deleteProduct = function(groupNo) {
					cntt.ajax.post(
						'/cart/deleteProduct',
						{
							groupNoList : [groupNo]
						},
						function (response) {
							if(response){
								headerFunc.loadHeaderCart('Y'); //장바구니 갱신
							}
						}
					);
				}
				
				return hf;
			}(window.hf || {}));
			
			// 이벤트
			$(function(){
				headerFunc.init();
				
				// 로그아웃 버튼 클릭
				$('#logout_Btn').on('click', function(event){
					headerFunc.logoutProcess();
				});
				
			}());
		</script>
	</header>
			
			<div id="container">
		<!-- lnb -->
		<aside id="lnb">
		<h1><img src="/resources/images/common/tit_mypage.png" alt="마이페이지" /></h1>
		<nav>
			<ul>
				<li><a href="/mypage/memberUpdate">내 정보수정</a></li>
				<li><a href="/mypage">내 주문내역</a></li>
				<li><a href="/mypage/passwordUpdate">비밀번호 변경</a></li>
				<li><a href="/mypage/memberWithdraw">회원탈퇴</a></li>
			</ul>
		</nav>
	</aside>
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">
			<ul id="location">
				<li><a class="home" href="/">HOME</a></li>
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
				<a href="/" class="button h40 w200 gray">버거킹 홈</a>
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
				return pf;
			}(window.pf || {}));
			
			// 이벤트
			(function(){}());
		</script>
	</div>
			
			<div></div>
			
			<footer id="footer">			
		<div class="foot_util">
			<div class="inner">
				<ul>
					<li><a href="/customer/faqList">FAQ</a></li>
					<li><a href="/etc/terms">이용약관</a></li>
					<li><a href="/etc/privacy">개인정보처리방침</a></li>
					<li><a href="/common/siteMap">사이트맵</a></li>
					<li><a href="/customer/noticeList">공지사항</a></li>
					<!-- <li><a href="#">사이버상담실</a></li> -->
					<!-- <li><a href="#">법적고지</a></li> -->
					<!-- <li><a href="#">브랜드사이트</a></li> -->
				</ul>
			</div>
		</div>
		<div class="inner">
			<div class="copyright">	
				<p><strong>Copyright 2012 BKR Co., Ltd. All right Reserved</strong></p>
				<p><span>(주)BKR</span> <span>대표이사 문영주</span> <span>사업자 등록번호 101-86-76277</span> <span>서울 종로구 삼봉로 71 G 타워 2층</span> <span>주식회사 비케이알</span></p>
				<p><span>TEL 02-6331-8282</span> <span>FAX 02-3775-4325</span></p>
			</div>
		</div>
		
		<!-- 공통 안내 레이어 팝업 -->
		<div id="popAlert" class="pop_bg">
	<article class="pop_wrap">
		<header class="pop_head">			
			<h1>안내</h1>
		</header>
		<section class="pop_cont">
			<div>
				<div class="pt10 pb10 t_center">
					<p class="f14" id="alert_msg"></p> 
				</div>
				<p class="button_area mt10">
					<a href="#" class="pop_close button btn_org w120">확인</a>
				</p>
			</div>
		</section>
		<footer class="pop_foot">
			<a href="#" class="pop_close">팝업 닫기</a>
		</footer>
	</article>
</div>
		
	</footer>
			
		</div>
	</body>
</html>
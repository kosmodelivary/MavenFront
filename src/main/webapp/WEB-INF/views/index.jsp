<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 8]> <html class="lt-ie10 lt-ie9 lt-ie8" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie10 lt-ie9" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if IE 9]>    <html class="lt-ie10" lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"> <![endif]-->
<!--[if gt IE 9]><!-->
<html lang="ko">
<!--<![endif]-->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta charset="utf-8" />
<title>버거킹 딜리버리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="keywords" content="버거킹 딜리버리" />
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/common.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/contents.css'/>" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/resources/css/ie.css" />
	<![endif]-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-1.12.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-migrate-1.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-ui-1.11.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/modernizr-2.8.3.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/ui_script.js'/>"></script>
<script src="<c:url value='/resources/js/cntt.js'/>"></script>
<script>
	$(document).ready(function(){
		$.ajax({
			url:'<c:url value="/menu/getIndexMenu.whpr"/>',
			type:'get',
			dataType:'json',
			success:function(data,target){
				successAjax(data,'.menu_list');
			},
			error:function(request,error){
					console.log("code:"+request.status+"\n");
					console.log("서버로부터 받은 데이타"+request.responseText+"\n");
					console.log("error:"+error+"\n");								
		   }
		});
	});
	
	function successAjax(data,target){
		var str = "";
		$(target).html('');
		$.each(data, function(i, val) {
			str +=
				'<li><a class="openDetailPopup" href="#">'+
						'<figure>'+
							'<img src="http://restapi.fs.ncloud.com/bkproject/image/menu/'+val.menu_name+val.menu_file_extension+'" alt="'+val.menu_name+'" />'+
							'<figcaption>'+
								'<span class="tit">'+val.menu_name+'</span> <strong>'+val.menu_price+'</strong>'+
							'</figcaption>'+
						'</figure> <i></i>'+
				'</a>'+
				'<div class="list_cont">'+
					'<a class="btn_cart addProduct" href="<c:url value="/cart/cartInsert.whpr?menu_no='+val.menu_no+'&amount=1"/>"><span>담기</span></a>'+
					'<a class="btn_view openDetailPopup" href="javascript:menu_view('+val.menu_no+')"><span>상세보기</span></a>'+
				'</div></li>';
		});
		$(target).html(str);
	};
</script>
<!--[if lt IE 9]>
		<script src="/resources/js/lib/html5shiv-3.7.3.js"></script>
	<![endif]-->


<!-- 사용자 스크립트 영역 -->

</head>
<body>
	<div id="skipNavi">
		<a href="#container">본문 바로가기</a> <a href="#gnb">주메뉴 바로가기</a> <a href="#footer">사이트정보 바로가기</a>
	</div>
	<div id="wrap" class="main">
		<jsp:include page="/WEB-INF/views/template/top.jsp"/>
		<div id="container">
<!-- contents -->
<section id="contents">
	<!-- main_banner -->
	<div class="main_banner">
		<div class="swiper-container">
			<ul class="swiper-wrapper">
				<li class="swiper-slide" style="background-image: url(files/main/0102_1_1600x400_B.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/menu/All.whpr'/>">
						<img class="w_img" src="files/main/0102_1_1600x400_P.png" alt="0102_1_1600x400_P.png" />
						<img class="m_img" src="files/main/0102_M_640x440.jpg" alt="0102_M_640x440.jpg" />
						</a>
					</div>
				</li>
				<li class="swiper-slide" style="background-image: url(files/main/LTO_1_1600x400_B.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/menu/All.whpr'/>">
						<img class="w_img" src="files/main/LTO_1_1600x400_P.png" alt="LTO_1_1600x400_P.png" />
						<img class="m_img" src="files/main/LTO_1_640x440.jpg" alt="LTO_1_640x440.jpg" />
						</a>
					</div>
				</li>
				<li class="swiper-slide" style="background-image: url(files/main/LTO_2_1600x400_B.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/menu/All.whpr'/>">
						<img class="w_img" src="files/main/LTO_2_1600x400_p.png" alt="LTO_2_1600x400_p.png" />
						<img class="m_img" src="files/main/LTO_2640x440.jpg" alt="LTO_2640x440.jpg" />
						</a>
					</div>
				</li>
				<li class="swiper-slide" style="background-image: url(files/main/LTO1_1600x400_b.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/menu/All.whpr'/>">
						<img class="w_img" src="files/main/LTO1_1047x400_p.png" alt="LTO1_1047x400_p.png" />
						<img class="m_img" src="files/main/LTO_m_640x440.jpg" alt="LTO_m_640x440.jpg" />
						</a>
					</div>
				</li>
				<li class="swiper-slide"
					style="background-image: url(files/main/LTO2_1600x400_b.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/menu/All.whpr'/>">
						<img class="w_img" src="files/main/LTO2_p.png" alt="LTO2_p.png" />
						<img class="m_img" src="files/main/LTO_m2_640x440.jpg" alt="LTO_m2_640x440.jpg" />
						</a>
					</div>
				</li>
				<li class="swiper-slide"
					style="background-image: url(files/main/main_bn_08_bg.jpg);">
					<div class="inner">
						<a href="javascript:void(0);" class="bannerLink" data-link="<c:url value='/customer/noticeList.whpr'/>">
						<img class="w_img" src="files/main/main_bn_contents_08.png" alt="main_bn_contents_08.png" />
						<img class="m_img" src="files/main/m_main_bn_08.jpg" alt="m_main_bn_08.jpg" />
						</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="navi">
			<button class="btn btn_prev">이전</button>
			<button class="btn btn_next">다음</button>
			<div class="pagination"></div>
		</div>
	</div>

	<div class="inner">
		<div class="main_best">
			<h2 class="main_tit">
				<span>Best Seller</span>
			</h2>
			<ul class="menu_list">
				
			</ul>
			<script>
				$(function(){
					$('.menu_list').trigger("create");
				});
			</script>
		</div>
	</div>
	<!-- 자세히 보기 -->
	<div id="popMenuDetail" class="menu_view_wrap">
		
	</div>
	<!-- //자세히 보기 -->
</section>
<!-- 시작] 기웅 캐러셀과 캐러셀에 건 링크, 버거 링크에 관련된 jquery 180205 -->
<!-- //contents -->
<script type="text/javascript">
			// page parameter
			var PageParam = {};
			// page function
			var PageFunction = (function(pf) {
				// document ready
				pf.init = function() {
					//<![CDATA[  
					// 퍼블리싱 start
					//메인배너
					if ($('.main_banner li').length > 1) {
						$('.main_banner .w_img').css({
							'opacity' : 0
						});
						var mainBanner = $('.main_banner .swiper-container')
								.swiper(
										{
											pagination : '.main_banner .pagination',
											calculateHeight : true,
											autoplay : 5000,
											speed : 600,
											paginationClickable : true,
											loop : true,
											onFirstInit : function() {
												$('.main_banner .w_img')
														.stop().animate({
															'opacity' : 1
														}, 1000);
											},
											onSlideChangeStart : function() {
												$('.main_banner .w_img')
														.stop().css({
															'opacity' : 0
														});
											},
											onSlideChangeEnd : function() {
												$('.main_banner .w_img')
														.stop().animate({
															'opacity' : 1
														}, 1000);
											}
										});
						$('.main_banner .btn_prev').click(function() {
							mainBanner.swipePrev();
						});

						$('.main_banner .btn_next').click(function() {
							mainBanner.swipeNext();
						});

					}
					// 퍼블리싱 end
					//제품 상세보기 팝업
					/* 
					pf.openDetailPopup = function() {
						var pCode = $(this).data('pcode');
						$('#popMenuDetail').getLoad('/menu/getMenuDetail?pCode=' + pCode, function(){
							PopupFunction.init();
							menuOpen();
						});
					}; 
					 */
					pf.openDetailPopup = function(pCode) {
						$('#popMenuDetail').getLoad(
								'/menu/getMenuDetail?pCode=' + pCode,
								function() {
									PopupFunction.init();
									menuOpen();
								});
					};
					// 배너 링크
					pf.bannerLink = function() {
						var bannerLink = $(this).data('link');
						cntt.goPage(bannerLink);
						/*var indexResult = bannerLink.indexOf('http');
						if (indexResult == -1) {
							cntt.goPage(bannerLink);
						} else {
							window.open(bannerLink);							
						}*/
					};
					//]]>
				};
				return pf;
			}(window.pf || {}));
			// 이벤트
			(function() {
				/* 
				// 담기 버튼
				$('.addProduct').click(function(){
					PopupFunction.addProduct($(this).data('pcode'), 1);
				});
				// 상세보기
				$('.openDetailPopup').click(function(){
					PageFunction.openDetailPopup.call(this);
				}); 
				 */
				// 배너 클릭
				$('.main_banner').on('click', '.bannerLink', function() {
					PageFunction.bannerLink.call(this);
				});
			}());
		</script>
		</div>
		<div></div>
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
	</div>
</body>
</html>
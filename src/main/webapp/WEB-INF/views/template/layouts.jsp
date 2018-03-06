<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="keywords" content="버거킹 딜리버리" />
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/resources/images/favicon.ico'/>" />
<link rel="stylesheet" media="all"
	href="<c:url value='/resources/css/common.css'/>" />
<link rel="stylesheet" media="all"
	href="<c:url value='/resources/css/contents.css'/>" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/resources/css/ie.css" />
	<![endif]-->

<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-1.12.4.min-4f252523d4af0b478c810c2547a63e19.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-migrate-1.4.1.min-7121994eec5320fbe6586463bf9651c2.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/jquery-ui-1.11.4.min-d935d506ae9c8dd9e0f96706fbb91f65.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/lib/modernizr-2.8.3.min-65f1d21d5fcc9d21da758adababd0c3c.js'/>"></script>
<!--[if lt IE 9]>
		<script src="/resources/js/lib/html5shiv-3.7.3.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="<c:url value='/resources/js/plugins-fc3d87aa7fbbb2aaf27be96df8e2bf72.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/ui_script-9cf17ca67bee4a6db48a6ab65194e497.js'/>"></script>

<script
	src="<c:url value='/resources/js/cntt-0f738f0aa2f2d3caa2e57a76a8bfc873.js'/>"></script>

<!-- 사용자 스크립트 영역 -->

</head>
<body>
	<div id="skipNavi">
		<a href="#container">본문 바로가기</a> <a href="#gnb">주메뉴 바로가기</a> <a href="#footer">사이트정보 바로가기</a>
	</div>
	<div id="wrap">
		<tiles:insertAttribute name="top"/>
		<div id="container">
			<tiles:insertAttribute name="body"/>
		</div>
		<div></div>
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>
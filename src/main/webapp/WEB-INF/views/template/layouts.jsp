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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="keywords" content="버거킹 딜리버리" />
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/common.css'/>" />
<link rel="stylesheet" media="all" href="<c:url value='/resources/css/contents.css'/>" />

<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-1.12.4.min.js'/>"></script>

<!-- validate -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>

<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-migrate-1.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-ui-1.11.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/modernizr-2.8.3.min.js'/>"></script>

<!--[if lt IE 9]>
		<script src="/resources/js/lib/html5shiv-3.7.3.js"></script>
	<![endif]-->
	
<script type="text/javascript" src="<c:url value='/resources/js/plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/ui_script.js'/>"></script>

<script src="<c:url value='/resources/js/cntt.js'/>"></script>

<!-- 사용자 스크립트 영역 -->

</head>
<body style=" overflow-y:scroll;">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty sessionScope.dto }">
	<script>
		alert("로그인이 필요합니다");
		location.replace("<c:url value='/member/login.whpr'/>");	
	</script>
</c:if>
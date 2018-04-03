<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${mmb == 'edit' }">
		<c:set var="SUC_MSG" value="회원정보수정이 완료되었습니다"/>
		<c:set var="FAIL_MSG" value="회원정보수정이 실패하였습니다"/>
		<c:set var="SUC_URL" value="/member/loginProc.whpr"/>
	</c:when>
	<c:when test="${mmb == 'pass' }">
		<c:set var="SUC_MSG" value="비밀번호 변경이 완료되었습니다"/>
		<c:set var="FAIL_MSG" value="비밀번호 변경에 실패하였습니다"/>
		<c:set var="SUC_URL" value="/member/loginProc.whpr"/>
	</c:when>
	<c:otherwise>
		<c:set var="SUC_MSG" value="회원가입이 완료되었습니다"/>
		<c:set var="FAIL_MSG" value="회원가입에 실패하였습니다"/>
		<c:set var="SUC_URL" value="/member/joinSuccess.whpr"/>
	</c:otherwise>
</c:choose>
<script>
	<c:choose>
		<c:when test="${suc_fail == 1 }">
			alert("${SUC_MSG}");
			location.href="<c:url value='${SUC_URL}'/>";
		</c:when>
		<c:when test="${suc_fail == 0 }">
			alert("${FAIL_MSG}");
			history.back();
		</c:when>
	</c:choose>
</script>
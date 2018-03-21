<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	<c:choose>
		<c:when test="${suc_fail == 1 }">
			location.href="<jsp:forward page='/member/joinSuccess.whpr'/>";
		</c:when>
		<c:when test="${suc_fail == 0 }">
			alert("회원가입에 실패하였습니다");
			history.back();
		</c:when>
	</c:choose>
</script>

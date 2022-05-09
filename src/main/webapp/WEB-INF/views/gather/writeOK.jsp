<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0}">
	<script>
		alret("🟢 글이 등록되었습니다.");
		location.href="/gather/gatherList";
	</script>
</c:if>
<c:if test="${cnt==null || cnt==0}">
</c:if>
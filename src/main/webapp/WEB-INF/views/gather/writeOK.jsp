<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0}">
	<script>
		alert("🟢 글이 등록되었습니다.");
		location.href="/gather/gatherList";
	</script>
</c:if>
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("🚫 글 등록에 실패했습니다.");
		history.go(-1);
	</script>
</c:if>
<div>
	안녕ㅎ너ㅐ마나ㅐㄹㅈ대ㅜㅈ대루ㅑㅈ두ㅑㅐㅜ대룾대루ㅑㅐㅜ
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${cnt>0}">
	<script>
		alert("π’ κΈμ΄ λ±λ‘λμμ΅λλ€.");
		location.href="/gather/gatherList";
	</script>
</c:if>
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("π« κΈ λ±λ‘μ μ€ν¨νμ΅λλ€.");
		history.go(-1);
	</script>
</c:if>

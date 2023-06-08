<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="kopo17.domain.*" %> <!-- 도메인 임포트 -->
<!DOCTYPE html>
<html>
	<head>
		<%
			int id = 0; // 아이디 변수 초기화
			if (request.getParameter("id") != null){ // 아이디 파라미터가 비어있지 않다면
				id = Integer.parseInt(request.getParameter("id")); //대입
			}
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl(); // 클래스 객체 선언
			String res = marketItemDao.deleteOne(id); // 레코드 삭제 메서드 호출
		%>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<title>글 지우기</title>
	</head>
	<body>
		<%=res %>
		<br>
		<button onclick="location.href='./SelectAll.jsp'">목록</button> <!-- 전체 목록으로 돌아가기 버튼 -->
	</body>
</html>
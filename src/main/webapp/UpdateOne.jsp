<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %>
<% request.setCharacterEncoding("utf-8"); %> <!-- 파라미터 인코딩 -->

<!DOCTYPE html>
<html>
	<head>
		<%
			
			int id = 0;
			if (request.getParameter("id") != null) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			
			int count = 0; // 숫자 세기 변수
			if (request.getParameter("count") != null) { // 숫자세는 편수 파라미터로 받아오기
				count = Integer.parseInt(request.getParameter("count"));
			}	
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl();// 클래스 객체 선언
			String res = marketItemDao.updateOne(id, count); // 업데이트 메서드 호출
			
		%>
		<title>글 수정 하기</title>
	</head>
	<body>
		<%=res %><!--  결과 안내문 출력 -->
		<br>
		<button onclick="location.href='./InputModForm.jsp?id=<%=id %>'">다시 쓰기</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectOne.jsp?id=<%=id %>'">글 보기</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectAll.jsp'">글 목록</button> <!-- 글 목록 보기 버튼 -->
	</body>
</html>
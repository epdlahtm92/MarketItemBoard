<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 파라미터 인코딩 -->

<!DOCTYPE html>
<html>
	<head>
		<%
			String name = null;
			if (request.getParameter("name") != null) {
				name = request.getParameter("name");
			}
			
			int count = 0;
			if (request.getParameter("count") != null) {
				count = Integer.parseInt(request.getParameter("count"));
			}
			
			String info = null;
			if (request.getParameter("info") != null) {
				info = request.getParameter("info");
			}
			
			String pic_addr = null;
			if (request.getParameter("pic_addr") != null) {
				pic_addr = request.getParameter("pic_addr");
			}
			
			int id = 0;
			if (request.getParameter("id") != null) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl();
			String[] res = marketItemDao.insertNewOne(id, name, count, info, pic_addr);
		%>
		<title>새 글 쓰기</title>
	</head>
	<body>
		<%=res[0] %>
		<br>
		<% if (res[1].equals("-1")) { %>
			<button onclick="location.href='./InputNewFormWithFile.jsp'">다른 상품 등록</button> <!-- 돌아가기버튼 -->
			<button onclick="location.href='./InputNewFormWithFile.jsp'">재입력</button> <!-- 돌아가기버튼 -->
			<button onclick="location.href='./SelectAll.jsp'">전체 상품 보기</button> <!-- 글 목록 보기 버튼 -->
		<% } else { %>
		<button onclick="location.href='./InputNewFormWithFile.jsp'">다른 상품 등록</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./InputNewFormWithFile.jsp'">재입력</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectOne.jsp?id=<%=res[1] %>'">등록 상품 보기</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectAll.jsp'">전체 상품 보기</button> <!-- 글 목록 보기 버튼 -->
		<%} %>
	</body>
</html>
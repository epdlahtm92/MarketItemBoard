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
			
			int product_code = 0;
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl();
			String[] res = marketItemDao.insertNewOne(name, count, info, pic_addr, product_code);
		%>
		<title>새 글 쓰기</title>
	</head>
	<body>
		<%=res[0] %>
		<br>
		<button onclick="location.href='./InputNewFormWithFile.jsp'">다른 상품 등록</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./InputModForm.jsp'">상품 재등록</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectOne.jsp?id=<%=res[1] %>'">글 보기</button> <!-- 돌아가기버튼 -->
		<button onclick="location.href='./SelectAll.jsp'">글 목록</button> <!-- 글 목록 보기 버튼 -->
	</body>
</html>
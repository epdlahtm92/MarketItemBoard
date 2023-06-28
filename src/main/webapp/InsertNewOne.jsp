<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.*"%>
<% request.setCharacterEncoding("utf-8"); %> <!-- 파라미터 인코딩 -->

<!DOCTYPE html>
<html>
	<head>
		<%
			String path = "/upload";//저장하는 폴더 위치
			String savePath = request.getServletContext().getRealPath(path);//컴퓨터 저장 위치
			int maxSize = 1024 * 1024 * 1024; //1기가 넘으면 예외발생
			String encodingType = "utf-8";
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encodingType, new DefaultFileRenamePolicy());
		
			String name = ""; // 변수 초기화
			if (multi.getParameter("name") != null) { // 파라미터 대입
				name = multi.getParameter("name");
			}
			
			int count = 0; // 변수 초기화
			if (multi.getParameter("count") != null) {// 파라미터 대입
				count = Integer.parseInt(multi.getParameter("count"));
			}
			
			String info = ""; // 변수 초기화
			if (multi.getParameter("info") != null) {// 파라미터 대입
				info = multi.getParameter("info");
			}
			
			String pic_addr = null; // 변수 초기화
			pic_addr = multi.getFilesystemName("pic_addr");
			//if (multi.getFilesystemName("pic_addr") != null) {// 파라미터 대입
			//	pic_addr = multi.getFilesystemName("pic_addr");
			//}
		
			
			long id = 0; // 변수 초기화
			if (multi.getParameter("id") != null) {// 파라미터 대입
				id = Long.parseLong(multi.getParameter("id"));
			}
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl(); // 클래스 객체 선언
			String[] res = marketItemDao.insertNewOne(id, name, count, info, pic_addr); //새 레코드 넣는 메소드 호출
		%>
		<title>새 글 쓰기</title>
	</head>
	<body>
		<%=res[0] %> <!--  결과 출력 -->
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
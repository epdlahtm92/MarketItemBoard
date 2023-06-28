<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="kopo17.domain.*" %><!-- 도메인 임포트 -->
<%@ page import="kopo17.service.*" %> <!-- 서비스 임포트 -->
<%@ page import="kopo17.dto.*" %> <!-- dto 임포트 -->

<%@ page import="java.util.List" %> <!-- 리스트 임포트 -->
<%@ page import="java.util.ArrayList" %> <!-- 어레이 리스트 임포트 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 파라미터 인코딩 -->
<!DOCTYPE html>
<html>
	<head>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<%
			MarketItemDao marketItemDao = new MarketItemDaoImpl(); // dao 클래스 객체 선언
			MarketItemService marketItemService = new MarketItemServiceImpl();
			List<MarketItem> selectAllList = marketItemDao.selectAll(); // 전체조회 메서드 호출
			
			int pages = 0; // 페이지 변수
			if (request.getParameter("page") != null) { // 페이지 변수 파라미터 값으로 받기
				pages = Integer.parseInt(request.getParameter("page")); // 페이지 변수 대입
			}
			
			int countPerPage = 10; // 페이지당 레코드 개수 변수
			if (request.getParameter("countPerPage") != null) { // 파라미터로 받기
				countPerPage = Integer.parseInt(request.getParameter("countPerPage")); // 받은 값 대입
			}
			
			Pagination pagination = marketItemService.getPagination(pages, countPerPage); // 페이지 네이션 계산
			
		%>
		<title>게시판 전체 보기</title>
	</head>
	<body>
		<table>
			<thead>
				<tr><td>상품코드</td><td>상품명</td><td>재고 수량</td><td>재고 파악일</td><td>상품 등록일</td></tr> <!-- 테이블 헤드 설정 -->
			</thead>
			<tbody>
				<%
					int count = 0;
					for(MarketItem marketItem: selectAllList){ // 반복하면서
						
						String cutTitle = marketItem.getName();
						if(cutTitle.length() > 20){
							cutTitle = marketItem.getName().substring(0, 20) + "...";
						} 
						
						if (count >= ((pagination.getC() - 1) * countPerPage) && count < (pagination.getC() * countPerPage)){
							out.println("<td width=150 style='word-break:break-all;'><a href='./SelectOne.jsp?id=" + marketItem.getId() + "'>" + marketItem.getId() + "</a></td>"); //상품 아이디
							out.println("<td width=300 style='word-break:break-all;'><a href='./SelectOne.jsp?id=" + marketItem.getId() + "'>" + cutTitle + "</a></td>"); // 상품이름	
							out.println("<td>" + marketItem.getCount() + "</td>"); // 개수 표 안에 출력
							out.println("<td>" + marketItem.getStock_date() + "</td>"); // 재고 등록일자 표 안에 출력
							out.println("<td>" + marketItem.getRecord_date() + "</td></tr>"); // 작성일자 표 안에 출력
							count++;
						} else {
							count++;
						}
					}
				%>
			</tbody>
		</table>
		<div>
			<%
				if(pagination.getPp() == -1 || pagination.getP() == -1){ // 앞으로 가는 버튼 안나오는 조건
				} else {
					out.println("<a href='./SelectAll.jsp?page=" + pagination.getPp() + "'>&lt;&lt;</a>"); // 맨앞버든
					out.println("<a href='./SelectAll.jsp?page=" + pagination.getP() + "'>&lt;</a>"); //앞 버튼
				}
			
				for (int i = pagination.getS(); i <= pagination.getE(); i++) { // 페이지 탭 반복하여 찍기
					if (pagination.getC() == i){ // 현재 페이지 조건
						out.println("<a style='font-size:1.2em; font-weight:bold; color:#F25022;' href='./SelectAll.jsp?page=" + i + "&countPerPage=" + countPerPage + "'>" + i + "</a>");
						//현재페이지 하이라이트
					} else {
						out.println("<a href='./SelectAll.jsp?page=" + i + "&countPerPage=" + countPerPage + "'>" + i + "</a>");
						//나머지 페이지
					}
				}
				
				if (pagination.getNn() == -1 || pagination.getN() == -1){ // 다음 및 마지막 탭 안나오는 조건
				} else {
					out.println("<a href='./SelectAll.jsp?page=" + pagination.getN() + "'>&gt;</a>"); // 다음 탭 출력
					out.println("<a href='./SelectAll.jsp?page=" + pagination.getNn() + "'>&gt;&gt;</a>"); //마지막 탭 출력
				}
			%>
		</div>
		<div><button onclick="location.href='./InputNewFormWithFile.jsp'">새 글</button></div> <!-- 새글 쓰기 버튼 -->
	</body>
</html>
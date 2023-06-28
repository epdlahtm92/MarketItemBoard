<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="kopo17.domain.*" %><!-- 도메인 임포트 -->
<%@ page import="java.util.Date" %> <!-- 데이트 임포트 -->
<%@ page import="java.text.SimpleDateFormat" %> <!-- 날짜 포맷 임포트 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 파라미터 인코딩 -->
<!DOCTYPE html>
<html>
	<head>
		<%
			long id = 0;
			if (request.getParameter("id") != null) { // 파라미터 대입
				id = Long.parseLong(request.getParameter("id"));
			}
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl(); // 클래식 객체 선언
			MarketItem marketItem = marketItemDao.selectOne(id); // 하나 선택 하는 메서드 호출
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<title>상품 수정하기</title>
	</head>
	<body>
		<form method="post">
			<input type="hidden" name="id" value=<%=marketItem.getId() %>>
			<table>
				<tbody>
					<tr><td class="leftIndex">상품 코드</td><td style="width:400px"><%=marketItem.getId() %></td></tr> <!-- 표 내용 출력 -->
					<tr><td class="leftIndex">상품명</td><td style="word-break:break-all"><%=marketItem.getName() %></td>
					<tr><td class="leftIndex">재고</td>
						<td><input style="text-align:center;"type="number" min=0 max=100000 name="count" value=<%=marketItem.getCount() %> required></td></tr><!-- 재고 현황 입력 폼 -->
					<tr><td class="leftIndex">상품 등록 일자</td><td><%=marketItem.getRecord_date() %></td></tr> <!-- 날짜는 기존 날짜로 초기화 -->
					<tr><td class="leftIndex">재고 등록 일자</td><td><%=sdf.format(now) %></td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td class="leftIndex">상품 설명</td><td><textarea style="border:0px; width:90%; height:300px;" readonly><%=marketItem.getInfo() %></textarea></td></tr> <!--  내용은 textarea로 받기 -->
					<tr><td class="leftIndex">상품 사진</td>
					<%
						if(marketItem.getPic_addr().equals("null")) {
							out.println("<td>등록된 사진이 없음</td>");
						} else {
					%>
						<td><img src="<%="/MarketItem/upload/" + marketItem.getPic_addr() %>" width=300px; height=300px;></td></tr> <!--  이미지 소스 -->
					<%} %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=2>
							<button type="button" onclick="location.href='./SelectAll.jsp'">목록</button> <!-- 전체조회로 돌아가기 -->
							<input style="width:80px;" type="submit" formaction="./UpdateOne.jsp" value="수정하기"></td> <!-- 새 레코드 입력 하기 -->
					</tr>
				</tfoot>
			</table>
		</form>
	</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="kopo17.domain.*" %> <!-- 도메인 임포트 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 파라미터 인코딩 -->

<!DOCTYPE html>
<html>
	<head>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<%
			long id = 0; // 아이디 변수 초기화
			if (request.getParameter("id") != null) { // 파라미터 받아와서 변수에 대입
				id = Long.parseLong(request.getParameter("id"));
			}
			
			MarketItemDao marketItemDao = new MarketItemDaoImpl(); // 클래스 객체 선언
			MarketItem selectOne = marketItemDao.selectOne(id); // 하나만 조회하는 메서드 호출
		%>
		<title>선택한 글 보기</title>
	</head>
	<body>
		<table>
			<tbody>
				<tr><td class="leftIndex">상품 코드</td><td style="width:400px"><%=selectOne.getId() %></td></tr> <!-- 호출한 메서드 값 출력 -->
				<tr><td class="leftIndex">상품명</td><td style="width:400px; word-break:break-all"><%=selectOne.getName() %></td></tr> <!-- 호출한 메서드 값 출력 -->
				<tr><td class="leftIndex">재고</td><td><%=selectOne.getCount() %></td></tr> <!-- 호출한 메서드 값 출력 -->
				<tr><td class="leftIndex">상품 등록 일자</td><td><%=selectOne.getRecord_date() %></td></tr> <!-- 호출한 메서드 값 출력 -->
				<tr><td class="leftIndex">재고 등록 일자</td><td><%=selectOne.getStock_date() %></td></tr> <!-- 호출한 메서드 값 출력 -->
				<tr><td class="leftIndex">상품 설명</td><td><textarea style="border:0px; width:90%; height:300px; text-align:center;" readonly><%=selectOne.getInfo() %></textarea></td></tr> <!-- 호출한 메서드 값 출력 -->
				<%
					if (selectOne.getPic_addr().equals("null")){
						out.println("<tr><td class='leftIndex'>상품사진</td><td>등록된 사진이 없습니다.</td></tr>");
					} else {
				%>
				<tr><td class="leftIndex">상품 사진</td><td><img src="<%="/MarketItem/upload/" + selectOne.getPic_addr() %>" width=300px; height=300px; onError="this.style.visibility='hidden'"></td>
				<%} %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan=2;>
						<button onclick="location.href='./SelectAll.jsp'">목록</button> <!--  전체 목록으로 돌아가기 -->
						<button onclick="location.href='./DeleteOne.jsp?id=<%=selectOne.getId() %>'">삭제</button> <!-- 삭제 버튼 -->
						<button onclick="location.href='./InputModForm.jsp?id=<%=selectOne.getId() %>'">수정하기</button> <!-- 수정하기 버튼 -->
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>
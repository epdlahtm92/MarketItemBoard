<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<%
			String name = null; // 이름 변수 초기화
			if (request.getParameter("name") != null){ // 이름 변수 파라미터로 받아오기
				name = request.getParameter("name"); // 이름 변수 대입
			}
			
			int count = 0; // 숫자 세기 변수
			if (request.getParameter("count") != null){ // 숫자세는 편수 파라미터로 받아오기
				count = Integer.parseInt(request.getParameter("count"));
			}
			
			String info = null; // 정보 변수 초기화
			if (request.getParameter("info") != null){ //파라미터로 정보 변수 받아오기
				info = request.getParameter("info"); // 대입
			}
			
			String pic_addr = null; // 사진 주소 변수 초기화
			if (request.getParameter("pic_addr") != null){ // 파라미터로 받아오기
				pic_addr = request.getParameter("pic_addr"); // 대입
			}
			
		%>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<title>신규 상품 등록</title>
	</head>
	<body>
		<form method="post">
			<table>
				<tbody>
					<tr><td>번호</td><td>신규</td></tr> <!-- 표 내용 출력 -->
					<tr><td>상품명</td>
						<td><input type="text" name="name" value=<%=name %> required></td></tr> <!-- 이름 필수 입력 사항 -->
					<tr><td>재고현황</td>
						<td><input type="number" min = 0 name="count" value=<%=count %> required></td></tr><!-- 재고 현황 입력 폼 -->
					<tr><td>상품 등록일</td><td>오늘</td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td>재고 등록일</td><td>오늘</td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td>상품 설명</td>
						<td><textarea name="info"><%=info %></textarea></td></tr> <!--  내용은 textarea로 받기 -->
					<tr><td rowspan=2>상품 사진</td>
						<td><input type="text" name="pic_addr" value=<%=pic_addr %>></td> <!-- 사진 주소 넣는 폼 -->
						<td><input type="submit" formaction="./InputNewForm.jsp" value="업로드"> <!-- 사진 업로드 버튼 -->
						<tr><td><img src=<%=pic_addr %> width=300px; height=300px;></td></tr> <!--  이미지 소스 -->
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td><button type="button" onclick="location.href='./SelectAll.jsp'">목록</button> <!-- 전체조회로 돌아가기 -->
							<input type="submit" formaction="./InsertNewOne.jsp" value="글 쓰기"></td> <!-- 새 레코드 입력 하기 -->
					</tr>
				</tfoot>
			</table>
		</form>
	</body>
</html>
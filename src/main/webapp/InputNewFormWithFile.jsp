<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<script>
		function imageToBase64 (t) {
			var reader = new FileReader();
			reader.readAsDataURL(t.files[0]);
			reader.onload = function (e) {
				document.getElementById('image').src = e.target.result;
				document.getElementById('pic_addr').value = e.target.result;
			}
		}
	</script>
	<head>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<title>신규 상품 등록</title>
	</head>
	<body>
		<form method="post">
			<table>
				<tbody>
					<tr><td>번호</td><td>신규</td></tr> <!-- 표 내용 출력 -->
					<tr><td>상품명</td>
						<td><input type="text" name="name" required></td></tr> <!-- 이름 필수 입력 사항 -->
					<tr><td>재고현황</td>
						<td><input type="number" min = 0 name="count" required></td></tr><!-- 재고 현황 입력 폼 -->
					<tr><td>상품 등록일</td><td>오늘</td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td>재고 등록일</td><td>오늘</td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td>상품 설명</td>
						<td><textarea name="info"></textarea></td></tr> <!--  내용은 textarea로 받기 -->
					<tr><td rowspan=3>상품 사진</td>
						<td><img id="image" src="" alt=""></tr>
					<tr><td><input type="file" onchange="imageToBase64(this)"/></tr>
					<tr><td><input type="text" name="pic_addr" id="pic_addr" value=""></td></tr>
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
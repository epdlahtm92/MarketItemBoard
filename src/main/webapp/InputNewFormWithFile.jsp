<%@ page contentType="text/html; charset=UTF-8" %><%--utf8 로 문자형 정해주기--%>
<%@ page import="kopo17.dao.*" %> <!-- dao 임포트 -->
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<script>	
		function setThumbnail(event) {
			const fileInput = event.target;
			const file = event.target.files[0];
			if(!file.type.match('image/jpeg') && !file.type.match('image/png')) {
				alert("JPEG 또는 PNG 이미지만 업로드해주세요.");
				fileInput.value = "";	//파일 입력 초기화
				
			} else {	
			
			var reader = new FileReader();
			reader.onload = function(event) {
				 document.getElementById('image').src = event.target.result;
			};

			reader.readAsDataURL(file);
			}
		}
		
		function imageToBase64 (t) { /* 이미지를 base64로 변환하는 펑션 */
			var reader = new FileReader(); /*파일 리더 활용*/
			reader.readAsDataURL(t.files[0]);
			reader.onload = function (e) {
				document.getElementById('image').src = e.target.result; /*파일 읽어들여 base64로 변환한 것 아이디로 검색한 엘리먼트에 넣어주기*/
				document.getElementById('pic_addr').value = e.target.result; /*파일 읽어들여 base64로 변환한 것 아이디로 검색한 엘리먼트에 넣어주기*/
			}
		}
		
		function characterCheck(obj){
			  // 허용하고 싶은 특수문자가 있다면 여기서 삭제
			  var regExp = /<!--|-->/gi; 
			 // var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
			
			  if( regExp.test(obj.value) ){
			     alert("해당 문자는 입력하실수 없습니다.");
			     obj.value = obj.value.trim().substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
			  }
			
			}
			
		function spaceCheck(){
			 var titleBox = document.getElementById("name").value.trim(); // 트림 메소드로 공백 삭제
			 document.getElementById("name").value = titleBox; // 대입
		}
		
		function textCheck(){
			var textareaStr = document.getElementById("info").value; // 값 찾아오기
			var titleBoxStr = document.getElementById("name").value; // 값 찾아오기
			document.getElementById("info").value = textareaStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;"); // 특수문자 변환
			document.getElementById("name").value = titleBoxStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;"); // 특수문자 변환
			
		}
	</script>
	<head>
		<%
			Date now = new Date(); // 현재 날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식
			
		%>
		<style>@import "./Style.css";</style><!-- css 파일 임포트 -->
		<title>신규 상품 등록</title>
	</head>
	<body>
		<form method="post" action="./InsertNewOne.jsp" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr><td class="leftIndex">상품 코드</td>
						<td style="width:400px;"><input type="number" name="id" required></td></tr> <!-- 표 내용 출력 -->
					<tr><td class="leftIndex">상품명</td>
						<td><input type="text" name="name" id="name" maxlength="33" required></td></tr> <!-- 이름 필수 입력 사항 -->
					<tr><td class="leftIndex">재고</td>
						<td><input type="number" min=0 max=100000 name="count" required></td></tr><!-- 재고 현황 입력 폼 -->
					<tr><td class="leftIndex">상품 등록 일자</td><td><%=sdf.format(now) %></td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td class="leftIndex">재고 등록 일자</td><td><%=sdf.format(now) %></td></tr> <!-- 날짜는 오늘 날짜로 초기화 -->
					<tr><td class="leftIndex">상품 설명</td>
						<td><textarea style="height:100px;"name="info" id="info" required></textarea></td></tr> <!--  내용은 textarea로 받기 -->
					<tr><td rowspan=3 class="leftIndex">상품 사진</td> <!-- 상품 사진 -->
						<td><img id="image" width=90%; height=300px; alt=""></tr> <!-- 이미지 표시 태그 -->
					<tr><td><input type="file" onchange="setThumbnail(event)" name="pic_addr" id="pic_addr" accept="image/*"/></tr> <!-- base64로 이미지 변환 -->
					<!-- <tr><td><textarea style="width=300px; height=300px;"></textarea></td></tr> <!-- 변환한 base64 인코딩 넣기 -->
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td><button type="button" onclick="location.href='./SelectAll.jsp'">목록</button> <!-- 전체조회로 돌아가기 -->
							<input style="width:70px;" type="submit" onclick=spaceCheck();textCheck() value="글 쓰기"></td> <!-- 새 레코드 입력 하기 -->
					</tr>
				</tfoot>
			</table>
		</form>
	</body>
</html>
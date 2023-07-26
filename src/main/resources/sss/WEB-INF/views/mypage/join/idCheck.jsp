<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>아이디 중복 체크</title>
	    <link rel="stylesheet" href="/style/style_Common.css">    
	    <script src="/resource/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id="wrap_Popup">
			<div>
				<h1>${uid }</h1>
				
		<span>
		<c:if test="${idCheck }">
			사용가능한 아이디입니다.
			<input type="hidden" id="idCheck" value="Yes">
		</c:if>
		<c:if test="${!idCheck }">
			해당 아이디는 사용할 수 없습니다.
			<input type="hidden" id="idCheck" value="No">
		</c:if>
		</span>
			</div>
			<hr />
			<div id="closeBtnArea">
 				<button type="button">확인</button> 
			</div>
		</div>
		<!-- div#wrap -->
		<script>
		//아이디 중복체크 팝업창 닫기
		$("div#closeBtnArea>button").click(function(){
			window.close();
			opener.regFrm.uid.focus();
			//opener 객체는 팝업창을 실행한 부모페이지를 지칭함.
		});
		$("#idCheck", opener.document).val($("#idCheck").val());
		</script>
	</body>
</html>
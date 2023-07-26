<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>우편번호 찾기</title>
	    <script src="/resource/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id="wrap_zipcodePopup">
			<h1>우편번호 찾기</h1>
			<form action="zipCode" id="zipFrm">
				<table id="zipFrmTbl">
					<tbody>
						<tr>
							<td id="serachInputArea">
								<span>동 이름 입력</span>
								<input type="text" name="address" id="address" />
								<button id="addrSearchBtn" type="button">검색</button>							
							</td>
						</tr>
						<tr>
							<td><hr /></td>
						</tr>
						<tr>
							<td id="zipResArea">
								<span>검색어를 입력해주세요</span>
								<span><b>[ ${address } ]</b></span>에 대한 검색결과입니다.
								
								<table id="zipResTbl">
									<tbody>
									<c:forEach items="${zipCode }" var="z">
									<c:set var="addr" value="${z.zipCode} ${z.province} ${z.city } ${z.town } ${z.village } "/>
										<tr>
											<td><span>${addr }</span></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- div#wrap -->
		<script>
		// 우편번호 팝업창에서 주소 검색
		$("#addrSearchBtn").click(function(){
			let address = $("#address").val().trim();
			if(address == ""){
				alert("검색어를 입력해주세요.")
				$("#address").focus();
			}else{
				$("#zipFrm").submit();
			}
		});
		
		// 우편번호 팝업창에서 주소 선택
		$("table#zipResTbl td").click(function(){
			let txtAddr = $(this).children("span").text();
			let zipcode = txtAddr.substring(0, 7);
			let addr = txtAddr.substring(8);
			window.opener.uzipcode.value = zipcode;
			window.opener.uaddr.value = addr;
			window.close();
		});
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_management.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			
			<div id="wrapView">
					
		
				
					<h1>회원정보 상세보기</h1>
						<div id="userListTblArea">
				
					<div class="viewListTblHeader userListTbl dFlex">
						<!-- <span>번호</span> -->
						<span>닉네임</span>
						<span>이름</span>
						<span>나이</span>
						<span>성별</span>
						<span>전화번호</span>
						<span>주소</span>
						<span>가입시간</span>
						
						
					</div>
				
				
					
					
							<form id="umFrm">
						<div class="viewListTbl dFlex"">
								<span>${userView.uid}</span>
								<span><input type="text" name="uname" value="${userView.uname}"/></span>
								<span><input type="text" name="ubirthday" value="${userView.ubirthday}"/></span>
								<span><input type="text" name="gender" value="${userView.gender}"/></span>
								<span><input type="text" name="phoneNum" value="${userView.phoneNum}"/></span>
								<span><input type="text" name="uaddr" value="${userView.uaddr}"/></span>
								<span>${userView.joinTm}</span>
					
						</div>
								<input type="hidden" name="uid" value="${userView.uid}"/>
						<!-- div.userListTbl -->
						<div id="userBtnArea">
							<button type="button" id="userModBtn">수정하기</button>
							<button type="button" id="userDelBtn">삭제하기</button>
							<button type="button" id="backBtn" onclick="location.href='/userList'">목록으로</button>
						</div>
						
							</form>
				
				</div>
				<!-- div#userListTblArea -->
					
					
				
				
			
			</div>
			<!-- WrapView -->
			
		</div>
		<!-- innerWrap -->
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_userInfo.js"></script>
	
</body>
</html>
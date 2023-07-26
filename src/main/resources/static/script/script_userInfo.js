/**
 * 
 */
 
 $(function(){
 
 		/* 회원정보 상세보기 시작 */
	$("#userListTblArea div.userListTbl").click(function(){
		let num = $(this).attr("data-link");
		//alert("num : " + num + "\n상세보기 OK");
		location.href="userView?num="+num;
	});
	/* 회원정보 상세보기 끝 */
	
 	
 	$("button#userModBtn").click(function(){
 		chk = confirm("수정하시겠습니까?");
 		
 		if(chk) {
 			$("form#umFrm").attr("action","/userMod");
 			$("form#umFrm").submit();
 		}
 	})
 	
 	$("button#userDelBtn").click(function(){
 		chk = confirm("삭제하시겠습니까?");
 		
 		if(chk) {
 			$("form#umFrm").attr("action","/userDel");
 			$("form#umFrm").submit();
 		}
 	})
 	
 });
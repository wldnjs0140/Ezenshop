/**
 * 
 */

 $(function(){
 	
 	// 색상변경 	
 	$("select#colorSel").change(function(){
 		var goodsCode = $("input#chkGC").val();
 		var goodsColor = $("select#colorSel").val();
 		
 		location.href="/productDetail?goodsCode="+goodsCode+"&goodsColor="+goodsColor;
 	});
 
 	// 사이즈버튼
 	$("button.chkSizeBtn").click(function(){
 		$(this).parent("label").children("input").attr("checked",true);
 		$("button.chkSizeBtn").css({"background-color" : "#fff","color":"#000"});
 		$(this).css({"background-color" : "#555","color":"#fff"});	
 	});
	
	// 구매하기
	$("button.fBtn").click(function(){
		var chk = $("input[name=uname]").val();
		
		if(chk == "") {
			alert("로그인시 이용 가능합니다.");
		} else {
			$("form#goodsFrm").attr("action","/order");
			$("form#goodsFrm").submit();
		}
	});
	
	// 장바구니
	$("button.scBtn").click(function(){
		var chk = $("input[name=uname]").val();
		
		if(chk == "") {
			alert("로그인시 이용 가능합니다.");
		} else {
			$("form#goodsFrm").attr("action","/cart");
			$("form#goodsFrm").submit();
		}
	});
	
	
 });
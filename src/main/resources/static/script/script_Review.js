/**
 * 
 */

 
 $(function(){

 	$("span.goReview").click(function(){
 		
 		var goodsCode = $("input#hidgoodsCode").val();
 		var num = $("input#hidnum").val();
 		
 		location.href = "/goodsReviewReg?goodsCode="+goodsCode+"&num="+num;
 		
 	});
 	
 	var reFocusChk = $("input#reFocusChk").val();
 	
 	if(reFocusChk!=null) {
 		$("div#reViewArea").focus();
 	}
 	
 	$("button#rAddBtn").click(function(){
 		var chk = confirm("리뷰를 등록하시겠습니까?");
 		if(chk){
 		$("form#reSubFrm").submit();
 		}
 	});
 	
 	$("button#modBtn").click(function(){
 		var chk = confirm("수정하시겠습니까?");
 		if(chk) {
 			$("form#reModFrm").submit();
 		}
 	});
 	
 	$("button#reviewDelBtn").click(function(){
 		
 		var chk = confirm("작성하신 리뷰를 삭제하시겠습니까?");
 		var ref = $(this).parent("div.review_Tbl_Footer").children("input.refchk").val();
 		var gc = $(this).parent("div.review_Tbl_Footer").children("input.gcchk").val();
 		
 		if(chk){
 			location.href="/reviewDel?ref="+ref+"&goodsCode="+gc;
 		}
 		
 	});
 	
 	$("button#reviewModBtn").click(function(){
 	
 		var ref = $(this).parent("div.review_Tbl_Footer").children("input.refchk").val();
 		var gc = $(this).parent("div.review_Tbl_Footer").children("input.gcchk").val();

 		location.href="/reviewMod?ref="+ref+"&goodsCode="+gc;
 		
 	});
 	
 	
 });
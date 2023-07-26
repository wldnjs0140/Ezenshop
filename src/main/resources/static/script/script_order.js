/**
 * 
 */
 
$(function(){

	$("button#orderBtn").click(function(){
		var chk = confirm("상품을 주문하시겠습니까?");
		let adress = $("input#adress").val();
		let phonenum = $("input#phonenum").val();
		
		let regExp = /[^0-9]/g;
		let pExpRes = regExp.test(phonenum);
		
		if(adress == '') {
			alert("주소를 입력해주세요!");
			$("#adress").focus();
		} else if(phonenum ==''){
			alert("전화번호를 입력해주세요!");
			$("#phonenum").focus();		
		} else if(phonenum.length <10){
			alert("전화번호를 올바르게 입력해주세요.");
			$("#phonenum").focus();		
		} else if(pExpRes){ 
			alert("'-' 빼고 입력해주세요");
			$("#phonenum").focus();		
		}  else{
			if(chk) {
				$("form#orderFrm").attr("action","/orderProc");
				$("form#orderFrm").submit();
			}
		}
		
	});

});
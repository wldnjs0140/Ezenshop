/**
 * 
 */
 
 $(function(){
 		
 	$("button#goDetail").click(function(){
 		let goodsCode = $("button#goDetail").attr("data-link"); 
 		
 		//alert("goodsCode : "+ goodsCode);
 		 location.href="/productDetail?goodsCode="+goodsCode;	
 	});
 	
 	
 
 });
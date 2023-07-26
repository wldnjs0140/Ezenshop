/**
 * 
 */
 $(document).ready(function(){
	$(".slide_div").slick({
		autoplay: true,
		autoplaySpeed : 3000,
		prevArrow: '<button type="button" class="slick-prev"><img class="mainSlide" src="/images/index/GoLeft.png" alt=""></button>',
  		nextArrow: '<button type="button" class="slick-next"><img class="mainSlide" src="/images/index/GoRight.png" alt=""></button>',
	 	waitForAnimate: false
	});
}); 
 $(document).ready(function(){
	$(".slide_div2").slick({
		slidesToShow: 4,
		slidesToScroll:1,
		focusOnSelect: true,
		autoplay: true,
		autoplaySpeed : 3000,
		prevArrow: '<button type="button" class="sub-slick-prev"><img src="/images/index/GoLeft.png" alt=""></button>',
  		nextArrow: '<button type="button" class="sub-slick-next"><img src="/images/index/GoRight.png" alt=""></button>',
	 	waitForAnimate: false
	});
}); 
 $(function(){
 	
 		
 
 });
/**
 * 
 */
 
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("thumb-Image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});
/*
function readImages(input) {
  // 인풋 태그에 파일이 있는 경우
  if (input.files && input.files.length > 0) {
    // FileReader 인스턴스 생성
    const reader = new FileReader();

    // 선택된 모든 파일에 대해 처리
    for (let i = 0; i < input.files.length; i++) {
      const file = input.files[i];

      // 이미지 파일인지 검사 (생략)

      // 이미지가 로드된 경우
      reader.onload = e => {
        const previewImage = document.getElementById("adImgs-image");
        previewImage.src = e.target.result;
      };

      // reader가 이미지 읽도록 하기
      reader.readAsDataURL(file);
    }
  }
}

// input file에 change 이벤트 부여
const inputImages = document.getElementById("adImgs");
inputImages.addEventListener("change", e => {
  readImages(e.target);
});
*/


/*
function readImage2(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[1]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader2 = new FileReader()
        // 이미지가 로드가 된 경우
        reader2.onload = e => {
            const adImgsimage = document.getElementById("adImgs-image")
            adImgsimage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader2.readAsDataURL(input.files[1])
    }
}
// input file에 change 이벤트 부여
const inputImage2 = document.getElementById("adImgs")
inputImage2.addEventListener("change", e => {
    readImage2(e.target)
});




$(document).ready(function() {
  var removeButtonCreated = false;

  $('#addButton').click(function() {
    var existingInput = $('input.files:last');
    var clonedInput = existingInput.clone();
   	
    var timestamp = Date.now(); // 현재 시간을 밀리초 단위로 가져옵니다.
    var newName = 'files' + timestamp; // 새로운 이름을 생성합니다.
    clonedInput.attr('name');
    existingInput.parent().append(clonedInput);

    if (!removeButtonCreated) {
      $('#addButton').after('<button id="removeButton">-</button>');
      removeButtonCreated = true;
    }
  });


  $(document).on('click', '#removeButton', function() {
    var additionalInputs = $('input[name^="files"]');
    if (additionalInputs.length > 0) {
      additionalInputs.last().remove();
    }
    if (additionalInputs.length === 1) {
      $('#removeButton').remove();
      removeButtonCreated = false;
    }
  });
});
*/
$(function(){
	
	$("button.fBtn").click(function(){
		/*
		let img1 = $("input#thumb-Image").val();
		let img2 = $("input.files").val();
		alert("imgs : "+img1+img2);
		*/
		
		  
		$("form#form1").attr("action","/goodsDetailRegProc");
		$("form#form1").submit();
	});
	


}); 





 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<title>Insert title here</title>

	<script>
	function goModify(frm) {
		var title = frm.title.value;
		var writer = frm.writer.value;
		var content = frm.content.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if (writer.trim() == ''){
			alert("작성자를 입력해주세요");
			return false;
		}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	}
	
	$(document).ready(function() {
		  $('#summernote').summernote({
	 	    	placeholder: 'content',
		        minHeight: 370,
		        maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR'
		  });
	});
	</script>
	
</head>
<body>
	<h2 style="text-align: center;">글 작성</h2><br><br><br>
	
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/modify">
			<input type="hidden" name="seq" value="${board.seq}">
			<input type="text" name="writer" style="width: 20%;" placeholder="작성자" value="${board.writer }" readonly/><br>
			<input type="text" name="title" style="width: 40%;" placeholder="제목" value="${board.title }"/>
			<br><br> 
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goModify(this.form)"/>
		</form>
	</div>
		
</body>
</html>
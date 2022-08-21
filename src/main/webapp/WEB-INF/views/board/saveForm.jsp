<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">

	<form> 
		<div class="form-group">
			<label for="title">Title</label> 
			<input type="text" class="form-control" placeholder="Enter title" id="title">
		</div>

		<div class="form-group">
		  <label for="content">Content</label>
		  <textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>

	</form>
	
	<button id="btn-save" class="btn btn-primary" onClick="save()">글쓰기완료</button>	

</div>

<script>

	$('.summernote').summernote({
      placeholder: 'Enter Content',
      tabsize: 2,
      height: 300
    });
  
	function save(){

		let data = {
			title:$("#title").val(),
			content:$("#content").val()
		}
		
		$.ajax({
			type:"POST",
			url:"/api/board",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
  
</script>

<%@ include file="../layout/footer.jsp" %>
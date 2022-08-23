<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">

	<form> 
		<input type="hidden" id="id" value="${board.id}"/>
		<div class="form-group">
			<input value="${board.title}" type="text" class="form-control" placeholder="Enter title" id="title">
		</div>

		<div class="form-group">
		  <textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
		</div>

	</form>
	
	<button class="btn btn-primary" onClick="update()">글수정하기</button>	

</div>

<script>

	$('.summernote').summernote({
      placeholder: 'Enter Content',
      tabsize: 2,
      height: 300
    });
  
	function update(){
		
		let id=$("#id").val();

		let data = {
			title:$("#title").val(),
			content:$("#content").val()
		}
		
		$.ajax({
			type:"PUT",
			url:"/api/board/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			location.href="/board/"+id;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
  
</script>

<%@ include file="../layout/footer.jsp" %>
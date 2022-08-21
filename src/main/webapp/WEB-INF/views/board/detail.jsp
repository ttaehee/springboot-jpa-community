<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">

<button class="btn btn-dark" onClick="hisoty.back()">뒤로</button>
<button class="btn btn-secondary" id="btn-update">수정</button>
<button class="btn btn-secondary" id="btn-delete">삭제</button> <br/><br/>

		<div class="form-group">
			<h3>${board.title}</h3>
		</div>
		<hr/>

		<div class="form-group">
		  <div>${board.content}</div>
		</div>
		<hr/>

</div>

<script>

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
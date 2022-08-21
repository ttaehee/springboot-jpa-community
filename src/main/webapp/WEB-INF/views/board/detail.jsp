<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">

	<button class="btn btn-dark" onClick="history.back()">뒤로</button>
	<button class="btn btn-secondary" onClick="update()">수정</button>
	<c:if test="${board.user.id == principal.user.id}">
	    <button class="btn btn-secondary" onClick="dele()">삭제</button>
	</c:if> 
	<br/><br/>
	
	<div>
		글 번호 : <span id="id"><i>${board.id}</i></span>
		작성자 : <span><i>${board.user.username}</i></span>
	</div>
	<br/>

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

	function dele(){
		
		let id = $("#id").text();
		
		$.ajax({
			type:"DELETE",
			url:"/api/board/"+id,
			dataType:"json"
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
  
</script>

<%@ include file="../layout/footer.jsp" %>
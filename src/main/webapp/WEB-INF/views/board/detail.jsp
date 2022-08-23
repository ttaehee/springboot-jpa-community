<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">

	<button class="btn btn-dark" onClick="history.back()">뒤로</button>
	<c:if test="${board.user.id == principal.user.id}">
		<a href="/board/${board.id}/updateForm">수정</a>
	    <button class="btn btn-secondary" onClick="delBoard()">삭제</button>
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
	
	<div class="card">
		<form>
			<input type="hidden" id="userId" value="${principal.user.id}"/>
			<input type="hidden" id="boardId" value="${board.id}"/>
			<div class="card-body">
				<textarea id="reply-content" class="form-control" rows="1"></textarea>
			</div>
			<div class="card-footer"
				><button type="button" class="btn btn-primary" onClick="save()">등록</button>
			</div>
		</form>
	</div>
	
	<div class="card">
		<div class="card-header">댓글 리스트</div>
		<ul id="reply-box" class="list-group">
			<c:forEach var="reply" items="${board.replys}">
				<li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
					<div> ${reply.content} </div>
					<div class="d-flex">
						<div>작성자 : ${reply.user.username} &nbsp;&nbsp;</div>
						<c:if test="${reply.user.id == principal.user.id}">
							<button onClick="delReply(${board.id},${reply.id})" class="badge btn-primary">삭제</button>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

</div>

<script>

	function delBoard(){
		
		let id = $("#id").text();
		
		$.ajax({
			type:"DELETE",
			url:"/api/board/"+id
		}).done(function(resp){
			alert("게시글 삭제가 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	
	function save(){
		
		let data = {
			userId:$("#userId").val(),
			boardId:$("#boardId").val(),
			content:$("#reply-content").val()
		};
		
		console.log(data)
		
		$.ajax({ 
			type: "POST",
			url: "/api/board/"+data.boardId+"/reply",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("댓글작성이 완료되었습니다.");
			location.href = "/board/"+data.boardId;
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); 
	}
	
	function delReply(boardId, replyId){

		$.ajax({
			type:"DELETE",
			url:"/api/board/"+boardId+"/reply/"+replyId
		}).done(function(resp){
			alert("댓글삭제가 완료되었습니다.");
			location.href="/board/"+boardId;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	
  
</script>

<%@ include file="../layout/footer.jsp" %>
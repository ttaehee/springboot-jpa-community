<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<input type="hidden" id="id" value="${principal.user.id}"/>
	
		<div class="form-group">
			<label for="username">Username</label> 
			<input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter username" id="username" readonly>
		</div>
		
		<c:if test="${empty principal.user.oauth}">
			<div class="form-group">
				<label for="password">Password</label> 
				<input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
			
			<div class="form-group">
				<label for="email">Email</label> 
				<input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email" id="email">
		</div>
		</c:if>
		
		<div class="form-group">
			<label for="email">Email</label> 
			<input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email" id="email" readonly>
		</div>
		
	</form>
	
	<button id="btn-update" class="btn btn-primary" onClick="update()">회원수정완료</button>
	
</div>

<script>

function update(){

	let data = {
		id:$("#id").val(),
		username:$("#username").val(),
		password:$("#password").val(),
		email:$("#email").val()
	}
	
	$.ajax({
		type:"PUT",
		url:"/user",
		data:JSON.stringify(data),
		contentType:"application/json; charset=utf-8",
		dataType:"json"
	}).done(function(resp){
		alert("회원수정이 완료되었습니다.");
		location.href="/";
	}).fail(function(error){
		alert(JSON.stringify(error));
	});
}

</script>

<%@ include file="../layout/footer.jsp"%>
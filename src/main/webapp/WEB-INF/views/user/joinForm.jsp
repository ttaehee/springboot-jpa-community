<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
	
		<div class="form-group">
			<label for="username">Username</label> <input type="text" class="form-control" placeholder="Enter username" id="username">
		</div>
		
		<div class="form-group">
			<label for="password">Password</label> <input type="password" class="form-control" placeholder="Enter password" id="password">
		</div>
		
		<div class="form-group">
			<label for="email">Email</label> <input type="email" class="form-control" placeholder="Enter email" id="email">
		</div>
		
	</form>
	
	<button id="btn-save" class="btn btn-primary" onClick="join()">회원가입완료</button>
	
</div>

<script>

function join(){

	let data = {
		username:$("#username").val(),
		password:$("#password").val(),
		email:$("#email").val()
	}
	
	$.ajax({
		type:"POST",
		url:"/auth/joinProc",
		data:JSON.stringify(data), // http body 데이터
		contentType:"application/json; charset=utf-8", // body데이터가 어떤 타입인지(MIME)
		dataType:"json" // 응답
	}).done(function(resp){
		alert("회원가입이 완료되었습니다.");
		location.href="/";
	}).fail(function(error){
		alert(JSON.stringify(error));
	});
}

</script>

<%@ include file="../layout/footer.jsp"%>
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
		
		<div class="form-group form-check">
			<label class="form-check-label"> <input class="form-check-input" type="checkbox"> Remember me
			</label>
		</div>
		
		<button id="btn-login" class="btn btn-primary" onClick="login()">로그인</button>
		
	</form>


</div>

<script>

function login(){
		
	let data = {
			username:$("#username").val(),
			password:$("#password").val()
	}

	$.ajax({
		type:"POST",
		url:"/blog/api/user/login",
		data:JSON.stringify(data), // http body 데이터
		contentType:"application/json; charset=utf-8", // body데이터가 어떤 타입인지(MIME)
		dataType:"json" // 응답
	}).done(function(resp){
		alert("로그인이 완료되었습니다.");
		location.href="/blog";
	}).fail(function(error){
		alert(JSON.stringify(error));
	});
		
}

</script>

<%@ include file="../layout/footer.jsp"%>
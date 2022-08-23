package com.cos.blog.controller.api;

import java.io.UnsupportedEncodingException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.dto.ReplySaveRequestDto;
import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.Board;
import com.cos.blog.service.BoardService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardApiController {
	
	private final BoardService boardService;

	@PostMapping("/api/board")
	public ResponseEntity<String> save(
			@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) {
		
		boardService.글쓰기(board, principal.getUser());
		return new ResponseEntity<>("댓글쓰기성공", HttpStatus.CREATED);
	}
	
	@PutMapping("/api/board/{id}")
	public ResponseEntity<String> update(
			@PathVariable int id, @RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) throws UnsupportedEncodingException {
		
		boardService.글수정하기(id, board, principal.getUser());
		return new ResponseEntity<>("수정성공", HttpStatus.OK);
	}
	
	@DeleteMapping("/api/board/{id}")
	public ResponseEntity<String> delete(
			@PathVariable int id, @AuthenticationPrincipal PrincipalDetail principal) {
		
		boardService.글삭제하기(id, principal.getUser());
		return  new ResponseEntity<>("수정성공", HttpStatus.OK);
	}
	
	@PostMapping("/api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(
			@PathVariable int boardId, @RequestBody ReplySaveRequestDto replySaveRequestDto) {
		
		boardService.댓글쓰기(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseEntity<String> deleteReply(
			@PathVariable int replyId, @AuthenticationPrincipal PrincipalDetail principal) {
		
		boardService.댓글삭제하기(replyId, principal.getUser());
		return  new ResponseEntity<>("삭제성공", HttpStatus.OK);
	}
	
}

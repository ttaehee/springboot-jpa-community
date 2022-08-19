package com.cos.blog.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cos.blog.model.User;

public class PrincipalDetail implements UserDetails{

	private User user; // 콤포지션(객체를 품고있음)
	
	public PrincipalDetail(User user) {
		this.user=user;
	}
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}
	
	@Override
	public String getUsername() {
		return user.getUsername();
	}
	
	//계정이 갖고있는 권한목록을 리턴(권한이 여러개 있을 수 잇어서 루프를 돌아야하는데 현재 프로젝트는 한개만)
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collectors = new ArrayList<>();	
		collectors.add(()->{return "ROLE_"+user.getRole();});
		
		return collectors;
	}
	
	//계정이 만료되었는지 리턴(true : 만료안됨)
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	//계정이 잠겨있는지 리턴(true : 잠기지않음)
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	//비밀번호가 만료되었는지 리턴(true : 만료안됨)
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	//계정이 활성화(사용가능)인지 리턴(true: 활성화)
	@Override
	public boolean isEnabled() {
		return true;
	}
}

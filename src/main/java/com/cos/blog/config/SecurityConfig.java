package com.cos.blog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // 빈등록 (IoC관리)
@EnableWebSecurity // 시큐리티필터(설정하는) 추가
@EnableGlobalMethodSecurity(prePostEnabled = true) // 특정주소로 접근하면 권한 및 인증 미리 체크
public class SecurityConfig{

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
		  .authorizeRequests()
		  	.antMatchers("/auth/**")
		  	.permitAll()
		  	.anyRequest()
		  	.authenticated()
		  .and()
		  	.formLogin()
		  	.loginPage("/auth/loginForm");
        return http.build();
    }

}

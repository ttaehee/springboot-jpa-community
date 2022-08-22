package com.cos.blog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
//@DynamicInsert insert시 null인 필드 제외해줌
@Entity
public class User {
	
	@Id //primary key
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private int id;
	
	@Column(nullable = false, length = 30)
	private String username; //아이디
	  
	@Column(nullable = false, length = 100)
	private String password;
	
	@Column(nullable = false, length = 50)
	private String email;

	@Enumerated(EnumType.STRING)
	private RoleType role;
	
	private String oauth;
	
	@CreationTimestamp // 시간이 자동입력
	private Timestamp createDate;

}

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
@Entity // User 클래스가 MySQL에 테이블이 생성됨
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
	
	//@ColumnDefault("'user'")
	//private String role;
	
	@Enumerated(EnumType.STRING) // DB는 RoleType이 없으니까 String 알려주기
	private RoleType role;
	
	@CreationTimestamp // 시간이 자동입력
	private Timestamp createDate;

}

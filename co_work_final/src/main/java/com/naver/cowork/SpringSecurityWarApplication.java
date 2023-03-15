package com.naver.cowork;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling  // 스케쥴러 적용합니다.
public class SpringSecurityWarApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityWarApplication.class, args);
	}

}

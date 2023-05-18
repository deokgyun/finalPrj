package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MailVO {
	private String from;
	private String to;
	private String subject;
	private String content;

}

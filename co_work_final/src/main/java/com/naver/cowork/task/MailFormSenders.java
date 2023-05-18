package com.naver.cowork.task;

import org.springframework.stereotype.Component;

import com.naver.cowork.domain.MailVO;

import java.util.Random;

@Component
public class MailFormSenders extends SendMailService {
    private int authNumber;

    public MailVO setMailInfo(String from, String to) {
        makeRandomNumber();
        MailVO mail = new MailVO();
        mail.setFrom(from);
        mail.setTo(to);
        mail.setSubject("Co_Work에서 발송한 인증번호입니다");
        mail.setContent(String.valueOf(authNumber));
        return mail;
    }

    public void makeRandomNumber() {
        Random r = new Random();
        int checkNum = r.nextInt(8888) + 1111;
        authNumber = checkNum;
    }
}

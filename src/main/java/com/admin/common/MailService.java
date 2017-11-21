package com.admin.common;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class MailService {
	private MailSender mailSender;
	 
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
 
	public void sendMail(String from, String to, String subject, String msg) throws Exception {
 
		SimpleMailMessage message = new SimpleMailMessage();
 
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		mailSender.send(message);	
	}

}

package com.app.utils;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

	public static void SendMail(String to) 
	{
		String from = "khendkarsaurabh@gmail.com";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", 587);
		
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(from, "mail.sk@9017");
			}
		});
		
		try 
		{
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("UnBerozgar");
			
			message.setContent("<h3>done with basic mail testing. still long way to go</h3>"
					+ "<a href='http://192.168.43.150:7070/CareerGuidance/company/accountActivate?email="+to+"'>Click here</a> to activate your account"
					+ "<br>We can write a link for our program that will do the job of activating the account", "text/html");
			
			Transport.send(message);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
 
	}

}

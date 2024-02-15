package com.app.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class DataUtils {
	public static String generateHash(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException
	{
		String presalt="1a2b3c4d";
		String postsalt="d4c3b2a1";
		int itr=1000;
		while(itr>0)
		{
			password=password.concat(presalt);
			
		    MessageDigest hash = MessageDigest.getInstance("SHA-256");	 
		    hash.reset();
		    hash.update(password.getBytes("UTF-8"));
			
		    password=new BigInteger(1, hash.digest()).toString(16);
			password=postsalt.concat(password);

			itr--;
		}
		return password;
	}
	
	public static void sendEmail(String email) throws NoSuchAlgorithmException, UnsupportedEncodingException
	{
		String to = email;
		String from = "unberozgaar@gmail.com";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", 587);

		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(from, "wakandaforever");
			}
		});

		try 
		{
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("UnBerozgar");
			message.setContent("<h3>Click the link to activate your account</h3>"
					+ "<a href='http://192.168.1.13:7070/CareerGuidance/student/activateaccount?email="+to+">Click here</a> to activate your account"
					+ "", "text/html");
			
			Transport.send(message);
			System.out.println("mail sent");
			
		}catch (Exception e) {
			e.printStackTrace();
		}


		
	}
	
}

package com.naukrisphere.controller;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    private static final String FROM_EMAIL = "hukamsingh7983@gmail.com"; 
    private static final String PASSWORD = "qhjqmwwiiagzdasq";

    public static void sendEmail(String to, String subject, String messageText) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
                    }
                });

        try {
            // ✔ Correct Object
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            
            // ✔ Plain text or HTML email
            message.setText(messageText);

            Transport.send(message);

            System.out.println("Email Sent Successfully to: " + to);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

package com.helper;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.bean.UserBean;

public class MailSender {

    private static final String FROM = "rohitnigade2018@gmail.com";
    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final String SMTP_AUTH_USER = "rohitnigade2018@gmail.com";
    private static final String SMTP_AUTH_PWD  = "fcwvsipoocadzmjs"; // replace with your app password

    /**
     * Method sends email to the newly created employee.
     * @param bean
     */
    public static int sendMail(UserBean bean) {
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_AUTH_USER, SMTP_AUTH_PWD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(bean.getEmail()));
            message.setSubject("Registration In Smart Book Hub");
            message.setContent(
                "<p style='font-weight:bold;font-size:large;color:#0074D9'>Dear " + bean.getName() + ",</p>"
                + "<P style='font-size:14px;color:#3D9970'>Your Account Has Been  has been created successfully.</p>",
                "text/html"
            );

            Transport.send(message);
            System.out.println("Done");
            return 1;
        } catch (MessagingException e) {
            e.printStackTrace();
            return 0;
        }
    }
}

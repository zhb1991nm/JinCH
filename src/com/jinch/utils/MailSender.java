package com.jinch.utils;

import javax.activation.*;
import javax.mail.Multipart;
import javax.mail.internet.*;
import java.io.File;
import java.util.List;
import java.util.Properties;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.util.StringUtils;

/**
 * Created by zhb on 2014/8/4.
 */
public class MailSender {

    private String smtpServer;
    private String smtpUser;
    private String smtpPassword;
    private int smtpPort = 25;

    public MailSender(){}

    public MailSender(String smtpServer, String smtpUser, String smtpPassword) {
        this.smtpServer = smtpServer;
        this.smtpUser = smtpUser;
        this.smtpPassword = smtpPassword;
        this.smtpPort = 25;
    }


    /**
     * �����ʼ�
     * @param from        发送邮件地址
     * @param to          目标邮件地址
     * @param subject     标题
     * @param content     正文
     * @param attachments 附件
     */
    public void sendMail(String from, String to, String subject, String content, List<String> attachments)
    {
        sendMail(from, to, subject, content, attachments, null);
    }

    /**
     * �����ʼ�
     * @param from        发送邮件地址
     * @param to          目标邮件地址
     * @param subject     标题
     * @param content     正文
     * @param attachments 附件
     * @param filenames   文件名
     */
    public void sendMail(String from, String to, String subject, String content, List<String> attachments, List<String> filenames)
    {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        if (!StringUtils.isEmpty(this.smtpUser) && !StringUtils.isEmpty(this.smtpPassword)) {
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.timeout",180000); // Ĭ��5����
            p.put("mail.smtp.connectiontimeout",60000); // Ĭ��1����
            mailSender.setPort(this.smtpPort);
            mailSender.setJavaMailProperties(p);
            mailSender.setUsername(this.smtpUser);
            mailSender.setPassword(this.smtpPassword);
        }
        mailSender.setDefaultEncoding("utf-8");
        mailSender.setHost(this.smtpServer);

        MimeMessage message = mailSender.createMimeMessage();
        MimeMailMessage mm = new MimeMailMessage(message);

        mm.setFrom(from);
        mm.setTo(to);
        mm.setSubject(subject);

        try{
            Multipart mp = new MimeMultipart();
            MimeBodyPart mbp1 = new MimeBodyPart();
            mbp1.setContent(content, "text/html;charset=utf-8");
            mp.addBodyPart(mbp1);

            if (attachments != null && attachments.size() > 0){
                int i = 0;
                for (Object Attachment : attachments) {
                    String fileAttachment = Attachment + "";
                    if (!StringUtil.isBlank(fileAttachment)) {
                        File file = new File(fileAttachment);

                        MimeBodyPart mbp2 = new MimeBodyPart();

                        DataSource source = new FileDataSource(file);
                        mbp2.setDataHandler(new DataHandler(source));
                        String h = null;
                        if (filenames != null && filenames.size()>0){
                            h = MimeUtility.encodeText(filenames.get(i));
                        }
                        else{
                            h = MimeUtility.encodeText(file.getName());
                        }

                        mbp2.setFileName(h);
                        mp.addBodyPart(mbp2);
                    }
                    i++;
                }
            }
            message.setContent(mp);
        }
        catch(javax.mail.MessagingException ex){
//            throw new SirmAppException("send mail failed!", SirmAppException.MAIL);
        }
        catch(java.io.UnsupportedEncodingException ex){
//            throw new SirmAppException("send mail failed!", SirmAppException.ENCODING);
        }
        mailSender.send(message);
    }

    public String getSmtpServer() {
        return smtpServer;
    }

    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
    }

    public String getSmtpUser() {
        return smtpUser;
    }

    public void setSmtpUser(String smtpUser) {
        this.smtpUser = smtpUser;
    }

    public String getSmtpPassword() {
        return smtpPassword;
    }

    public void setSmtpPassword(String smtpPassword) {
        this.smtpPassword = smtpPassword;
    }

    public int getSmtpPort() {
        return smtpPort;
    }

    public void setSmtpPort(int smtpPort) {
        this.smtpPort = smtpPort;
    }
}
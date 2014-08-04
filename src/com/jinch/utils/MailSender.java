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
 * Created by user on 2014/8/4.
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
     * 发送邮件
     * @param from        来源地址
     * @param to          目标地址
     * @param subject     邮件主题
     * @param content     邮件内容
     * @param attachments 本地附件的路径
     */
    public void sendMail(String from, String to, String subject, String content, List<String> attachments)
    {
        sendMail(from, to, subject, content, attachments, null);
    }

    /**
     * 发送邮件
     * @param from        来源地址
     * @param to          目标地址
     * @param subject     邮件主题
     * @param content     邮件内容
     * @param attachments 本地附件的路径
     * @param filenames   附件的显示名称
     */
    public void sendMail(String from, String to, String subject, String content, List<String> attachments, List<String> filenames)
    {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        if (!StringUtils.isEmpty(this.smtpUser) && !StringUtils.isEmpty(this.smtpPassword)) {
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.timeout",180000); // 默认5分钟
            p.put("mail.smtp.connectiontimeout",60000); // 默认1分钟
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
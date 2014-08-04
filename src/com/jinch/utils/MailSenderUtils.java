package com.jinch.utils;

import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.net.URL;
import java.util.List;

/**
 * Created by zhb on 2014/8/4.
 */
public class MailSenderUtils {
    protected final Log logger = LogFactory.getLog(getClass());
    private        String          smtpServer;
    private        String          smtpUser;
    private        String          smtpPassword;
    private        String          fromSys;
    private static MailSenderUtils instance;

    public static MailSenderUtils MailSenderUtils() {
        if (instance == null) {
            instance = new MailSenderUtils();
        }
        return instance;
    }

    public MailSenderUtils() {
        URL url = this.getClass().getClassLoader().getResource("mail.properties");
        logger.info(url);
        if (url != null) {
            try {
                PropertiesConfiguration cfg = new PropertiesConfiguration(url);
                if (cfg.containsKey("MAIL_SMTPSERVER"))
                    this.smtpServer = cfg.getString("MAIL_SMTPSERVER");
                if (cfg.containsKey("MAIL_SMTPUSER"))
                    this.smtpUser = cfg.getString("MAIL_SMTPUSER");
                if (cfg.containsKey("MAIL_SMTPPWD"))
                    this.smtpPassword = cfg.getString("MAIL_SMTPPWD");
                if (cfg.containsKey("MAIL_FROMSYS"))
                    this.fromSys = cfg.getString("MAIL_FROMSYS");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * �����ʼ�
     *
     * @param to          目标邮箱
     * @param subject     标题
     * @param content     正文
     * @param attachments 附件
     */
    public void sendMail(String to, String subject, String content, List<String> attachments) {
        MailSender _sender = new MailSender(this.smtpServer, this.smtpUser, this.smtpPassword);
        if (StringUtils.isNotBlank(to) && StringUtils.isNotBlank(this.fromSys)) {
            _sender.sendMail(fromSys, to, subject, content, attachments);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbo;

/**
 *
 * @author hp
 */
import org.apache.commons.mail.*;
public class Checkmail {
    
    public String sendmail(String contactname, String contactemail, String contactmessage) {
        String myEmailId = "amusermusic4@gmail.com";
        String myPassword = "music4All";
        String senderId = "amusermusic4@gmail.com";
        try {
            //APP PASS whfydadxccnmtwol
            /*MultiPartEmail email = new MultiPartEmail();
            email.setSmtpPort(25);
            email.setAuthenticator(new DefaultAuthenticator(myEmailId, myPassword));
            email.setDebug(true);
            email.setHostName("smtp.gmail.com");
            email.setFrom(myEmailId);
            email.setSubject("A new contact message");
            email.setMsg("Name of the sender"+contactname+"\n\nEmail id:"+contactemail+"\n\nMessage:"+contactmessage+"\nPRAVATHI");
            email.addTo(senderId);
            email.setTLS(true);
            email.send();
            return("Mail sent!");*/
            Email email = new SimpleEmail();
            email.setHostName("smtp.googlemail.com");
            email.setSmtpPort(587);
            email.setAuthenticator(new DefaultAuthenticator("amusermusic4@gmail.com", "music4All"));
            email.setSSLOnConnect(true);
            email.setFrom("amusermusic4@gmail.com");
            email.setSubject("TestMail");
            email.setMsg("This is a test mail ... :-)");
            email.addTo("amusermusic4@gmail.com");
            email.send();
            return("Message sent");
        } catch (Exception e) {
            return("Exception :: " + e);
        }
    }
}
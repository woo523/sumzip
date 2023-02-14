package net.utility;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class MyAuthenticator  extends Authenticator{
    PasswordAuthentication pa;
    public MyAuthenticator(){
         
        String id = "sj.itwillteam3@gmail.com";  //구글 이메일 아이디
        String pw = "fcepuwvifmwousou";        //구글 비밀번호
 
        pa = new PasswordAuthentication(id, pw);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}

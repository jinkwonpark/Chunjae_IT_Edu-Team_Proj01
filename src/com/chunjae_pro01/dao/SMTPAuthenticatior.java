package com.chunjae_pro01.dao;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;



public class SMTPAuthenticatior extends Authenticator{

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("dhxogns920", "458963.xogns");
    }
}
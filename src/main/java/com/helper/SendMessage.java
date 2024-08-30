package com.helper;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendMessage {
    public static final String ACCOUNT_SID = "AC37449f113a4008ddb382346ce5eb63b7";
    public static final String AUTH_TOKEN = "5069b70404bac542f5707222b2e4a65c";
    public static final String TWILIO_PHONE_NUMBER = "+917028192728"; // Ensure this is in E.164 format

    static {
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize Twilio", e);
        }
    }

    public static int sendMessage(String msgbody, String phoneNumber) {
        try {
            Message message = Message.creator(
                new PhoneNumber("+919860239749"),
                new PhoneNumber(TWILIO_PHONE_NUMBER),
                msgbody
            ).create();
            return 0; // You may return a different value or message ID as needed
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Return an error code or throw a custom exception
        }
    }
}

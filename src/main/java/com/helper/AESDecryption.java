package com.helper;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

public class AESDecryption {
	private static final String ALGORITHM = "AES/CBC/PKCS5Padding";

	public static String decrypt(String encryptedText, SecretKey secretKey) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);

		// Decode Base64 encoded string
		byte[] combined = Base64.getDecoder().decode(encryptedText);

		// Extract IV and encrypted text
		byte[] iv = new byte[16];
		byte[] encrypted = new byte[combined.length - iv.length];
		System.arraycopy(combined, 0, iv, 0, iv.length);
		System.arraycopy(combined, iv.length, encrypted, 0, encrypted.length);

		IvParameterSpec ivParams = new IvParameterSpec(iv);
		cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParams);

		byte[] decryptedText = cipher.doFinal(encrypted);
		return new String(decryptedText, "UTF-8");
	}
}

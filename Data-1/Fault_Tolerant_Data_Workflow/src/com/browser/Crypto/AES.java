package com.browser.Crypto;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
public class AES {
	private static String algorithm = "AES";
	private static byte[] keyValue = new byte[]
			{ 'A', 'S','e','c','u','r','e', 'S','e','c','r','e','t', 'K','e','y'};
	public static String encrypt99(String plainText) throws Exception {
		Key key = generateKey();
		Cipher chiper = Cipher.getInstance(algorithm);
		chiper.init(Cipher.ENCRYPT_MODE,key);
		byte[] encVal = chiper.doFinal(plainText.getBytes());
		String encryptedValue = new BASE64Encoder().encode(encVal);
		return encryptedValue;
	}
	
	public static String decrypt(String encryptedText) throws Exception {
		Key key = generateKey();
		Cipher chiper = Cipher.getInstance(algorithm);
		chiper.init(Cipher.DECRYPT_MODE,key);
		byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedText);
		byte[] decValue = chiper.doFinal(decordedValue);
		String decryptedValue = new String(decValue);
		return decryptedValue;
	}
	
	public static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, algorithm);
		return key;
	}
}

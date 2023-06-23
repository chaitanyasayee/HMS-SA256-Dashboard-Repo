package com.browser.Crypto;

import java.security.Key;

import javax.crypto.spec.SecretKeySpec;


public class Publickey {
	
	private static final String ALGO = "AES";
	private static final byte[] keyValue = new byte[]
			{ 'T','h','e', 'S','h','a','m','i','r', 'S','e','c','r','e','t', 'K','e','y'};
	
	public static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue,ALGO);
		System.out.println("The key is: "+key);
		return key;
	}

}

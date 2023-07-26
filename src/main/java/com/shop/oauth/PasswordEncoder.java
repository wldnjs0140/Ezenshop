package com.shop.oauth;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;

public class PasswordEncoder {

	public org.springframework.security.crypto.password.PasswordEncoder passwordEncoder;

	public String passwordEncode(String password) {
		passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encPassword = passwordEncoder.encode(password);
		return encPassword;
	}

}


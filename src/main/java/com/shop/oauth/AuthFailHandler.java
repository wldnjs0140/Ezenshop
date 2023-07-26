package com.shop.oauth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
@Configuration
public class AuthFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String loginId = request.getParameter("sec_username");
		String errorMsg = "";

		if (exception instanceof BadCredentialsException) {
			loginFailureCount(loginId);
			errorMsg = "아이디 또는 비밀번호를 확인하세요.";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			loginFailureCount(loginId);
			errorMsg = "아이디 또는 비밀번호를 확인하세요.";
		} else if (exception instanceof DisabledException) {
			errorMsg = "계정이 비활성화	되었습니다.	관리자에게 문의하세요";
		} else if (exception instanceof CredentialsExpiredException) {
			errorMsg = "비밀번호 유효기간이	만료되었습니다.	관리자에게 문의하세요.";
		}

		request.setAttribute("username", loginId);
		request.setAttribute("err_Msg", errorMsg);

		request.getRequestDispatcher("/adminLoginForm?error=true").forward(request, response);

	}

	protected void loginFailureCount(String loginId) {
		// 틀린 횟수 누적 코드 작성용(3회 초과시 계정 잠금)
	}
}


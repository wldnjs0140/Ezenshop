package com.shop.admin.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

	// 로그인 페이지
	@RequestMapping("/adminLoginForm")
	public String adminLoginForm() {
		return "/security/adminLoginForm";
	}

	// 로그인 에러 처리
	@RequestMapping("/loginError")
	public String loginError() {
		return "security/loginError";
	}

}

package com.shop.oauth;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	PasswordEncoder passwordEncoder = new PasswordEncoder();

	@Autowired
	public AuthFailHandler authFailHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/loginPage", "/login", "/logout", "/joinAgreement", "/joinPage", "/idCheck", "/zipCode", "/kakaoLogin", "/kakaoDelete", "/mypage", "/modMyInfoPage", "/modMyInfo").permitAll()
		.antMatchers("/qna", "/qnaWritePage", "/qnaWrite", "/qnaRead", "/qnaModPage", "/qnaMod", "/qnaDelete", "/replyPage", "/reply").permitAll()
		.antMatchers("/productDetail", "/categoryDetail", "/goodsReviewReg", "/reviewMod", "/reviewModProc", "/goodsReviewRegProc", "/reviewDel", "/order", "/orderConfirm", "/orderProc", "/orderList", "/deliStatusMod", "/cart").permitAll()
		.antMatchers("/style/**", "/script/**", "/images/**","/uploadDir/**","/qnaDir/**","/reviewDir/**","/resource/**","/inc/**").permitAll()
		.antMatchers("/userList","/userView","/goodsRegList","/goodsRegMod","/goodsReg","/goodsRegProc","/goodsModProc","/goodsDelProc","/goodsDetailReg","/goodsDetailRegProc","/adminOrderList").hasRole("ADMIN")
		.anyRequest().authenticated();
		
		http.headers().frameOptions().sameOrigin();
		
		http.formLogin()
		.loginPage("/adminLoginForm")
		.loginProcessingUrl("/security_url_check")
		.failureUrl("/adminLoginForm?error")
		.failureHandler(authFailHandler)
		.usernameParameter("sec_username")
		.passwordParameter("sec_password")
		.permitAll();

		http.logout()
		.logoutUrl("/adminlogout")
		.logoutSuccessUrl("/adminLoginForm")
		.permitAll();
		
		http.csrf().disable();
	}
	

	 @Autowired private DataSource dataSource;
	  
	  @Override protected void configure(AuthenticationManagerBuilder auth) throws
	  Exception { System.out.println(passwordEncoder.passwordEncode("1234"));
	  String sqlUser =
	  "select adminID, adminPw, enabled from admin where adminID=?"; String sqlAuth
	  = "select adminID, authority from admin where adminID=?";
	  auth.jdbcAuthentication() .dataSource(dataSource)
	 .usersByUsernameQuery(sqlUser) .authoritiesByUsernameQuery(sqlAuth)
	 .passwordEncoder(passwordEncoder.passwordEncoder); 
	  }
	 

	

}


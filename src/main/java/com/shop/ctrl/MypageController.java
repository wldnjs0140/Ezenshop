package com.shop.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.dto.KakaoMember;
import com.shop.dto.MemberDto;
import com.shop.oauth.OAuthInfo;
import com.shop.svc.MemberSvc;
import com.shop.svc.OAuthSvc;

@Controller
public class MypageController {
	
	@Autowired
	private MemberSvc memberService;
	
	private OAuthSvc oAuthSvc;
	
	@Autowired
	public MypageController(OAuthSvc oAuthSvc) {
		this.oAuthSvc = oAuthSvc;
	}
	
	// 로그인페이지
	@RequestMapping("/loginPage")
	public String loginPage(Model model) {
		model.addAttribute("CLIENT_ID", OAuthInfo.CLIENT_ID);
		model.addAttribute("REDIRECT_URL", OAuthInfo.REDIRECT_URL);
		return "mypage/login/login";
	}
	
	// 로그인
	@RequestMapping("/login")
	public String login(HttpSession ses, Model model, String uid, String upw) {
		MemberDto memberDto = memberService.login(uid, upw);
		if(memberService.login(uid, upw)!=null) {
			ses.setAttribute("unameSession", memberDto.getUname());
			ses.setAttribute("uidSession", memberDto.getUid());
			return "redirect:/";
		} else {
			model.addAttribute("login", false);
			return "mypage/login/login";
		}
	}
	
	// 카카오, 일반 로그아웃 
	@RequestMapping("/logout")
	public String login(HttpSession ses) {
		
		String accessToken = (String) ses.getAttribute("accessToken");
		
		if(accessToken!=null) {
			Long uid = Long.valueOf((String) ses.getAttribute("uidSession"));
			oAuthSvc.logout(accessToken, uid);
		} 
		ses.invalidate();
		return "redirect:/";
	}
	
	// 이용약관 동의 페이지
	@RequestMapping("/joinAgreement")
	public String joinAgreement() {
		return "mypage/join/joinAgreement";
	}
	
	// 회원가입 페이지
	@RequestMapping("/joinPage")
	public String join(Model model,String vCode) {
		model.addAttribute("vCode", vCode);
		return "mypage/join/join";
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(HttpServletRequest req) {
		memberService.join(req);
		return "redirect:/";
	}
	
	// 회원가입 아이디 중복체크
	@RequestMapping("/idCheck")
	public String idCheck(String uid, Model model) {
		if(memberService.idCheck(uid)) {
			model.addAttribute("idCheck", true);
		} else {
			model.addAttribute("idCheck", false);
		}
		return "mypage/join/idCheck";
	}
	
	// 우편번호 찾기 페이지
//	@RequestMapping("/zipCodePage")
//	public String idCheck() {
//		return "mypage/join/zipCheck";
//	}
	
	// 우편번호 찾기 페이지
	@RequestMapping("/zipCode")
	public String zipCode(Model model, String address) {
		model.addAttribute("zipCode", memberService.zipCode(address));
		model.addAttribute("address", address);
		return "mypage/join/zipCheck";
	}
	
	// 카카오 로그인, 회원가입
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(String code, HttpSession ses) {
		
		String accessToken = oAuthSvc.getAccessToken(code);
		KakaoMember kakaoMember = oAuthSvc.getClientInfo(accessToken);
		
		ses.setAttribute("unameSession", kakaoMember.properties.nickname);
		ses.setAttribute("uidSession", kakaoMember.getId()+"");
		ses.setAttribute("accessToken", accessToken);
		return "redirect:/";
	}
	// 카카오 회원탈퇴
	@RequestMapping("/kakaoDelete")
	public String kakaoDelete(HttpSession ses) {
		
		oAuthSvc.kakaoDelete((String) ses.getAttribute("accessToken"),
				Long.valueOf((String)ses.getAttribute("uidSession")));
		ses.invalidate();
		return "redirect:/";
	}
	
	
	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession ses) {
		model.addAttribute("memberInfo", memberService.getMember((String)ses.getAttribute("uidSession")));
		return "/mypage/mypage";
	}
	
	// 개인정보 페이지
	@RequestMapping("/modMyInfoPage")
	public String modMyInfoPage(String uid, Model model) {
		model.addAttribute("memberInfo", memberService.getMember(uid));
		return "mypage/myInfo/myInfo";
	}
	
	// 개인정보 수정
	@RequestMapping("/modMyInfo")
	public String modMyInfo(HttpServletRequest req) {
		memberService.modMyInfo(req);
		return "redirect:mypage";
	}
	
}

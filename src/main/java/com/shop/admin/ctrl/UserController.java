package com.shop.admin.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.svc.MemberSvc;

@Controller
public class UserController {
	
	@Autowired
	private MemberSvc memberSvc;
	
	// 회원관리페이지
	@RequestMapping("/userList")
	public String userList(Model model) {
		
		model.addAttribute("userList", memberSvc.memberList());
		return "/admin/management/userList";
	}
	
	//회원정보 상세보기 
	@RequestMapping("/userView")
	public String userView(HttpServletRequest req, Model model) {
		try {
			
			String uid = req.getParameter("uid");
			model.addAttribute("userView", memberSvc.getMember(uid));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "/admin/management/userView";
	}
	
	@RequestMapping("userMod")
	public String userMod(HttpServletRequest req) {
		String uid = req.getParameter("uid");
		memberSvc.modUser(req);
		
		return "redirect:userView?uid="+uid;
	}
	
	@RequestMapping("userDel")
	public String userDel(HttpServletRequest req) {
		String uid = req.getParameter("uid");
		memberSvc.kakaoDelete(uid);
		return "redirect:userList";
	}
	
}

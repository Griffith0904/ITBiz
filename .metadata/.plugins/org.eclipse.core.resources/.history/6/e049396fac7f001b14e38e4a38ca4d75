package kr.co.hojeon.controllers;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hojeon.beans.UserBean;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean) {
		System.out.println("★★★★★★★★★★ in login ★★★★★★★★★★");
		return "user/login";
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		return "user/not_login";
	}
}

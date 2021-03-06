package kr.co.hojeon.controllers;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService us;
	
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
	
	@PostMapping("/trylogin")
	public String trylogin(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean, BindingResult result) {
		if (result.hasErrors()) {
			return "user/login";
		} else {
			us.getLoginUserInfo(tempLoginUserBean);
			
			if (loginUserBean.isUserLoginYN() == false) {
				return "user/login_fail";
			} else {
				System.out.println("★★★★★★★★★★ login OK ★★★★★★★★★★");
				return "redirect:/main";
			}
		}
	}
	
	@GetMapping("/logout")
	public String logout() {
		loginUserBean.setUserLoginYN(false);
		return "/user/logout";
	}
}

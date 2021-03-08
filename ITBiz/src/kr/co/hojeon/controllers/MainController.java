package kr.co.hojeon.controllers;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.hojeon.beans.UserBean;

@Controller
public class MainController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main() {
		if (loginUserBean.isUserLoginYN()) {
			return "mainpage";			
		} else {
			System.out.println("★★★★★★★★ in MainController ★★★★★★★★★★★★★★");
			return "redirect:/user/login";
		}
		
	}
}

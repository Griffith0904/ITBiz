package kr.co.hojeon.controllers;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.hojeon.beans.UserBean;

@Controller
public class MainController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main(Model model) {
		System.out.println("★★★★★★★★★★ main() in MainController ★★★★★★★★★★★★");
		
		model.addAttribute("loginUserBean", loginUserBean);
		if (loginUserBean.isUserLoginYN()) {
			return "mainpage";			
		} else {
			return "redirect:/user/login";
		}
		
	}
}

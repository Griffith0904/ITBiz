package kr.co.hojeon.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.BizDailyService;

@Controller
public class MainController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BizDailyService bds;
	
	@GetMapping("/main")
	public String main(Model model) {
		System.out.println("★★★★★★★★★★ main() in MainController ★★★★★★★★★★★★");
		
		model.addAttribute("loginUserBean", loginUserBean);
		if (loginUserBean.isUserLoginYN() == false) {
			return "redirect:/user/login";
		}
		
		List<BDListFromMainBean> listbfm = bds.getBizDailyStatusForMain();
		
		model.addAttribute("listbfm", listbfm);

		return "mainpage";
		
	}
}

package kr.co.hojeon.controllers;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import kr.co.hojeon.services.MainPageService;

@Controller
public class MainController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private MainPageService mps;
	
	@GetMapping("/main")
	public String main(HttpServletRequest request, Model model) {
		System.out.println("★★★★★★★★★★ main() in MainController ★★★★★★★★★★★★");
		
		model.addAttribute("loginUserBean", loginUserBean);
		if (loginUserBean.isUserLoginYN() == false) {
			return "redirect:/user/login";
		}
		
		List<BDListFromMainBean> listbfm = mps.getBizDailyStatusForMain();
		
		model.addAttribute("listbfm", listbfm);

		
		List<HashMap<String, Object>> lhso = mps.searchFindWorkForTeam();
		
		model.addAttribute("workforteam", lhso);
		
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", loginUserBean.getEmpname() + " " + loginUserBean.getJpname());
		
		return "mainpage";
		
	}
}

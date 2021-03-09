package kr.co.hojeon.controllers;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hojeon.beans.UserBean;

@Controller
@RequestMapping("/biz")
public class BizController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/dailyRgst")
	public String dailyRgst() {
		return "biz/dailyRgst";
	}
	
	@GetMapping("/dailyList")
	public String dailyList() {
		return "biz/dailyList";
	}
}
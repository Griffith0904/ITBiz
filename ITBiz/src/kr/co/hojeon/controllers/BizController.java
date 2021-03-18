package kr.co.hojeon.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hojeon.beans.TableUsrBizTwDetail;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.BizWeeklyService;
import kr.co.hojeon.subclasses.GetSysDateInfo;

@Controller
@RequestMapping("/biz")
public class BizController {
	private static final String List = null;
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BizWeeklyService bws;
	
	@GetMapping("/dailyRgst")
	public String dailyRgst() {
		return "biz/dailyRgst";
	}
	
	@GetMapping("/dailyList")
	public String dailyList() {
		return "biz/dailyList";
	}
	
	//주간 업무 보고 등록
	@GetMapping("/weeklyRgst")
	public String weeklyRgst(Model model) {
		ArrayList<HashMap<String, Integer>> search_year = new ArrayList<HashMap<String, Integer>>();
		ArrayList<HashMap<String, Integer>> search_week = new ArrayList<HashMap<String, Integer>>();
		
		HashMap<String, Integer> yd1 = new HashMap<String, Integer>();
		HashMap<String, Integer> yd2 = new HashMap<String, Integer>();
		HashMap<String, Integer> wd = new HashMap<String, Integer>();
		
		SimpleDateFormat format = new SimpleDateFormat("yy"); 
		
		Date now = new Date(); 
		String now_dt = format.format(now); 
		int year_last = Integer.parseInt(now_dt);
		for (int i=0; i<3; i++) {
			//yd.put("20" + Integer.toString(Integer.parseInt(now_dt) - i), Integer.parseInt(now_dt) - i);
			
			HashMap<String, Integer> yd_dump = new HashMap<String, Integer>();
			yd_dump.put("year_value", year_last - i);
			yd_dump.put("year_string", Integer.parseInt(now_dt) - i + 2000);
			search_year.add(yd_dump);
		}
		
		for (int i=1; i<=52; i++) {
			HashMap<String, Integer> wd_dump = new HashMap<String, Integer>();
			wd_dump.put("week_value", i);
			search_week.add(wd_dump);
		}
		
		GetSysDateInfo gsdi = new GetSysDateInfo();
		
		int this_week_num = gsdi.getTodayWeeklyNum();
		System.out.printf("This Week Number : %d\n", this_week_num);
		model.addAttribute("search_year", search_year);
		model.addAttribute("search_week", search_week);
		model.addAttribute("this_week_num", this_week_num);
		
		return "biz/weeklyRgst";
	}
	
	//주간 업무 대분류 등
	@GetMapping("/weeklySubjectRgst")
	public String weeklySubjectRgst() {
		return "biz/weeklySubjectRgst";
	}
	
	//주간 업무 보고 통합 조회
	@GetMapping("/weeklyAllList")
	public String weeklyAllList() {
		return "biz/weeklyAllList";
	}
	
	
}

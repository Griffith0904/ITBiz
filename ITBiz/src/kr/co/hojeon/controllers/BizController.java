package kr.co.hojeon.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hojeon.beans.BizWeekScope;
import kr.co.hojeon.beans.BizWeeklyBasicSubject;
import kr.co.hojeon.beans.TableUsrBizTwDetail;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.BizDailyService;
import kr.co.hojeon.services.BizWeeklyService;
import kr.co.hojeon.services.CommonService;
import kr.co.hojeon.subclasses.GetSysDateInfo;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/biz")
public class BizController {
	private static final String List = null;
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BizWeeklyService bws;
	
	@Autowired
	private BizDailyService bds;
	
	@Autowired
	private CommonService cms;
	
	@Autowired
	private RestAPIController restapi;
	
	@GetMapping("/dailyRgst")
	public String dailyRgst(Model model) {
		//ArrayList<HashMap<String, Object>> search_rec_user = new ArrayList<HashMap<String, Object>>();
		//ArrayList<HashMap<String, Object>> search_work_status = new ArrayList<HashMap<String, Object>>();
		
		List<HashMap<String, Object>> search_work_status = cms.getBaseData("W0002", "Y");
		List<HashMap<String, Object>> search_work_status_noall = cms.getBaseData("W0002", "N");
		List<HashMap<String, Object>> search_rec_user = cms.getITUserInfo("Y");
		List<BizWeeklyBasicSubject> search_subject = bws.getJustWeekBasicSubject();
		/*
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
				
		Date time = new Date();
				
		String times = format.format(time);
		
		System.out.println(times);
		*/
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //System.out.println("current: " + df.format(cal.getTime()));
        model.addAttribute("getToday", df.format(cal.getTime()));
        
        cal.add(Calendar.MONTH, -3);
        model.addAttribute("getBeforeday", df.format(cal.getTime()));
        
		model.addAttribute("search_work_status_noall", search_work_status_noall);
		model.addAttribute("search_work_status", search_work_status);
		model.addAttribute("search_rec_user", search_rec_user);		
		model.addAttribute("lub", loginUserBean);
		model.addAttribute("search_subjects", search_subject);
		//JSONObject asdf = JSONObject.fromObject(search_subject);
		//JSONObject asdf = JSONObject.fromObject(search_subject);
		//JSONObject asdf = JSONObject.fromObject(search_subject);
		//model.addAttribute("search_subject", search_subject);
		//JSONObject jobj = JSONObject.fromObject(search_subject);
		//JSONArray ja = new JSONArray();
		System.out.println("※※※※※※※※※※※※※※※※※※※※※※※※※※※※※");
		//System.out.println(search_subject);
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
	
	//주간 업무 대분류 등록(Subject)
	@GetMapping("/weeklySubjectRgst")
	public String weeklySubjectRgst() {
		//List<HashMap<String, Object>> searchData = bws.searchWeeklySubject();
		
		//model.addAttribute("weeklysubject", searchData);
		
		return "biz/weeklySubjectRgst";
	}
	
	//주간 업무 보고 통합 조회
	@GetMapping("/weeklyAllList")
	public String weeklyAllList() {
		return "biz/weeklyAllList";
	}
	
	//@GetMapping("/weeklyReportPOP")
	@PostMapping("/weeklyReportPOP")
	public void weeklyReportPOP(@RequestParam("form_year_num") int year_num,
		 	  					@RequestParam("form_week_num") int week_num,
		 	  					Model model) {
		System.out.println("★★★★★★★★★★ weeklyReportPOP in BizController ★★★★★★★★★★");
		/*
		paramterMap.put("AAA",aaa); //key value 형태의 parameterMap을 만듭니다.

		JasperReport jasperReport = JasperCompileManager.compileReport(session.getServletContext().getRealPath("/WEB-INF/jasper/reports/issuer_report.jrxml")); //..jrxml의 경로를 잡아줍니다.

		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameterMap, DriverManager.getConnection("jdbc:oracle:thin:@!!!:###:bbb","aaa","ccc")); //디비정보를 넣어주세요.

		ServletOutputStream sos=response.getOutputStream();
			    			response.setHeader("Content-disposition", "attachment; filename=" + "이름.pdf");
			    			JasperExportManager.exportReportToPdfStream(jasperPrint, sos);
	    */
		//return "biz/weeklyReportPOP";
		System.out.println(year_num);
		System.out.println(week_num);
		String lastWeekPlan = restapi.getLastWeekPlaner(year_num, week_num, 1);
		String thisWeekPlan = restapi.getLastWeekPlaner(year_num, week_num, 2);
		String nextWeekPlan = restapi.getLastWeekPlaner(year_num, week_num, 3);
		
		BizWeekScope bwsList = restapi.searchWeekScopeAll(year_num, week_num);
		
		System.out.println(lastWeekPlan);
		model.addAttribute("lastWeek", lastWeekPlan);
		model.addAttribute("thisWeek", thisWeekPlan);
		model.addAttribute("nextWeek", nextWeekPlan);
		model.addAttribute("bwsList", bwsList);
		model.addAttribute("lub", loginUserBean);
	}
	
	// 개별 항목 등록 업무 Master 저장
	@RequestMapping(value="/saveDailyMasterData", method=RequestMethod.POST)
	@ResponseBody
	public String saveDailyMasterData(@RequestBody List<Map<String, Object>> listmap) throws Exception{
		System.out.println("★★★★★★★★ in saveDailyMasterData ★★★★★★★★");
		//String[] bws_content = request.getParameterValues("bws_content");
		//System.out.println(listmap.size());
		int result = bds.saveDailyMasterData(listmap);
		return Integer.toString(result);
	}
	
	// 개별 항목 등록 업무 배치자 저장
	@RequestMapping(value="/saveDailyExecData", method=RequestMethod.POST)
	@ResponseBody
	public String saveDailyExecData(@RequestBody List<Map<String, Object>> listmap) throws Exception{
		System.out.println("★★★★★★★★ in saveDailyExecData ★★★★★★★★");
		//String[] bws_content = request.getParameterValues("bws_content");
		//System.out.println(listmap.size());
		int result = bds.saveDailyExecData(listmap);
		return Integer.toString(result);
	}
	
	// 개별 항목 등록 업무 Detail 저장
	@RequestMapping(value="/saveDailyDetailData", method=RequestMethod.POST)
	@ResponseBody
	public String saveDailyDetailData(@RequestBody List<Map<String, Object>> listmap) throws Exception{
		System.out.println("★★★★★★★★ in saveDailyExecData ★★★★★★★★");
		//String[] bws_content = request.getParameterValues("bws_content");
		//System.out.println(listmap.size());
		int result = bds.saveDailyDetailData(listmap);
		return Integer.toString(result);
	}
}

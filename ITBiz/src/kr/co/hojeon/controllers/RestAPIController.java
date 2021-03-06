package kr.co.hojeon.controllers;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.BizWeekScope;
import kr.co.hojeon.beans.BizWeeklyBasicSubject;
import kr.co.hojeon.beans.BizWeeklySubject;
import kr.co.hojeon.beans.TableUsrBizTwDetail;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.BizDailyService;
import kr.co.hojeon.services.BizWeeklyService;
import kr.co.hojeon.services.CommonService;
import kr.co.hojeon.services.MainPageService;

@RestController
public class RestAPIController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private MainPageService mps;
	
	@Autowired
	private BizWeeklyService bws;
	
	@Autowired
	private BizDailyService bds;
	
	@Autowired
	private CommonService cms;
	
	@GetMapping("/main/searchAllDataFromStatus/{work_status}")
	public List<BizDailyMasterBean> searchAllDataFromStatus(@PathVariable String work_status) {
		System.out.println("★★★★★★★★★★ searchAllDataFromStatus in RestAPIController ★★★★★★★★★★★★");
		System.out.println(work_status);
		return mps.searchAllDataFromStatusList(work_status);
	}
	
	@GetMapping("/main/searchAllDataByMonthly")
	public List<HashMap<String, Object>> searchAllDataByMonthly() {
		List<HashMap<String, Object>> md = (List<HashMap<String, Object>>)mps.searchAllDataByMonthly();
		System.out.println(md);
		return mps.searchAllDataByMonthly();
	}
	
	@GetMapping("/main/searchFindWorkForTeam")
	public List<HashMap<String, Object>> searchFindWorkForTeam() {
		return mps.searchFindWorkForTeam();
	}
	
	//@GetMapping("/biz/getLastWeekPlaner")
	@RequestMapping(value="/biz/getLastWeekPlaner", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String getLastWeekPlaner(@RequestParam("search_year") int search_year, @RequestParam("search_week") int search_week, @RequestParam("search_type") int search_type) {
		System.out.println("★★★★★★★★★★ getLastWeekPlaner in RestAPIController ★★★★★★★★★★");
		System.out.println(search_year + ", " + search_week);
		
		String rtn = bws.getLastWeekPlaner(search_year, search_week, search_type);
		
		String[] change_target = rtn.split("\\n");
		
		String new_all_string = "";
		for (int i=0; i < change_target.length; i++) {
			
			String row_txt = change_target[i];
			//System.out.println("★★★★--- " + row_txt + " ---★★★★");
			
			row_txt = row_txt.replace("\r\n", "");
			row_txt = row_txt.replace("\r", "");
			row_txt = row_txt.replace("\n", "");
			row_txt = row_txt.replace("\n\r", "");
			//System.out.println("★★★★=== " + row_txt + " ===★★★★");
			
			if (row_txt.length() != 0) {
				if (row_txt.substring(0, 1).equals("◈")) {
					if (i != 0) {
						new_all_string = new_all_string + "\r\r" + row_txt;
					} else {
						new_all_string = row_txt;
					}
					
				} else {
					new_all_string = new_all_string + "\r     " + row_txt;
				}
			}
		}
		return new_all_string;
	}
	
	@GetMapping("/biz/getThisWeekSubject")
	public List<BizWeeklySubject> getThisWeekSubject(@RequestParam("search_year") int search_year, @RequestParam("search_week") int search_week) {
		System.out.println("★★★★★★★★★★ getThisWeekSubject in RestAPIController ★★★★★★★★★★");
		System.out.println(search_year + ", " + search_week);
		
		return bws.getRegistedThisWorkSubject(search_year, search_week);
	}
	
	@GetMapping("/biz/getNextWeekSubject")
	public List<BizWeeklySubject> getNextWeekSubject(@RequestParam("search_year") int search_year, @RequestParam("search_week") int search_week) {
		System.out.println("★★★★★★★★★★ getThisWeekSubject in RestAPIController ★★★★★★★★★★");
		System.out.println(search_year + ", " + search_week);
		
		return bws.getRegistedNextWorkSubject(search_year, search_week);
	}
	
	@GetMapping("/biz/getJustWeekBasicSubject")
	public List<BizWeeklyBasicSubject> getJustWeekBasicSubject() {		
		return bws.getJustWeekBasicSubject();
	}
	
	//주간 보고 금/차주 통합 Insert
	@PostMapping("/biz/insertUsrBizWeeklyData")
	public List<BizWeeklySubject> insertUsrBizWeeklyData(@RequestParam("year_num") int year_num,
									   @RequestParam("week_num") int week_num,
									   @RequestParam("bws_seq") int bws_seq,
									   @RequestParam("insert_type") int insert_type) {
		//data:{'year_num':main_year_num, 'week_num':main_week_num, 'bws_seq':bws_seq, 'insert_type':subject_modal},
		System.out.println("★★★★★★★★ in insertUsrBizWeeklyData ★★★★★★★★");
		
		TableUsrBizTwDetail tubt = new TableUsrBizTwDetail();
		
		tubt.setYear_num(year_num);
		tubt.setWeek_num(week_num);
		tubt.setWork_user(loginUserBean.getUserid());
		tubt.setBws_seq(bws_seq);
		tubt.setWk_user(loginUserBean.getUserid());
		
		if (insert_type == 1) {
			// 금주
			bws.insertUsrBizWeeklyDataForThisWeek(tubt);
			return getThisWeekSubject(year_num, week_num);
		} else if (insert_type == 2) {
			// 차주
			bws.insertUsrBizWeeklyDataForNextWeek(tubt);
			return getNextWeekSubject(year_num, week_num);
		}
		
		List<BizWeeklySubject> nulls = new ArrayList<BizWeeklySubject>();
		return nulls;
	}
	
	// 해당 bws_seq 별 하위 입력 텍스트 구하기
	//@PostMapping("/biz/getUsrBizWeeklyContent")
	@RequestMapping(value="/biz/getUsrBizWeeklyContent", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String getUsrBizWeeklyContent(@RequestParam("year_num") int year_num,
										   @RequestParam("week_num") int week_num,
										   @RequestParam("bws_seq") int bws_seq,
										   @RequestParam("search_type") int search_type) {
		
		String content_txt = bws.getUsrBizWeeklyContent(year_num, week_num, bws_seq, search_type);
		

		
		// 이스케이프 문자 역슬래쉬 (\)
		// 그냥 쓰면 에러가나는데 try ~ catch 문으로 처리해서 오류쪽 부분
		// 명시해주어야 에러가 사라짐.
		/*
		try {
			//File text = new File("C:\\FileLineTest\\testFile.txt");
			//FileReader textRead = new FileReader(text);
			BufferedReader bfReader = new BufferedReader(content_txt);
			String line = "";
			List<String> lineArray = new ArrayList<String>();
			// null 이 아닐때까지 반복한다.
			while ( (line = bfReader.readLine()) != null ) {
				// System.out.println(line); 출력
				// 리스트 배열에 line 한줄한줄씩 추가.
				lineArray.add(line);
			}
			for(int i=0; i<lineArray.size(); i++) {
				System.out.println(lineArray.get(i));
			}
		} catch (FileNotFoundException e) {
			// 파일 없거나 이름 안맞으면 여기걸림.
			e.printStackTrace();
			System.out.println("파일이 존재하지않습니다. 경로를 확인해주세요");
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		return content_txt;
	}
	
	@PostMapping("/biz/deleteUsrBizWeeklyDetail")
	public List<BizWeeklySubject> deleteUsrBizWeeklyDetail(@RequestParam("year_num") int year_num,
														   @RequestParam("week_num") int week_num,
														   @RequestParam("bws_seq") int bws_seq,
														   @RequestParam("delete_type") int delete_type) {
		
		bws.deleteUsrBizWeeklyContent(year_num, week_num, bws_seq, delete_type);
		
		if (delete_type == 1) {
			// 금주
			return getThisWeekSubject(year_num, week_num);
		} else if (delete_type == 2) {
			// 차주
			return getNextWeekSubject(year_num, week_num);
		}
		
		List<BizWeeklySubject> nulls = new ArrayList<BizWeeklySubject>();
		return nulls;
	}
	
	@PostMapping("/biz/saveUsrBizWeeklyContentData")
	public String deleteUsrBizWeeklyDetail(@RequestParam("year_num") int year_num,
										   @RequestParam("week_num") int week_num,
										   @RequestParam("bws_seq") int bws_seq,
										   @RequestParam("content") String content,
										   @RequestParam("insert_type") int insert_type) {
		
		bws.saveUsrBizWeeklyContentData(year_num, week_num, bws_seq, content, insert_type);
		
		return "OK";
	}
	
	@PostMapping("/biz/copyUsrBizWeekData")
	public List<BizWeeklySubject> copyUsrBizWeekData(@RequestParam("year_num") int year_num,
										   			@RequestParam("week_num") int week_num,
										   			@RequestParam("copy_type") int copy_type) {
		bws.copyToTargetWeelyData(year_num, week_num, copy_type);
		
		if (copy_type == 1) {
			// 금주
			return getThisWeekSubject(year_num, week_num);
		} else if (copy_type == 2) {
			// 차주
			return getNextWeekSubject(year_num, week_num);
		}
		
		List<BizWeeklySubject> nulls = new ArrayList<BizWeeklySubject>();
		return nulls;
	}
	
	@PostMapping("/biz/searchBaseDateScope")
	public String searchBaseDateScope(@RequestParam("search_year") int year_num,
								 	  @RequestParam("search_week") int week_num) {
		String a = bws.searchBaseDateScope(year_num, week_num);
		System.out.println(a);
		return bws.searchBaseDateScope(year_num, week_num);
	}
	
	@PostMapping("/biz/searchWeekScopeAll")
	public BizWeekScope searchWeekScopeAll(@RequestParam("search_year") int year_num,
								 	  @RequestParam("search_week") int week_num) {
		return bws.searchWeekScopeAll(year_num, week_num);
	}
	
	@GetMapping("/biz/searchAllSubjectList")
	public List<HashMap<String, Object>> searchAllSubjectList() {
		return bws.searchWeeklySubject();
	}
	
	@RequestMapping(value="/biz/saveWeeklySubjectData", method=RequestMethod.POST)
	@ResponseBody
	public String saveWeeklySubjectData(@RequestBody List<Map<String, Object>> listmap) throws Exception{
		System.out.println("★★★★★★★★ in saveWeeklySubjectData ★★★★★★★★");
		//String[] bws_content = request.getParameterValues("bws_content");
		//System.out.println(listmap.size());
		int result = bws.saveWeeklySubjectData(listmap);
		return Integer.toString(result);
	}
	
	
	@PostMapping("/biz/getBizDailyList")
	public List<HashMap<String, Object>> getBizDailyData(@RequestParam("rec_user") String rec_user,
								@RequestParam("empname") String empname,
								@RequestParam("req_subject") String req_subject,
								@RequestParam("sdate") String sdate,
								@RequestParam("edate") String edate,
								@RequestParam("work_status") String work_status) {
		
		return bds.getBizDailyList(rec_user, empname, req_subject, sdate, edate, work_status);
	}
	
	@PostMapping("/biz/getBizDailySubAll")
	public Map<String, Object> getBizDailyExecuter(@RequestParam("bd_seq") String bd_seq) {
		List<HashMap<String, Object>> data1 = bds.getBizDailyExecuter(bd_seq);
		List<HashMap<String, Object>> data2 = bds.getBizDailyDetail(bd_seq);
		
		Map<String, Object> data_all = new HashMap<String, Object>();
		
		data_all.put("data1", data1);
		data_all.put("data2", data2);
		//return bds.getBizDailyExecuter(bd_seq);
		return data_all;
	}
	
	@PostMapping("/biz/getBizDailySubExec")
	public List<HashMap<String, Object>> getBizDailySubExec(@RequestParam("bd_seq") String bd_seq) {
		return bds.getBizDailyExecuter(bd_seq);
	}
	
	@PostMapping("/biz/getBizDailySubDetail")
	public List<HashMap<String, Object>> getBizDailySubDetail(@RequestParam("bd_seq") String bd_seq) {
		return bds.getBizDailyDetail(bd_seq);
	}
	
	
	@PostMapping("/biz/getITUserInfoFromCheck")
	public List<HashMap<String, Object>> getITUserInfoFromCheck(@RequestParam(value="reg_user", required=false) String[] reg_user) {
		System.out.println("★★★★★★★★★★★★ getITUserInfoFromCheck ★★★★★★★★★★★★");
		//System.out.println(reg_user.length);
		return cms.getITUserInfoFromCheck(reg_user);
	}
	
	@PostMapping("/user/getUserListByDeptEmp")
	public List<HashMap<String, Object>> getUserListByDeptEmp(@RequestParam("deptname") String deptname,
															  @RequestParam("empname") String empname) {
		
		return cms.getUserListByDeptEmp(deptname, empname);
	}
}	

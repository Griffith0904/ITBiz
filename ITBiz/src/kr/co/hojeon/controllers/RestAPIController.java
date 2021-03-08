package kr.co.hojeon.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.services.BizDailyService;

@RestController
public class RestAPIController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BizDailyService bds;
	
	@GetMapping("/main/searchAllDataFromStatus/{work_status}")
	public List<BizDailyMasterBean> searchAllDataFromStatus(@PathVariable String work_status) {
		System.out.println("★★★★★★★★★★ searchAllDataFromStatus in RestAPIController ★★★★★★★★★★★★");
		System.out.println(work_status);
		return bds.searchAllDataFromStatusList(work_status);
	}
}

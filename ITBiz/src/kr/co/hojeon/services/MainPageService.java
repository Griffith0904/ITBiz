package kr.co.hojeon.services;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.MainSearchDAO;

@Service
public class MainPageService {
	@Autowired
	private MainSearchDAO msd;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public List<BDListFromMainBean> getBizDailyStatusForMain() {
		return msd.getBizDailyStatusForMain(loginUserBean.getEmpid());
	}
	
	public List<BizDailyMasterBean> searchAllDataFromStatusList(String work_status) {
		List<BizDailyMasterBean> listbdm = msd.searchAllDataFromStatusList(loginUserBean.getEmpid(), work_status);
		return listbdm;
	}
	
	public List<HashMap<String, Object>> searchAllDataByMonthly() {
		//HashMap<String, Object> hso = new HashMap<String, Object>();
		return msd.searchAllDataByMonthly(loginUserBean.getEmpid());
	}
	
	public List<HashMap<String, Object>> searchFindWorkForTeam() {
		//HashMap<String, Object> hso = new HashMap<String, Object>();
		return msd.searchFindWorkForTeam();
	}
}

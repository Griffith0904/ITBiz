package kr.co.hojeon.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.BizDailyDAO;

@Service
public class BizDailyService {
	@Autowired
	private BizDailyDAO bdd;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public List<BDListFromMainBean> getBizDailyStatusForMain() {
		return bdd.getBizDailyStatusForMain(loginUserBean.getUserid());
	}
	
	public List<BizDailyMasterBean> searchAllDataFromStatusList(String work_status) {
		List<BizDailyMasterBean> listbdm = bdd.searchAllDataFromStatusList(loginUserBean.getUserid(), work_status);
		return listbdm;
	}
}
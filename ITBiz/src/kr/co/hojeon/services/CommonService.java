package kr.co.hojeon.services;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.CommonDAO;

@Service
public class CommonService {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private CommonDAO cd;
	
	public List<HashMap<String, Object>> getBaseData(String bch_code, String all_yn) {
		
		return cd.getBaseData(bch_code, all_yn);
	}
	
	public List<HashMap<String, Object>> getITUserInfo(String all_yn) {
		return cd.getITUserInfo(all_yn);
	}
	
	public List<HashMap<String, Object>> getITUserInfoFromCheck(String[] reg_user) {
		return cd.getITUserInfoFromCheck(reg_user);
	}
}

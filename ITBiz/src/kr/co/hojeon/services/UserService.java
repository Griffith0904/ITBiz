package kr.co.hojeon.services;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.UserDAO;

@Service
public class UserService {
	@Autowired
	private UserDAO ud;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
		UserBean checkLoginUserBean = ud.getLoginUserInfo(tempLoginUserBean);
		
		if (checkLoginUserBean != null) {
			loginUserBean.setDbseq(checkLoginUserBean.getDbseq());
			loginUserBean.setDeptname(checkLoginUserBean.getDeptname());
			loginUserBean.setEmpid(checkLoginUserBean.getEmpid());
			loginUserBean.setEmpname(checkLoginUserBean.getEmpname());
			loginUserBean.setEmail(checkLoginUserBean.getEmail());
			loginUserBean.setUserid(checkLoginUserBean.getUserid());
			loginUserBean.setTypename(checkLoginUserBean.getTypename());
			loginUserBean.setDbname(checkLoginUserBean.getDbname());
			loginUserBean.setJpname(checkLoginUserBean.getJpname());
			loginUserBean.setJdname(checkLoginUserBean.getJdname());
			loginUserBean.setJoname(checkLoginUserBean.getJoname());
			loginUserBean.setDbseq(checkLoginUserBean.getDbseq());
			loginUserBean.setUserpw(checkLoginUserBean.getUserpw());
			loginUserBean.setUserLoginYN(true);
		}
	}
}

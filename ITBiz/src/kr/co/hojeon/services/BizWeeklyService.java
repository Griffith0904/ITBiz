package kr.co.hojeon.services;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.BizWeeklyBasicSubject;
import kr.co.hojeon.beans.BizWeeklySubject;
import kr.co.hojeon.beans.TableUsrBizTwDetail;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.BizWeeklyDAO;

@Service
public class BizWeeklyService {
	@Autowired
	private BizWeeklyDAO bwd;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public String getLastWeekPlaner(int year, int week) {
		return bwd.getLastWeekPlaner(year, week, loginUserBean.getUserid());
	}
	
	public List<BizWeeklySubject> getRegistedThisWorkSubject(int year, int week) {
		return bwd.getRegistedThisWorkSubject(year, week, loginUserBean.getUserid());
	}
	
	public List<BizWeeklySubject> getRegistedNextWorkSubject(int year, int week) {
		return bwd.getRegistedNextWorkSubject(year, week, loginUserBean.getUserid());
	}
	
	public List<BizWeeklyBasicSubject> getJustWeekBasicSubject() {
		
		return bwd.getJustWeekBasicSubject();
	}
	
	public void insertUsrBizWeeklyDataForThisWeek(TableUsrBizTwDetail tubtd) {
		bwd.insertUsrBizWeeklyDataForThisWeek(tubtd);
	}
	
	public void insertUsrBizWeeklyDataForNextWeek(TableUsrBizTwDetail tubtd) {
		bwd.insertUsrBizWeeklyDataForNextWeek(tubtd);
	}
	
	public String getUsrBizWeeklyContent(int year_num, int week_num, int bws_seq, int search_type) {
		return bwd.getUsrBizWeeklyContent(year_num, week_num, loginUserBean.getUserid(), bws_seq, search_type);
	}
	
	public void deleteUsrBizWeeklyContent(int year_num, int week_num, int bws_seq, int delete_type) {
		bwd.deleteUsrBizWeeklyContent(year_num, week_num, loginUserBean.getUserid(), bws_seq, delete_type);
	}
	
	public void saveUsrBizWeeklyContentData(int year_num, int week_num, int bws_seq, String context, int insert_type) {
		bwd.saveUsrBizWeeklyContentData(year_num, week_num, loginUserBean.getUserid(), bws_seq, context, insert_type);
	}
	
	public void copyToTargetWeelyData(int year_num, int week_num, int copy_type) {
		bwd.copyToTargetWeelyData(year_num, week_num, loginUserBean.getUserid(), copy_type);
	}
	
	public String searchBaseDateScope(int year_num, int week_num) {
		return bwd.searchBaseDateScope(year_num, week_num);
	}
}

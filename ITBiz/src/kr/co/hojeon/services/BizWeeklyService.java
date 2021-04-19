package kr.co.hojeon.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.BizWeekScope;
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
	
	public String getLastWeekPlaner(int year, int week, int search) {
		return bwd.getLastWeekPlaner(year, week, loginUserBean.getUserid(), search);
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
	
	public BizWeekScope searchWeekScopeAll(int year_num, int week_num) {
		return bwd.searchWeekScopeAll(year_num, week_num);
	}
	
	// Weekly Subject 구하기
	public List<HashMap<String, Object>> searchWeeklySubject() { 
		return bwd.searchWeeklySubject();
	}
	
	public int saveWeeklySubjectData(List<Map<String, Object>> listmap) {
		System.out.println("★★★★★★★★ in saveWeeklySubjectData Service ★★★★★★★★");
		int result = 0;
		for (int row = 0; row < listmap.size(); row++) {
			/*
			int bws_seq = 0, sort_no = 0;
			String bws_content = null, remark = null, use_yn = null, status = null;
			*/
			
			String bws_seq = null, sort_no = null, bws_content = null, remark = null, use_yn = null, status = null;
			
			for (Entry<String, Object> rowmap : listmap.get(row).entrySet()) {
				switch (rowmap.getKey()) {
					case "bws_seq" :
						bws_seq = (String) rowmap.getValue();
						break;
					case "sort_no" :
						sort_no = (String) rowmap.getValue();
						break;
					case "bws_content" :
						bws_content = (String) rowmap.getValue();
						break;
					case "remark" :
						remark = (String) rowmap.getValue();
						break;
					case "use_yn" :
						use_yn = (String) rowmap.getValue();
						break;
					case "status" :
						status = (String) rowmap.getValue();
						break;
					default :
						break;
				}
			}
			
			System.out.println("bws_seq = " + bws_seq + ", sort_no = " + sort_no + ", bws_content = " + bws_content + ", remark = " + remark + ", use_yn = " + use_yn + ", status = " + status);
			result = bwd.saveWeeklySubjectData(bws_seq, sort_no, bws_content, remark, use_yn, status, loginUserBean.getUserid());
			
		}
		return result;
	}
}

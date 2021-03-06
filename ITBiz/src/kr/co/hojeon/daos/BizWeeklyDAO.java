package kr.co.hojeon.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hojeon.beans.BizWeekScope;
import kr.co.hojeon.beans.BizWeeklyBasicSubject;
import kr.co.hojeon.beans.BizWeeklySubject;
import kr.co.hojeon.beans.TableUsrBizTwDetail;

@Repository
public class BizWeeklyDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String getLastWeekPlaner(int year, int week, String userid, int search) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year", year);
		hm.put("week", week);
		hm.put("userid", userid);
		hm.put("search", search);
		
		return sqlSessionTemplate.selectOne("biz.getLastWeekPlaner", hm);
	}
	
	public List<BizWeeklySubject> getRegistedThisWorkSubject(int year, int week, String userid) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year", year);
		hm.put("week", week);
		hm.put("userid", userid);
		
		return sqlSessionTemplate.selectList("biz.getRegistedThisWorkSubject", hm);
	}
	
	public List<BizWeeklySubject> getRegistedNextWorkSubject(int year, int week, String userid) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year", year);
		hm.put("week", week);
		hm.put("userid", userid);
		
		return sqlSessionTemplate.selectList("biz.getRegistedNextWorkSubject", hm);
	}
	
	public List<BizWeeklyBasicSubject> getJustWeekBasicSubject() {
		
		return sqlSessionTemplate.selectList("biz.getJustWeekBasicSubject");
	}
	
	public void insertUsrBizWeeklyDataForThisWeek(TableUsrBizTwDetail tubtd) {
		sqlSessionTemplate.insert("biz.insertUsrBizWeeklyDataForThisWeek", tubtd);
	}
	
	public String getUsrBizWeeklyContent(int year_num, int week_num, String work_user, int bws_seq, int search_type) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		hm.put("work_user", work_user);
		hm.put("bws_seq", bws_seq);
		hm.put("search_type", search_type);
		
		return sqlSessionTemplate.selectOne("biz.getUsrBizWeeklyContent", hm);
	}
	
	public void deleteUsrBizWeeklyContent(int year_num, int week_num, String work_user, int bws_seq, int delete_type ) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		hm.put("work_user", work_user);
		hm.put("bws_seq", bws_seq);
		hm.put("delete_type", delete_type);
		
		sqlSessionTemplate.selectOne("biz.deleteUsrBizWeeklyContent", hm);
	}
	
	public void insertUsrBizWeeklyDataForNextWeek(TableUsrBizTwDetail tubtd) {
		sqlSessionTemplate.insert("biz.insertUsrBizWeeklyDataForNextWeek", tubtd);
	}
	
	public void saveUsrBizWeeklyContentData(int year_num, int week_num, String work_user, int bws_seq, String content, int insert_type ) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		hm.put("work_user", work_user);
		hm.put("bws_seq", bws_seq);
		hm.put("content", content);
		hm.put("insert_type", insert_type);
		
		sqlSessionTemplate.insert("biz.saveUsrBizWeeklyContentData", hm);
	}
	
	public void copyToTargetWeelyData(int year_num, int week_num, String work_user, int copy_type) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		hm.put("work_user", work_user);
		hm.put("copy_type", copy_type);
		
		sqlSessionTemplate.insert("biz.copyToTargetWeelyData", hm);
	}
	
	public String searchBaseDateScope(int year_num, int week_num) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		
		return sqlSessionTemplate.selectOne("biz.searchBaseDateScope", hm);
	}
	
	public BizWeekScope searchWeekScopeAll(int year_num, int week_num) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("year_num", year_num);
		hm.put("week_num", week_num);
		
		return sqlSessionTemplate.selectOne("biz.searchWeekScopeAll", hm);
	}
	
	// Weekly Subject ?????????
	public List<HashMap<String, Object>> searchWeeklySubject() { 
		return sqlSessionTemplate.selectList("biz.searchWeeklySubject"); 
	}
	
	// Weekly Subject ?????? (??????, ??????, ??????)
	public int saveWeeklySubjectData(String bws_seq, String sort_no, String bws_content, String remark, String use_yn, String status, String userid) {
		HashMap<String, Object> input_param = new HashMap<String, Object>();
		
		input_param.put("bws_seq", bws_seq);
		input_param.put("sort_no", sort_no);
		input_param.put("bws_content", bws_content);
		input_param.put("remark", remark);
		input_param.put("use_yn", use_yn);
		input_param.put("status", status);
		input_param.put("userid", userid);
		
		return sqlSessionTemplate.insert("biz.saveWeeklySubjectData", input_param);
	}
}

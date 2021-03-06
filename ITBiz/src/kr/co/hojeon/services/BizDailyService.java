package kr.co.hojeon.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;
import kr.co.hojeon.daos.BizDailyDAO;
import kr.co.hojeon.daos.CommonDAO;

@Service
public class BizDailyService {
	@Autowired
	private BizDailyDAO bdd;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	//일별 등록 Mast 조회
	public List<HashMap<String, Object>> getBizDailyList(String rec_user, String empname, String req_subject, String sdate, String edate, String work_status) {
		return bdd.getBizDailyList(rec_user, empname, req_subject, sdate, edate, work_status);
	}
	
	// 일별 등록된 내역별 작업 배치자 조회
	public List<HashMap<String, Object>> getBizDailyExecuter(String bd_seq) {		
		return bdd.getBizDailyExecuter(bd_seq);
	}
	
	// 일별 등록된 내역별 Detail 내역 조회
	public List<HashMap<String, Object>> getBizDailyDetail(String bd_seq) {
		return bdd.getBizDailyDetail(bd_seq);
	}
	
	// 업무 Master 저장
	public int saveDailyMasterData(List<Map<String, Object>> listmap) {
		System.out.println("★★★★★★★★ in saveWeeklySubjectData Service ★★★★★★★★");
		
		return bdd.saveDailyMasterData(listmap, loginUserBean.getUserid());
	}
	
	// 배치자 저장
	public int saveDailyExecData(List<Map<String, Object>> listmap) {
		System.out.println("★★★★★★★★ in saveDailyExecData Service ★★★★★★★★");
		
		return bdd.saveDailyExecData(listmap, loginUserBean.getUserid());
	}
	
	// 업무 Detail 저장
	public int saveDailyDetailData(List<Map<String, Object>> listmap) {
		System.out.println("★★★★★★★★ in saveDailyExecData Service ★★★★★★★★");
		
		return bdd.saveDailyDetailData(listmap, loginUserBean.getUserid());
	}
}

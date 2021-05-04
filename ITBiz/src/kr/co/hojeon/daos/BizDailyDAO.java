package kr.co.hojeon.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;

@Repository
public class BizDailyDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//일별 등록 Mast 조회
	public List<HashMap<String, Object>> getBizDailyList(String rec_user, String empname, String req_subject, String sdate, String edate, String work_status) {
		HashMap<String, Object> input_parm = new HashMap<String, Object>();
		
		input_parm.put("rec_user", rec_user);
		input_parm.put("empname", empname);
		input_parm.put("req_subject", req_subject);
		input_parm.put("rec_sdate", sdate);
		input_parm.put("rec_edate", edate);
		input_parm.put("work_status", work_status);
		
		return sqlSessionTemplate.selectList("bizDaily.getBizDailyList", input_parm);
	}
	
	// 일별 등록된 내역별 작업 배치자 조회
	public List<HashMap<String, Object>> getBizDailyExecuter(String bd_seq) {		
		return sqlSessionTemplate.selectList("bizDaily.getBizDailyExecuter", bd_seq);
	}
	
	// 일별 등록된 내역별 Detail 내역 조회
	public List<HashMap<String, Object>> getBizDailyDetail(String bd_seq) {		
		return sqlSessionTemplate.selectList("bizDaily.getBizDailyDetail", bd_seq);
	}
}

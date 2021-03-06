package kr.co.hojeon.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
	
	// 일별 등록된 내역별 Detail 내역 조회
	public int saveDailyMasterData(List<Map<String, Object>> listmap, String user_id) {
		System.out.println("★★★★★★★★ in saveWeeklySubjectData Service ★★★★★★★★");
		int result = 0;
		/*
		rowdata.REC_DATE = req_date
		rowdata.REQ_SUBJECT = req_subject
		rowdata.REQ_CONTENT = req_content
		rowdata.ANL_CONTENT = anl_content
		rowdata.WORK_LEV = work_lev
		rowdata.WORK_STATUS = work_status
		rowdata.BD_SEQ = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(10)>h6').text()
		rowdata.REQ_USER = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(11)>h6').text()
		rowdata.FLAG = flag 
		rowdata.REC_USER = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(13)>h6').text()
		*/
		//System.out.println(listmap);
		for (int row = 0; row < listmap.size(); row++) {		
			HashMap<String, Object> input_parm = new HashMap<String, Object>();
			
			for (Entry<String, Object> rowmap : listmap.get(row).entrySet()) {
				System.out.println(rowmap);
				switch (rowmap.getKey()) {
					case "REC_DATE" :
						input_parm.put("REC_DATE", (String) rowmap.getValue());
						break;
					case "REQ_SUBJECT" :
						input_parm.put("REQ_SUBJECT", (String) rowmap.getValue());
						break;
					case "REQ_CONTENT" :
						input_parm.put("REQ_CONTENT", (String) rowmap.getValue());
						break;
					case "ANL_CONTENT" :
						input_parm.put("ANL_CONTENT", (String) rowmap.getValue());
						break;
					case "WORK_LEV" :
						input_parm.put("WORK_LEV", (String) rowmap.getValue());
						break;
					case "BD_SEQ" :
						input_parm.put("BD_SEQ", (String) rowmap.getValue());
						break;
					case "WORK_STATUS" :
						input_parm.put("WORK_STATUS", (String) rowmap.getValue());
						break;
					case "REQ_USER" :
						input_parm.put("REQ_USER", (String) rowmap.getValue());
						break;
					case "FLAG" :
						input_parm.put("FLAG", (String) rowmap.getValue());
						break;
					case "REC_USER" :
						input_parm.put("REC_USER", (String) rowmap.getValue());
						break;
					case "BWS_SEQ" :
						input_parm.put("BWS_SEQ", (String) rowmap.getValue());
						break;
					case "EXP_END_DATE" :
						input_parm.put("EXP_END_DATE", (String) rowmap.getValue());
						break;
					case "ACT_END_DATE" :
						input_parm.put("ACT_END_DATE", (String) rowmap.getValue());
						break;
					default :
						break;
					}
			}
			
			input_parm.put("REG_USER", user_id);
			System.out.println(input_parm);
			int rtn = sqlSessionTemplate.insert("bizDaily.saveDailyMasterData", input_parm);
			//System.out.println(row + ", " + rtn);
			if (rtn != 1) {
				System.out.println("error : " + row + ", " + rtn);
				break;
			}
			
		}
		return result;
		
	}
	
	// 일별 작업 배치자 저장
	public int saveDailyExecData(List<Map<String, Object>> listmap, String user_id) {
		System.out.println("★★★★★★★★ in saveDailyExecData DAO ★★★★★★★★");
		int result = 0;
		/*
		rowdata.BD_SEQ = Number($('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(3)>h6').text())
		rowdata.EXC_USER = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(4)').text()
		rowdata.EXC_WEIGHT = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(1)>input').val()
		rowdata.REMARK = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(2)>input').val()
		*/
		//System.out.println(listmap);
		for (int row = 0; row < listmap.size(); row++) {		
			HashMap<String, Object> input_parm = new HashMap<String, Object>();
			
			for (Entry<String, Object> rowmap : listmap.get(row).entrySet()) {
				System.out.println(rowmap);
				switch (rowmap.getKey()) {
					case "BD_SEQ" :
						input_parm.put("BD_SEQ", (Integer) rowmap.getValue());
						break;
					case "EXC_USER" :
						input_parm.put("EXC_USER", (String) rowmap.getValue());
						break;
					case "EXC_WEIGHT" :
						input_parm.put("EXC_WEIGHT", (String) rowmap.getValue());
						break;
					case "REMARK" :
						input_parm.put("REMARK", (String) rowmap.getValue());
						break;
					case "FLAG" :
						input_parm.put("FLAG", (String) rowmap.getValue());
						break;
					default :
						break;
					}
			}
			
			input_parm.put("REG_USER", user_id);
			System.out.println(input_parm);
			int rtn = sqlSessionTemplate.insert("bizDaily.saveDailyExecData", input_parm);
			//System.out.println(row + ", " + rtn);
			if (rtn != 1) {
				System.out.println("error : " + row + ", " + rtn);
				break;
			}
			
		}
		return result;
		
	}
	
	public int saveDailyDetailData(List<Map<String, Object>> listmap, String user_id) {
		System.out.println("★★★★★★★★ in saveDailyDetailData DAO ★★★★★★★★");
		int result = 0;
		/*
		rowdata.BD_SEQ = Number($('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(3)>h6').text())
		rowdata.EXC_USER = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(4)').text()
		rowdata.EXC_WEIGHT = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(1)>input').val()
		rowdata.REMARK = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(2)>input').val()
		*/
		//System.out.println(listmap);
		for (int row = 0; row < listmap.size(); row++) {		
			HashMap<String, Object> input_parm = new HashMap<String, Object>();
			
			for (Entry<String, Object> rowmap : listmap.get(row).entrySet()) {
				System.out.println(rowmap);
				switch (rowmap.getKey()) {
					case "BD_SEQ" :
						input_parm.put("BD_SEQ", (Integer) rowmap.getValue());
						break;
					case "EXC_SEQ" :
						input_parm.put("EXC_SEQ", (Integer) rowmap.getValue());
						break;
					case "EXC_USER" :
						input_parm.put("EXC_USER", (String) rowmap.getValue());
						break;
					case "EXC_CONTENT" :
						input_parm.put("EXC_CONTENT", (String) rowmap.getValue());
						break;
					case "WORK_LEV" :
						input_parm.put("WORK_LEV", (Integer) rowmap.getValue());
						break;
					case "WORK_PRC_PER" :
						input_parm.put("WORK_PRC_PER", (Integer) rowmap.getValue());
						break;
					case "WORK_STATUS" :
						input_parm.put("WORK_STATUS", (String) rowmap.getValue());
						break;
					case "ACT_END_DATE" :
						input_parm.put("ACT_END_DATE", (String) rowmap.getValue());
						break;
					case "REMARK" :
						input_parm.put("REMARK", (String) rowmap.getValue());
						break;
					case "FLAG" :
						input_parm.put("FLAG", (String) rowmap.getValue());
						break;
					default :
						break;
					}
			}
			
			input_parm.put("REG_USER", user_id);
			System.out.println(input_parm);
			int rtn = sqlSessionTemplate.insert("bizDaily.saveDailyDetailData", input_parm);
			//System.out.println(row + ", " + rtn);
			if (rtn != 1) {
				System.out.println("error : " + row + ", " + rtn);
				break;
			}
			
		}
		return result;
		
	}
}

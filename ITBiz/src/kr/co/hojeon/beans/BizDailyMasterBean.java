package kr.co.hojeon.beans;

public class BizDailyMasterBean {
	private int BD_SEQ;
	private String REC_USER;
	private String REQ_USER;
	private String REQ_SUBJECT;
	private String REQ_CONTENT;
	
	private String ANL_CONTENT;
	private int WORK_LEV;
	private String WORK_STATUS;
	private int WORK_PRC_PER;
	private String REC_DATE;
	
	private int REC_WEEK;
	private String EXP_END_DATE;
	private String ACT_END_DATE;
	private String REMARK;
	
	private String WK_DATE;
	private String WK_USER;
	private String ET_DATE;
	private String ET_USER;
	
	// 조회용
	// 이름 + 직함 (김용진 차장)
	private String REQ_EMP_NAME;
	
	public int getBD_SEQ() {
		return BD_SEQ;
	}
	public void setBD_SEQ(int bD_SEQ) {
		BD_SEQ = bD_SEQ;
	}
	public String getREC_USER() {
		return REC_USER;
	}
	public void setREC_USER(String rEC_USER) {
		REC_USER = rEC_USER;
	}
	public String getREQ_USER() {
		return REQ_USER;
	}
	public void setREQ_USER(String rEQ_USER) {
		REQ_USER = rEQ_USER;
	}
	public String getREQ_SUBJECT() {
		return REQ_SUBJECT;
	}
	public void setREQ_SUBJECT(String rEQ_SUBJECT) {
		REQ_SUBJECT = rEQ_SUBJECT;
	}
	public String getREQ_CONTENT() {
		return REQ_CONTENT;
	}
	public void setREQ_CONTENT(String rEQ_CONTENT) {
		REQ_CONTENT = rEQ_CONTENT;
	}
	public String getANL_CONTENT() {
		return ANL_CONTENT;
	}
	public void setANL_CONTENT(String aNL_CONTENT) {
		ANL_CONTENT = aNL_CONTENT;
	}
	public int getWORK_LEV() {
		return WORK_LEV;
	}
	public void setWORK_LEV(int wORK_LEV) {
		WORK_LEV = wORK_LEV;
	}
	public String getWORK_STATUS() {
		return WORK_STATUS;
	}
	public void setWORK_STATUS(String wORK_STATUS) {
		WORK_STATUS = wORK_STATUS;
	}
	public int getWORK_PRC_PER() {
		return WORK_PRC_PER;
	}
	public void setWORK_PRC_PER(int wORK_PRC_PER) {
		WORK_PRC_PER = wORK_PRC_PER;
	}
	public String getREC_DATE() {
		return REC_DATE;
	}
	public void setREC_DATE(String rEC_DATE) {
		REC_DATE = rEC_DATE;
	}
	public int getREC_WEEK() {
		return REC_WEEK;
	}
	public void setREC_WEEK(int rEC_WEEK) {
		REC_WEEK = rEC_WEEK;
	}
	public String getEXP_END_DATE() {
		return EXP_END_DATE;
	}
	public void setEXP_END_DATE(String eXP_END_DATE) {
		EXP_END_DATE = eXP_END_DATE;
	}
	public String getACT_END_DATE() {
		return ACT_END_DATE;
	}
	public void setACT_END_DATE(String aCT_END_DATE) {
		ACT_END_DATE = aCT_END_DATE;
	}
	public String getREMARK() {
		return REMARK;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	public String getWK_DATE() {
		return WK_DATE;
	}
	public void setWK_DATE(String wK_DATE) {
		WK_DATE = wK_DATE;
	}
	public String getWK_USER() {
		return WK_USER;
	}
	public void setWK_USER(String wK_USER) {
		WK_USER = wK_USER;
	}
	public String getET_DATE() {
		return ET_DATE;
	}
	public void setET_DATE(String eT_DATE) {
		ET_DATE = eT_DATE;
	}
	public String getET_USER() {
		return ET_USER;
	}
	public void setET_USER(String eT_USER) {
		ET_USER = eT_USER;
	}
	public String getREQ_EMP_NAME() {
		return REQ_EMP_NAME;
	}
	public void setREQ_EMP_NAME(String rEQ_EMP_NAME) {
		REQ_EMP_NAME = rEQ_EMP_NAME;
	}
}

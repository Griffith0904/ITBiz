package kr.co.hojeon.beans;

public class BDListFromMainBean {
	private String WORK_STATUS_CODE;
	private String WORK_STATUS_NAME;
	private int SORT_NO;
	private int WORK_CNT;
	private int ALL_CNT;
	private double CNT_PERCENT;
	
	public String getWORK_STATUS_CODE() {
		return WORK_STATUS_CODE;
	}
	public void setWORK_STATUS_CODE(String wORK_STATUS_CODE) {
		WORK_STATUS_CODE = wORK_STATUS_CODE;
	}
	public String getWORK_STATUS_NAME() {
		return WORK_STATUS_NAME;
	}
	public void setWORK_STATUS_NAME(String wORK_STATUS_NAME) {
		WORK_STATUS_NAME = wORK_STATUS_NAME;
	}
	public int getSORT_NO() {
		return SORT_NO;
	}
	public void setSORT_NO(int sORT_NO) {
		SORT_NO = sORT_NO;
	}
	public int getWORK_CNT() {
		return WORK_CNT;
	}
	public void setWORK_CNT(int wORK_CNT) {
		WORK_CNT = wORK_CNT;
	}
	public int getALL_CNT() {
		return ALL_CNT;
	}
	public void setALL_CNT(int aLL_CNT) {
		ALL_CNT = aLL_CNT;
	}
	public double getCNT_PERCENT() {
		return CNT_PERCENT;
	}
	public void setCNT_PERCENT(double cNT_PERCENT) {
		CNT_PERCENT = cNT_PERCENT;
	}
}

package kr.co.hojeon.beans;

import java.util.Date;

public class BizWeekScope {
	private int year_num;
	private int week_num;
	private Date sdate;
	private Date edate;
	private Date work_sdate;
	private Date work_edate;
	private String swork_sdate;
	private String swork_edate;
	private String snext_sdate;
	private String snext_edate;
	
	public int getYear_num() {
		return year_num;
	}
	public void setYear_num(int year_num) {
		this.year_num = year_num;
	}
	public int getWeek_num() {
		return week_num;
	}
	public void setWeek_num(int week_num) {
		this.week_num = week_num;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public Date getWork_sdate() {
		return work_sdate;
	}
	public void setWork_sdate(Date work_sdate) {
		this.work_sdate = work_sdate;
	}
	public Date getWork_edate() {
		return work_edate;
	}
	public void setWork_edate(Date work_edate) {
		this.work_edate = work_edate;
	}
	public String getSwork_sdate() {
		return swork_sdate;
	}
	public void setSwork_sdate(String swork_sdate) {
		this.swork_sdate = swork_sdate;
	}
	public String getSwork_edate() {
		return swork_edate;
	}
	public void setSwork_edate(String swork_edate) {
		this.swork_edate = swork_edate;
	}
	public String getSnext_sdate() {
		return snext_sdate;
	}
	public void setSnext_sdate(String snext_sdate) {
		this.snext_sdate = snext_sdate;
	}
	public String getSnext_edate() {
		return snext_edate;
	}
	public void setSnext_edate(String snext_edate) {
		this.snext_edate = snext_edate;
	}
	
	
}

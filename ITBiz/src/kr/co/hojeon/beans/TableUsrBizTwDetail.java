package kr.co.hojeon.beans;

import java.util.Date;

public class TableUsrBizTwDetail {
	private int year_num;
	private int week_num;
	private String work_user;
	private int bws_seq;
	private int sort_no;
	private Date wk_date;
	private String wk_user;
	private Date et_date;
	private String et_user;
	
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
	public String getWork_user() {
		return work_user;
	}
	public void setWork_user(String work_user) {
		this.work_user = work_user;
	}
	public int getBws_seq() {
		return bws_seq;
	}
	public void setBws_seq(int bws_seq) {
		this.bws_seq = bws_seq;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	public Date getWk_date() {
		return wk_date;
	}
	public void setWk_date(Date wk_date) {
		this.wk_date = wk_date;
	}
	public String getWk_user() {
		return wk_user;
	}
	public void setWk_user(String wk_user) {
		this.wk_user = wk_user;
	}
	public Date getEt_date() {
		return et_date;
	}
	public void setEt_date(Date et_date) {
		this.et_date = et_date;
	}
	public String getEt_user() {
		return et_user;
	}
	public void setEt_user(String et_user) {
		this.et_user = et_user;
	}}

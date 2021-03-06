package kr.co.hojeon.beans;

import java.io.Serializable;
import java.util.Date;

public class BizWeeklyBasicSubject implements Serializable{
	private int bws_seq;
	private String bws_content;
	private String remark;
	private String use_yn;
	private String just_me;
	private int sort_no;
	private Date wk_date;
	private String wk_user;
	private Date et_date;
	private String et_user;
	
	private int rownum;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getBws_seq() {
		return bws_seq;
	}
	public void setBws_seq(int bws_seq) {
		this.bws_seq = bws_seq;
	}
	public String getBws_content() {
		return bws_content;
	}
	public void setBws_content(String bws_content) {
		this.bws_content = bws_content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getJust_me() {
		return just_me;
	}
	public void setJust_me(String just_me) {
		this.just_me = just_me;
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
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
}

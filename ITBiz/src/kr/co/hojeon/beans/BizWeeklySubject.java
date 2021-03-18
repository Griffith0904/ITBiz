package kr.co.hojeon.beans;

public class BizWeeklySubject {
	private int sort_no;
	private int bws_seq;
	private String bws_content;
	
	private int year_num;
	private int week_num;
	private String work_user;
	
	private int rownum;
	
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
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
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	
}
